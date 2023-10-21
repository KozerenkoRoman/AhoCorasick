program AhoCorasickDemo;

uses
  Vcl.Forms,
  AhoCorasickMain in 'AhoCorasickMain.pas' {frmAhoCorasickMain},
  AhoCorasick in '..\AhoCorasick.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAhoCorasickMain, frmAhoCorasickMain);
  Application.Run;
end.
