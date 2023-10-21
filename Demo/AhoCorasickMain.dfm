object frmAhoCorasickMain: TfrmAhoCorasickMain
  Left = 0
  Top = 0
  Caption = 'Aho-Corasick Demo Application'
  ClientHeight = 377
  ClientWidth = 671
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object edtLog: TMemo
    Left = 0
    Top = 0
    Width = 568
    Height = 262
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 0
    ExplicitWidth = 497
    ExplicitHeight = 416
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 262
    Width = 671
    Height = 115
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 416
    object lblFileName: TLabel
      Left = 8
      Top = 16
      Width = 121
      Height = 15
      Caption = 'Very large text file'
    end
    object edtFileName: TButtonedEdit
      Left = 119
      Top = 13
      Width = 378
      Height = 23
      Images = VirtualImageList1
      RightButton.ImageIndex = 0
      RightButton.Visible = True
      TabOrder = 0
      OnRightButtonClick = edtFileNameRightButtonClick
    end
    object btnSimpleAhoCorasick: TButton
      Left = 120
      Top = 48
      Width = 225
      Height = 25
      Caption = 'Simple Aho-Corasick Test'
      TabOrder = 1
      OnClick = btnSimpleAhoCorasickClick
    end
    object btnAhoCorasickMultiThread: TButton
      Left = 119
      Top = 79
      Width = 225
      Height = 25
      Caption = 'MultiThread Aho-Corasick Test'
      TabOrder = 2
      OnClick = btnAhoCorasickMultiThreadClick
    end
  end
  object lbPattern: TListBox
    Left = 568
    Top = 0
    Width = 103
    Height = 262
    Align = alRight
    ItemHeight = 15
    Items.Strings = (
      '5043075306'
      '6646015316'
      '1328001381'
      '7524015624'
      '1838006108'
      '6674331056'
      '2340020470')
    TabOrder = 2
  end
  object OpenTextFileDialog: TOpenTextFileDialog
    DefaultExt = '*.txt'
    Filter = 'Text files|*.txt|All files|*.*'
    FilterIndex = 0
    Options = [ofPathMustExist, ofFileMustExist, ofCreatePrompt, ofEnableSizing]
    ShowEncodingList = False
    Left = 264
    Top = 88
  end
  object ImageCollection1: TImageCollection
    Images = <
      item
        Name = 'Open_16x16'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              610000002B744558745469746C65004F70656E3B466F6C6465723B426172733B
              526962626F6E3B5374616E646172643B4C6F6164F1C3C4630000022249444154
              785EA593BD6B545110C57F6FF3242AA9B412144B3FB1500CA20663FC032C6C44
              B0B010041194147616366295805A88A058898D8D106C444D6C44123426120959
              36B8316FD9F8F2B15F6FDFBD7746B9EFAD82019B1CB81C6698397366E006AACA
              461000859CC959F327FC079DC1E1C4C381D785807EB21815A827E642DF8DB1E7
              E30F4E8BA2A0CA1F12A5F7FA281D8488F61FBAFC940C8A6DD5987A76F3DE9D4B
              FB468F5C7D53653D0470B94B426704DC2AA4DF517184380E9EBBB6DD99E1F2A9
              03DB4072BB0AA2608C1B1BB8F5E10C6032012BA00E5C422016D4D2250D0E5F1C
              24E8DE0104A00208AA8ED1BB57FA80AEBF02A9CB046C82DA26625BE00CD4CBA8
              CF1B54F21A1556AB75809E20080A800BDEDD3EA67D8343C8CA272AD3E3C40B15
              54404510C92EA7A28888E7A5F92AEAD38A38AD862675B4E28864A1C872D460FF
              F961BC786E1B71A85A108B3A8B8A0149894BDF78FB6868DEAFB05A2E11CFCCD2
              B3AB174D221AB32F51DF90DD47457C8C737E1D114769B2CCCA9A19094DDBB154
              9A632D5A66E7F1BDB42BD3D85ADC29CC9A54C04F17C40B0951B1C29772FD4598
              B62D4B73737477F7B0796B487D6602DB58F6D63B2E347391E71CB59536F1CFC6
              D7FBEFA362D86AA4B018B1E7C44992C529926AD14F50BF7BA749BD082A5EA8BA
              9010D7CD0860C24633FD88AB1D9D1C79C5647E5D72560001505401554421B55A
              FEFCA3F9184803600BB00928B01EC13FB10206489E9CDDED0036FC9D7F01FAB6
              A14B22EE620A0000000049454E44AE426082}
          end>
      end>
    Left = 384
    Top = 56
  end
  object VirtualImageList1: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'Open_16x16'
        Name = 'Open_16x16'
      end>
    ImageCollection = ImageCollection1
    Left = 384
    Top = 128
  end
end
