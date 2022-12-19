unit DlgRotKontur1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzEdit, RzButton, StdCtrls, RzLabel, RzBorder, Mask, RzSpnEdt,
  ExtCtrls, RzPanel;

type
  TFmDlgRotKontur = class(TForm)
    RzPanel1: TRzPanel;
    RzSpinEdit_NZub: TRzSpinEdit;
    RzBorder1: TRzBorder;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzBorder2: TRzBorder;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzBitBtnOk: TRzBitBtn;
    RzBitBtnClose: TRzBitBtn;
    RzNumericEditXc: TRzNumericEdit;
    RzNumericEditYc: TRzNumericEdit;
    RzNumericEditRotAngle: TRzNumericEdit;
    procedure RzBitBtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmDlgRotKontur: TFmDlgRotKontur;

implementation

uses Raschet_1, ViewWin;

{$R *.dfm}

procedure TFmDlgRotKontur.RzBitBtnOkClick(Sender: TObject);
begin
 with FmViewWindow.DataRot do
  begin
   Xc:=RzNumericEditXc.Value;
   Yc:=RzNumericEditYc.Value;
   Angle:=RzNumericEditRotAngle.Value;
   N_Z:=Trunc(RzSpinEdit_NZub.Value);
  end;


end;

end.
