unit AhoCorasickMain;

interface

{$REGION 'Region uses'}

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AhoCorasick, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ExtDlgs, System.ImageList,
  Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection, System.IOUtils,
  System.Diagnostics, System.Threading, System.UITypes;
{$ENDREGION}

type
  TfrmAhoCorasickMain = class(TForm)
    btnAhoCorasickMultiThread: TButton;
    btnSimpleAhoCorasick: TButton;
    edtFileName: TButtonedEdit;
    edtLog: TMemo;
    ImageCollection1: TImageCollection;
    lblFileName: TLabel;
    lbPattern: TListBox;
    OpenTextFileDialog: TOpenTextFileDialog;
    pnlBottom: TPanel;
    VirtualImageList1: TVirtualImageList;
    procedure btnAhoCorasickMultiThreadClick(Sender: TObject);
    procedure btnSimpleAhoCorasickClick(Sender: TObject);
    procedure edtFileNameRightButtonClick(Sender: TObject);
  private
    function AhoCorasickSearch(const aText: string; const aPattern: TArray<string>): TArray<string>;
  public
    { Public declarations }
  end;

var
  frmAhoCorasickMain: TfrmAhoCorasickMain;

implementation

{$R *.dfm}

procedure TfrmAhoCorasickMain.btnSimpleAhoCorasickClick(Sender: TObject);
var
  AhoCorasickObj: TAhoCorasick;
  ResList: TArray<string>;
  SW: TStopwatch;
  Text: string;
begin
  if not TFile.Exists(edtFileName.Text) then
  begin
    Vcl.Dialogs.MessageDlg('File not exists!', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
    Exit;
  end;

  edtLog.Lines.Add('');
  edtLog.Lines.Add('Simple Aho-Corasick');
  Text := TFile.ReadAllText(edtFileName.Text);
  SW := TStopwatch.StartNew;
  SW.Start;

  AhoCorasickObj := TAhoCorasick.Create;
  try
    for var i := 0 to lbPattern.Items.Count - 1 do
      AhoCorasickObj.AddPattern(lbPattern.Items[i]);

    AhoCorasickObj.Build;
    ResList := AhoCorasickObj.Search(Text);
    SW.Stop;
    edtLog.Lines.Add(Format('End: %d ms', [SW.ElapsedMilliseconds]));
    edtLog.Lines.Add('Result');

    edtLog.Lines.AddStrings(ResList);
  finally
    FreeAndNil(AhoCorasickObj);
  end;
end;

function TfrmAhoCorasickMain.AhoCorasickSearch(const aText: string; const aPattern: TArray<string>): TArray<string>;
var
  AhoCorasickObj: TAhoCorasick;
  SW: TStopwatch;
  ResList: TArray<string>;
begin
  SW := TStopwatch.StartNew;
  SW.Start;
  AhoCorasickObj := TAhoCorasick.Create;
  try
    for var i := Low(aPattern) to High(aPattern) do
      AhoCorasickObj.AddPattern(aPattern[i]);
    AhoCorasickObj.Build;
    Result := AhoCorasickObj.Search(aText);
    SW.Stop;
    ResList := Result;
    TThread.Queue(nil,
      procedure()
      begin
        edtLog.Lines.AddStrings(ResList);
        edtLog.Lines.Add(Format('Duration of thread : %d ms', [SW.ElapsedMilliseconds]));
      end);
  finally
    FreeAndNil(AhoCorasickObj);
  end;
end;

procedure TfrmAhoCorasickMain.btnAhoCorasickMultiThreadClick(Sender: TObject);
var
  Patterns: TArray<string>;
  Tasks: array of ITask;
  Text: string;
begin
  if not TFile.Exists(edtFileName.Text) then
  begin
    Vcl.Dialogs.MessageDlg('File not exists!', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
    Exit;
  end;

  Patterns := lbPattern.Items.ToStringArray;
  edtLog.Lines.Add('');
  edtLog.Lines.Add('MultiThread Aho-Corasick');
  Text := TFile.ReadAllText(edtFileName.Text);
  SetLength(Tasks, Length(Patterns));
  for var i := Low(Patterns) to High(Patterns) do
    Tasks[i] := TTask.Create(
      procedure()
      begin
        AhoCorasickSearch(Text, Patterns);
      end);

  for var item in Tasks do
    item.ExecuteWork;

  TTask.WaitForAll(Tasks);
end;

procedure TfrmAhoCorasickMain.edtFileNameRightButtonClick(Sender: TObject);
begin
  if OpenTextFileDialog.Execute then
    edtFileName.Text := OpenTextFileDialog.FileName;
end;

end.
