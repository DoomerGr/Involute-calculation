unit Raschet_1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, Mask, RzEdit, RzBorder, RzButton, ExtCtrls,
  RzPanel, RzRadChk, RzPopups, RzTabs, RzStatus, RzSpnEdt,
  RzShellDialogs, Buttons;

type

 TEvPoint = record
  X1,Y1:extended;
  info:String[25];
  end;

 TMPoint = record
  X1,Y1:extended;
  end;

 TDataRot = record
  Xc,Yc,Angle:extended;
  N_Z:Integer;
 end;


 TInputData = record
  ID_Rashet:Integer;
  Name_Rashet:string[250];
  m,z,Ao,Ha,Xk,c,y,Da,D,Db,Df,Kbz,b,Zam_H:String[26];
  end;


 PDataKonturZuba = ^TDataKonturZuba;
 TDataKonturZuba = record
   Point:array of TEvPoint;
   B_zub:array of TEvPoint;
   DlnPic_X:Real;
   DlnPic_Y:Real;
   Max_X:Real;
   Max_Y:Real;
   Min_X:Real;
   Min_Y:Real;
   Color:TColor;
   W_Line:Integer;
   VspGeom:boolean;
   N_Point:integer;
   InputData:TinputData;
  end;


  TFmRashetEvolv = class(TForm)
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    Panel2: TPanel;
    RzPanel3: TRzPanel;
    RzPanel_VarB: TRzPanel;
    RzBorder1: TRzBorder;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    RzPanel_VarA: TRzPanel;
    RzBorder2: TRzBorder;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    RzPanel7: TRzPanel;
    RzRadioButtonVarA: TRzRadioButton;
    RzRadioButtonVarB: TRzRadioButton;
    RzPanel4: TRzPanel;
    Panel1: TPanel;
    RzMemo1: TRzMemo;
    RzPanel5: TRzPanel;
    RzLabel14: TRzLabel;
    RzLabel22: TRzLabel;
    RzLabel23: TRzLabel;
    RzVersionInfo1: TRzVersionInfo;
    RzBitBtnSave: TRzBitBtn;
    RzSaveDialog1: TRzSaveDialog;
    RzLabel6: TRzLabel;
    RzLabel5: TRzLabel;
    RzBorder3: TRzBorder;
    RzLabel31: TRzLabel;
    RzLabel32: TRzLabel;
    RzLabel33: TRzLabel;
    RzLabel34: TRzLabel;
    RzLabel35: TRzLabel;
    RzLabel36: TRzLabel;
    RzLabel37: TRzLabel;
    RzLabel38: TRzLabel;
    RzLabel39: TRzLabel;
    RzLabel40: TRzLabel;
    RzLabel41: TRzLabel;
    RzLabel42: TRzLabel;
    RzLabel43: TRzLabel;
    RzLabel44: TRzLabel;
    RzLabel45: TRzLabel;
    RzLabel46: TRzLabel;
    RzPanel1: TRzPanel;
    rzpnl1: TRzPanel;
    rzbrdr1: TRzBorder;
    RzLabel25: TRzLabel;
    rzvrsnfsts1: TRzVersionInfoStatus;
    lbl2: TRzLabel;
    lbl3: TRzLabel;
    RzBitBtnOk: TRzBitBtn;
    RzBitBtnClose: TRzBitBtn;
    RzCheckBoxDataEvolv: TRzCheckBox;
    RzCheckBoxSim: TRzCheckBox;
    RzCheckBox_Bzuba: TRzCheckBox;
    RzSpinEditToch_P: TRzSpinEdit;
    RzSpinEditToch_Rv: TRzSpinEdit;
    RzBitBtnPredView: TRzBitBtn;
    RzBitBtnAdKontur: TRzBitBtn;
    rzpnl2: TRzPanel;
    rzbrdr2: TRzBorder;
    rzbrdr3: TRzBorder;
    lbl4: TRzLabel;
    lbl5: TRzLabel;
    RzSpinEditKorB: TRzSpinEdit;
    RzPanel11: TRzPanel;
    lbl8: TRzLabel;
    lbl7: TRzLabel;
    RzBtnSaveBase: TRzRapidFireButton;
    RzBtnAddBase: TRzRapidFireButton;
    RzBtnLoad1: TRzRapidFireButton;
    RzCheckBoxSaveFile: TRzCheckBox;
    RzCheckBoxPoint: TRzCheckBox;
    RzRadBtnZub: TRzRadioButton;
    RzRadBtnVpadina: TRzRadioButton;
    RzBtnSaveBaseFile: TRzRapidFireButton;
    Lbl6: TRzLabel;
    ComBoxNameRashet: TComboBox;
    rzbrdr4: TRzBorder;
    EditMod: TEdit;
    Edit_Z: TEdit;
    EditUgol: TEdit;
    Edit_SmKon_X: TEdit;
    Edit_kHa: TEdit;
    Edit_kDeltaY: TEdit;
    Edit_kRadZazor: TEdit;
    Edit_Mod2: TEdit;
    EditUgolv2: TEdit;
    Edit_Da: TEdit;
    Edit_D: TEdit;
    Edit_Df: TEdit;
    Edit_Db: TEdit;
    Edit_C: TEdit;
    Edit_S: TEdit;
    Editv2_kDeltaY: TEdit;
    Edit_UgolPov: TEdit;
    Edit_Npoint: TEdit;
    EditList_H: TEdit;
    procedure RzBitBtnOkClick(Sender: TObject);
    procedure RzBitBtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure InputVariant;
    procedure RzRadioButtonVarAClick(Sender: TObject);
    procedure RzRadioButtonVarBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ControlInteger(Sender: TObject; var Key: Char);
    procedure ControlFloat(Sender: TObject; var Key: Char);
    procedure ControlFloatInv(Sender: TObject; var Key: Char);
    function ControlInputData : integer;
    procedure RzBitBtnPredViewClick(Sender: TObject);
    procedure WMMove (var Message: TWMMove); message WM_MOVING;
    procedure RzBtnLoadClick(Sender: TObject);
    procedure Rz_NRaschetButtonClick(Sender: TObject;
      Button: TSpinButtonType);
    procedure Rz_NRaschetKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Rz_NRaschetKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzBitBtnAdKonturClick(Sender: TObject);
    function LoadItemArray(Ind:word):Integer;
    procedure SaveIndRaschet(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function  OpenBaseFile(FileBase:String):word;
    function  SaveBaseFile(FileBase:String):word;
    procedure RzBtnSaveBaseFileClick(Sender: TObject);
    procedure ComBoxNameRashetSelect(Sender: TObject);
    procedure RzBitBtnSaveClick(Sender: TObject);
    procedure EditEnter(Sender: TObject);

  private
   List:boolean;
   СurrentEdit:TEdit;
  public
   NameFileBase:string;
   Rad_1:extended;
   DefoltData:TInputData;
   ActRashet,Count_Rashet:Word;
   KonturZuba:^TDataKonturZuba;
   Evolventa:TDataKonturZuba;
   MSaveData:array of TInputData;
   Atemp,UgolPovor,D,Da,Df,C,Db,Ao,m,inv_at,Rv,S,Xs:real;
   N_Point:integer;
   ZubPoint:array of TPoint;
   Kor_Ugol,Ugol_D,k_Dy,k_c,k_Ha,Ugol_S,Ugol_End,
   Z,Ugol_hord,Ugol_Start_Evolv,Ugol_P,X_t,Y_t:Real;
  end;

//  D - делительный диаметр  Da - диаметр вершин
//  C - радиальный зазор  Db - диаметр основной окружности
//  Ao - угол исходного контура  m  - модуль
//  z - число зубьев  inv_at - эвольвентный угол (inv at)
//  Rv - радиус вектор  S - толщина зуба
//  Xs - к-т смещения зубчатого колеса

 function PointRot(Xc,Yc,Xp,Yp,Anglef:real):TMPoint;

 var  FmRashetEvolv: TFmRashetEvolv;


implementation

{$R *.dfm}

uses Math, ViewWin, RashetLoad;

procedure TFmRashetEvolv.ControlInteger(Sender: TObject; var Key: Char);
const Digit: Set of Char=['0' .. '9'];
begin
  if  not(Key in Digit) and (key<>chr(8)) then key:=#0;
end;



procedure TFmRashetEvolv.EditEnter(Sender: TObject);
begin
 if Sender is TEdit then
  begin
   if СurrentEdit<>nil then СurrentEdit.Color:=clWindow;
   TEdit(Sender).Color:=clYellow; СurrentEdit:=TEdit(Sender);
  end;
end;

procedure TFmRashetEvolv.ControlFloat(Sender: TObject; var Key: Char);
const Digit: Set of Char=['0' .. '9'];
begin
 if (Sender as TEdit).Name='EditList_H' then
  begin
  if  not(Key in Digit) and (key<>chr(8)) and (key<>FormatSETTINGS.DecimalSeparator) and
    (key<>';') then key:=#0
  end
 else
  if  not(Key in Digit) and (key<>chr(8)) and (key<>FormatSETTINGS.DecimalSeparator) then key:=#0;
end;

procedure TFmRashetEvolv.ControlFloatInv(Sender: TObject; var Key: Char);
const Digit: Set of Char=['0' .. '9','-'];
begin
  if  not(Key in Digit) and (key<>chr(8)) and (key<>FormatSETTINGS.DecimalSeparator) then key:=#0;
end;

procedure TFmRashetEvolv.InputVariant;
var i:integer;
begin
  if RzRadioButtonVarA.Checked then
    begin
     for i:=0 to RzPanel_VarB.ControlCount-1 do
     if RzPanel_VarB.Controls[i] is TEdit then
          (RzPanel_VarB.Controls[i] as TEdit).ReadOnly:=True;

     for i:=0 to RzPanel_VarA.ControlCount-1 do
     if (RzPanel_VarA.Controls[i] is TEdit) and ((RzPanel_VarA.Controls[i] as TEdit).Tag=0) then
          (RzPanel_VarA.Controls[i] as TEdit).ReadOnly:=False;
    end
  else
   begin
    for i:=0 to RzPanel_VarA.ControlCount-1 do
    if (RzPanel_VarA.Controls[i] is TEdit) and ((RzPanel_VarA.Controls[i] as TEdit).Tag=0) then
       (RzPanel_VarA.Controls[i] as TEdit).ReadOnly:=True;
    for i:=0 to RzPanel_VarB.ControlCount-1 do
     if RzPanel_VarB.Controls[i] is TEdit then
       (RzPanel_VarB.Controls[i] as TEdit).ReadOnly:=False;
       Edit_Db.ReadOnly:=True;
   end;
end;

procedure TFmRashetEvolv.FormShow(Sender: TObject);
begin
  InputVariant;
end;

procedure TFmRashetEvolv.RzRadioButtonVarAClick(Sender: TObject);
begin
  InputVariant
end;

procedure TFmRashetEvolv.RzRadioButtonVarBClick(Sender: TObject);
begin
  InputVariant
end;


function TFmRashetEvolv.SaveBaseFile(FileBase:String):word;
var i:integer;
    F:File of TInputData;
begin
  try
   AssignFile(F,FileBase);Rewrite(f);
   For i:=0 to Length(MSaveData)-1 do write(f,MSaveData[i]);
   CloseFile(f);
   except
    MessageDlg('Не могу записать файл: '+NameFileBase,mtError,[mbOk],0);
   end;
end;


function TFmRashetEvolv.OpenBaseFile(FileBase:string):word;
var F:File of TInputData;
    TmP:TInputData;
    i:integer;
begin
 i:=0;Count_Rashet:=0;ActRashet:=0;
  try
    if FileExists(FileBase) then
      begin
       AssignFile(F,FileBase);Reset(f);
        While not eof(f) do begin read(f,TmP);inc(Count_Rashet) end;
        SetLength(MSaveData,Count_Rashet);Reset(f);
        While not eof(f) do begin
         Read(f,MSaveData[i]);
         ComBoxNameRashet.Items.Add(MSaveData[i].Name_Rashet);
         inc(i)
        end;
        if LoadItemArray(0)<>1 then
         begin
          SetLength(MSaveData,1);
          MSaveData[0]:=DefoltData;
          LoadItemArray(0)
         end;
        Result:=1;
      end
    else
     begin
      SetLength(MSaveData,1);
      MSaveData[0]:=DefoltData;
      LoadItemArray(0);
      Result:=0;
     end;
     except
      SetLength(MSaveData,1);
      MSaveData[0]:=DefoltData;
      Result:=0;
      LoadItemArray(0)
  end;
end;

procedure TFmRashetEvolv.FormCreate(Sender: TObject);
begin
 FormatSETTINGS.DecimalSeparator := '.';rad_1:=180/pi;Count_Rashet:=0;ActRashet:=0;
 NameFileBase:='RaschetEvolv.dat';
 with DefoltData do
  begin
   ID_Rashet:=0;
   Name_Rashet:='Тестовый образец';
   m:='3';z:='20';Ao:='20';Ha:='1';Xk:='0';c:='0.25';y:='0';Da:='66';
   D:='60';Db:='56.3816';Df:='52.5';Kbz:='0';b:='4.712';Zam_H:='3;5;8';
  end;
  OpenBaseFile(NameFileBase);
end;


procedure TFmRashetEvolv.RzBitBtnCloseClick(Sender: TObject);
begin
 if Length(Evolventa.Point)<>0 then  Evolventa.Point:=nil;
 close
end;


function TFmRashetEvolv.ControlInputData: integer;
begin
  if RzRadioButtonVarA.Checked then
    begin
     Result:=1;
     Edit_Mod2.Text:=EditMod.Text;
     EditUgolv2.Text:=EditUgol.Text;
     Editv2_kDeltaY.Text:=Edit_kDeltaY.Text;
     if Edit_kHa.Text='' then Edit_kHa.Text:='1';
     if Edit_SmKon_X.Text='' then Edit_SmKon_X.Text:='0';
     if Edit_kRadZazor.Text='' then Edit_kRadZazor.Text:='0.25';
     if Edit_kDeltaY.Text='' then Edit_kDeltaY.Text:='0';

      try
        m:=StrToFloat(EditMod.Text);
        z:=StrToFloat(Edit_Z.Text);
        Xs:=StrToFloat(Edit_SmKon_X.Text);
        Ao:=StrToFloat(EditUgol.Text);
        N_Point:=StrToInt(Edit_Npoint.Text);
        UgolPovor:= StrToFloat(Edit_UgolPov.Text);
        k_Ha:=StrToFloat(Edit_kHa.Text);
        k_c:=StrToFloat(Edit_kRadZazor.Text);
        k_Dy:= StrToFloat(Edit_kDeltaY.Text);
       except
        MessageDlg('Введены не все данные.', mtError	, [mbOk], 0);
        Result:=0;
        exit
      end;

     D:=m*z;
     Da:=D+2*m*(k_Ha+Xs-k_Dy);
     c:=k_c*m;
     Df:=Da-2*m*(2*k_Ha+k_c-k_Dy);
     S:=m*((pi/2)+(2*Xs*tan(Ao/rad_1)));
    end
  else
   begin
    N_Point:=StrToInt(Edit_Npoint.Text);
    EditUgol.Text:=EditUgolv2.Text;
    Result:=1;
    EditMod.Text:=Edit_Mod2.Text;
     try
      UgolPovor:= StrToFloat(Edit_UgolPov.Text);
      m:=StrToFloat(Edit_Mod2.Text);
      Ao:=StrToFloat(EditUgolv2.Text);
      D:=StrToFloat(Edit_D.Text);
      Da:=StrToFloat(Edit_Da.Text);
      Df:=StrToFloat(Edit_Df.Text);
      S:=StrToFloat(Edit_S.Text);
      C:=StrToFloat(Edit_C.Text);
      k_Dy:=StrToFloat(Editv2_kDeltaY.Text);
      except
       MessageDlg('Введены не все данные.', mtError	, [mbOk], 0);
       Result:=0;
       exit
     end;

     if (m<0) or (Ao<=0) or (Da<=0) then
      begin
       if m<=0 then
         MessageDlg('Отсутствуют данные о модуле.', mtError	, [mbOk], 0);

       if Ao<=0 then
         MessageDlg('Отсутствуют данные об угле зацепления.', mtError	, [mbOk], 0);

       if Da<=0 then
         MessageDlg('Отсутствуют данные о наружном диаметре.', mtError	, [mbOk], 0);
       Result:=0;
       exit
      end;

    k_c:=c/m;
    Edit_kRadZazor.Text:=Format('%2.3f',[k_c]);
    z:=trunc(D/m);
    Edit_Z.Text:=FloatToStr(z);
    Xs:=(s/m-pi/2)/2/tan(Ao/rad_1);
    Edit_SmKon_X.Text:=Format('%2.4f',[Xs]);
    k_Ha:=(Da-D)/2/m-Xs+k_Dy;
    Edit_kHa.Text:=Format('%2.4f',[k_Ha]);
    Df:=StrToFloat(Edit_Df.Text);
    //if df=0 then
     Df:=Da-2*m*(2*k_Ha+k_c-k_Dy);
    if S=0 then S:=m*((pi/2)+(2*Xs*tan(Ao/rad_1)));
   end;

   if (m<0) or (Ao<=0) or (Z<=0) or (D<=0) then
    begin
     if m<=0 then
        MessageDlg('Отсутствуют данные о модуле.', mtError	, [mbOk], 0);
     if Ao<=0 then
        MessageDlg('Отсутствуют данные об угле зацепления.', mtError	, [mbOk], 0);
     if Z<=0 then
        MessageDlg('Отсутствуют данные о количестве зубьев.', mtError	, [mbOk], 0);
      if D<=0 then
        MessageDlg('Отсутствует размер делительного диаметра.', mtError	, [mbOk], 0);
       Result:=0;exit
      end;

end;


procedure TFmRashetEvolv.RzBitBtnOkClick(Sender: TObject);
var r,Xt,Ugol_St,Ugol_Dt,Sum_Ugol,Ugol_Sim_Zub:real;
    Kol_H,i:integer;
    Pnt:TMPoint;
    St:string;
begin
  if ControlInputData=0 then exit;Evolventa.B_zub:=nil;Evolventa.Point:=nil;
  RzMemo1.Clear;

//--------------------Расчет необходимых параметров--------------------------
   Db:=cos(Ao*PI/180)*D;
   Kor_Ugol:=arcsin((RzSpinEditKorB.Value/200)/(D/2))*rad_1;
   Ugol_End:=arccos(0.5*Db/(Da/2))*rad_1;


   if (0.5*Db/(Df/2)<=1) and (0.5*Db/(Df/2)>=-1) then
     Ugol_Start_Evolv:=arccos(0.5*Db/(Df/2))*rad_1
   else Ugol_Start_Evolv:=0;;

   Edit_Da.Text:=FloatToStr(Da);
   Edit_D.Text:=FloatToStr(D);
   Edit_Db.Text:=FloatToStr(Db);
   Edit_Df.Text:=FloatToStr(Df);
   Edit_C.Text:=FloatToStr(C);
   Edit_S.Text:=Format('%4.8f',[S+RzSpinEditKorB.Value/100]);

   Ugol_P:=(Ugol_End-Ugol_Start_Evolv)/N_Point;
   Atemp:=Ugol_Start_Evolv;

   Ugol_S:=arcsin(S/D)*rad_1;
   if RzSpinEditKorB.Value<>0 then
    Kor_Ugol:=Ugol_S/(S/(RzSpinEditKorB.Value/200))  //корректировка толщины зуба
   else Kor_Ugol:=0;
   Ugol_S:=Ugol_S+Kor_Ugol*2;
   Ugol_D:=(tan(Ao/rad_1)-(Ao/rad_1))*rad_1;

   With Evolventa.InputData do
    begin
     m:=EditMod.Text;z:=Edit_Z.Text;Ao:=EditUgol.Text;Ha:=Edit_kHa.Text;c:=Edit_kRadZazor.Text;
     y:=Edit_kDeltaY.Text;Da:=Edit_Da.Text;D:=Edit_D.Text;Db:=Edit_Db.Text;Xk:=Edit_SmKon_X.Text;
     Df:=Edit_Df.Text;Kbz:=RzSpinEditKorB.Text;
    end;

   SetLength(Evolventa.Point,(N_Point)*2);

  if (RzCheckBoxPoint.Checked) or  (RzCheckBoxDataEvolv.Checked)
   or (RzCheckBox_Bzuba.Checked)  then
    begin
      RzMemo1.Lines.Add('===============Исходные данные для построения эвольвенты==============='+#13+#10);

      RzMemo1.Lines.Add('Модуль: '+EditMod.Text+'; Число зубьев: '+Edit_Z.Text+'; Угол зацепления: '+EditUgol.Text+';');
      RzMemo1.Lines.Add('Коэффициент смещения исходного контура: '+Edit_SmKon_X.Text+';');
      RzMemo1.Lines.Add('Коэффициент высоты головки зуба: '+Edit_kHa.Text+';');
      RzMemo1.Lines.Add('Коэффициент уравнительного смещения: '+Edit_kDeltaY.Text+';');
      RzMemo1.Lines.Add('Коэффициент радиального зазора: '+Edit_kRadZazor.Text+';');
      RzMemo1.Lines.Add('Наружный диаметр: '+Edit_Da.Text+'; Делительный диаметр: '+Edit_D.Text+';');
      RzMemo1.Lines.Add('Диаметр впадин: '+Edit_Df.Text+'; Диаметр основной окружности: '+Format('%3.3f',[Db])+';'+#13+#10);
    end;


  if RzCheckBoxDataEvolv.Checked then
      RzMemo1.Lines.Add('====================Данные построения эвольвенты======================='+#13+#10);

   if RzCheckBoxSim.Checked then
    begin
      UgolPovor:=UgolPovor-Ugol_S-Ugol_D;
    end;

  Ugol_Sim_Zub:=Ugol_S+UgolPovor+Ugol_D;

  for  i:=0   to N_Point-1 do
  begin

   Atemp:=Atemp+Ugol_P;
   inv_at:=(tan(Atemp/rad_1)-(Atemp/rad_1))*rad_1;
   Rv:=(0.5*Db)/cos(Atemp/rad_1);
   Sum_Ugol:=inv_at+UgolPovor-Ugol_Dt;

   X_t:=cos(Sum_Ugol/rad_1)*Rv;Y_t:=sin(Sum_Ugol/rad_1)*Rv;
   Evolventa.Point[i].X1:=X_t;
   Evolventa.Point[i].Y1:=Y_t;
   Evolventa.Point[i].info:='Y';
   if RzCheckBoxDataEvolv.Checked then
   RzMemo1.Lines.Add(Format('Угол профиля=%-12.'+FloatTostr(RzSpinEditToch_Rv.Value)+'f'+#$9+'Угол эвольвенты=%-12.'+
   FloatTostr(RzSpinEditToch_Rv.Value)+'f'+#$9+'Радиус эвольвенты=%-12.'+FloatTostr(RzSpinEditToch_Rv.Value)+'f',[Atemp,inv_at,Rv]));
  end;


  //Расчет зеркальной части эвольвенты
    Atemp:=Ugol_End;
  for  i:=N_Point to N_Point*2-1 do
   begin
    inv_at:=(tan(Atemp/rad_1)-(Atemp/rad_1))*rad_1;
    Rv:=(0.5*Db)/cos(Atemp/rad_1);
    Atemp:=Atemp-Ugol_P;
    Sum_Ugol:=inv_at+UgolPovor;
    X_t:=cos((Ugol_Sim_Zub+(Ugol_Sim_Zub-Sum_Ugol))/rad_1)*Rv;Y_t:=sin((Ugol_Sim_Zub+(Ugol_Sim_Zub-Sum_Ugol))/rad_1)*Rv;
    Evolventa.Point[i].X1:=X_t;Evolventa.Point[i].Y1:=Y_t;
    Evolventa.Point[i].info:='Y';
   end;
   Evolventa.Point[N_Point*2-1].info:='N';

 //Расчет координат впадины (если выбран режим расчета впадины)
 if RzRadBtnVpadina.Checked then
  begin
   for i:=0 to N_Point-1 do
    begin
     Pnt:=PointRot(0,0,Evolventa.Point[i].X1,Evolventa.Point[i].Y1,360/(StrToFloat(Evolventa.InputData.Z)*2));
     Evolventa.Point[i].X1:=Pnt.X1;Evolventa.Point[i].Y1:=Pnt.Y1;
    end;
   for  i:=N_Point to N_Point*2-1 do
    begin
     Pnt:=PointRot(0,0,Evolventa.Point[i].X1,Evolventa.Point[i].Y1,-360/(StrToFloat(Evolventa.InputData.Z)*2));
     Evolventa.Point[i].X1:=Pnt.X1;Evolventa.Point[i].Y1:=Pnt.Y1;
    end;
   Evolventa.Point[N_Point-1].info:='N';
  end;


   if RzCheckBoxDataEvolv.Checked then RzMemo1.Lines.Add(#13);

//Создание массива значений глубин замеров из строки EditList_H.text
  if RzCheckBox_Bzuba.Checked then
   begin
    Kol_H:=0;
    For i:=1 to Length(EditList_H.Text) do if EditList_H.Text[i]=';' then inc(Kol_H);
    SetLength(Evolventa.B_zub,Kol_H+1);
    St:=EditList_H.Text;i:=0;
     While Length(St)<>0 do
       begin
        if (pos(';',St)=0) and (Length(St)<>0) then
         begin
          Evolventa.B_zub[i].X1:=StrToFloat(Copy(St,1,Length(St)));
          Delete(st,1,Length(St));
         end
        else
         begin
          Evolventa.B_zub[i].X1:=StrToFloat(Copy(St,1,pos(';',St)-1));
          Delete(st,1,pos(';',St));inc(i);
         end
       end;
     //Расчет толщин зуба на заданных высотах
     for i:=0 to Length(Evolventa.B_zub)-1 do
      if Evolventa.B_zub[i].X1<=(Da-Db)/2 then
        begin
          Rv:=Da/2-Evolventa.B_zub[i].X1;
          Atemp:=arccos(Db/(Rv*2))*rad_1;
          inv_at:=(tan(Atemp/rad_1)-(Atemp/rad_1))*rad_1;
          Ugol_hord:=(Ugol_Sim_Zub-inv_at-UgolPovor);
          Rv:=Rv+Rv-Rv*cos(Ugol_hord/rad_1);
          Atemp:=arccos(Db/(Rv*2))*rad_1;
          inv_at:=(tan(Atemp/rad_1)-(Atemp/rad_1))*rad_1;
          Ugol_hord:=(Ugol_Sim_Zub-inv_at-UgolPovor);
          Evolventa.B_zub[i].Y1:=Rv*sin(Ugol_hord/rad_1)*2;
        end
      else Evolventa.B_zub[i].info:='Неверная высота зуба';

    //=========

      RzMemo1.Lines.Add('========Расчетные толщины зуба на заданных высотах от наружного диаметра========'+#13+#10);
      for i:=0 to Length(Evolventa.B_zub)-1 do
       begin
        if Length(Evolventa.B_zub[i].info)=0 then
         RzMemo1.Lines.Add('Высота замера: Ha='+FloattoStr(Evolventa.B_zub[i].X1)+#$9+'Sz='+Format('%-1.8f',[Evolventa.B_zub[i].Y1]))
        else
         RzMemo1.Lines.Add('Высота замера: Ha='+FloattoStr(Evolventa.B_zub[i].X1)+chr(VK_tab)+Evolventa.B_zub[i].info)
       end;
      RzMemo1.Lines.Add(#13);
   end;
  Evolventa.Max_X:=Evolventa.Point[0].X1;Evolventa.Min_X:=Evolventa.Point[0].X1;
  Evolventa.Max_Y:=Evolventa.Point[0].Y1;Evolventa.Min_Y:=Evolventa.Point[0].Y1;
  SetLength(ZubPoint,Length(Evolventa.Point));
  Evolventa.N_Point:=StrToInt(Edit_Npoint.Text);

  if RzCheckBoxPoint.Checked then
   begin
    if RzRadBtnVpadina.Checked then
      RzMemo1.Lines.Add('=====Расчетные координаты точек эвольвенты впадины в декартовых координатах====='+#13+#10)
       else
        RzMemo1.Lines.Add('=========Расчетные координаты точек эвольвенты зуба в декартовых координатах======'+#13+#10);
     With Evolventa do
      begin
       for i:=0 to length(Point)-1 do
         begin
          if Point[i].X1>Max_X then Max_X:=Point[i].X1;
          if Point[i].Y1>Max_Y then Max_Y:=Point[i].Y1;
          if Point[i].X1<Min_X then Min_X:=Point[i].X1;
          if Point[i].Y1<Min_Y then Min_Y:=Point[i].Y1;
          RzMemo1.Lines.Add(Format('N'+inttostr(i+1)+' X%1.'+FloatTostr(RzSpinEditToch_P.Value)+'f'+
          ' Y%1.'+FloatTostr(RzSpinEditToch_P.Value)+'f',[Point[i].X1, Point[i].Y1]) );
         end;
       DlnPic_X:=abs(Max_X-Min_X);DlnPic_Y:=abs(Max_Y-Min_Y);
      end;
    end;
   RzBitBtnPredView.Enabled:=True;
end;



procedure TFmRashetEvolv.RzBitBtnPredViewClick(Sender: TObject);
var lef:integer;
begin
  with FmViewWindow do
   begin
    Left:=FmRashetEvolv.Left+FmRashetEvolv.Width+3;
    top:=FmRashetEvolv.top;
   end;
  RzBitBtnAdKontur.Enabled:=True;
  lef:=screen.Width-FmRashetEvolv.Width-FmViewWindow.Width-30;
  if lef<0 then lef:=0;FmRashetEvolv.Left:=lef;
  FmViewWindow.Left:=FmRashetEvolv.Left+FmRashetEvolv.Width+3;
  FmViewWindow.top:=FmRashetEvolv.top;
  if not FmViewWindow.Showing  then FmViewWindow.Show else FmViewWindow.Close;
end;

procedure TFmRashetEvolv.WMMove (var Message: TWMMove);
begin
 if (Assigned (FmViewWindow)) and (FmViewWindow.Showing) then
  begin
   FmViewWindow.Left:=FmRashetEvolv.Left+FmRashetEvolv.Width+3;
   FmViewWindow.top:=FmRashetEvolv.top;
  end;
end;

procedure TFmRashetEvolv.Rz_NRaschetButtonClick(Sender: TObject;
  Button: TSpinButtonType);
begin
 if List then RzBtnLoadClick(sender)
end;

procedure TFmRashetEvolv.Rz_NRaschetKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) or (ssShift in Shift)then List:=True else List:=False;
end;

procedure TFmRashetEvolv.Rz_NRaschetKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 List:=False
end;

function PointRot(Xc,Yc,Xp,Yp,Anglef:real):TMPoint;
var Angle,Rv:Real;
begin
 Rv:=Sqrt(Sqr(Xp-Xc)+Sqr(Yp-Yc));
 Angle:=ArcTan2(Yp-Yc,Xp-Xc)+Anglef*pi/180;
 Result.X1:=Xc+Rv*cos(Angle);Result.Y1:=Yc+Rv*sin(Angle);
end;


procedure TFmRashetEvolv.RzBitBtnAdKonturClick(Sender: TObject);
var lef:integer;

begin
if FmViewWindow.Visible then
  Evolventa.Color:=clRed;
  New(KonturZuba);
  KonturZuba^:=Evolventa;
  KonturZuba^.VspGeom:=true;
  with FmViewWindow do
   begin
    RzCheckListKontur.AddObject('Контур '+IntToStr(RzCheckListKontur.Count+1),Pointer(KonturZuba));
    RzCheckListKontur.ItemIndex:=RzCheckListKontur.Count-1;
    Left:=FmRashetEvolv.Left+FmRashetEvolv.Width+3;
    top:=FmRashetEvolv.top;
    RzPanelDraw.Canvas.FillRect(ClientRect);
    Draw_Kontur_Zuba(@Evolventa,pmCopy);
   end;
  lef:=screen.Width-FmRashetEvolv.Width-FmViewWindow.Width-30;
  if lef<0 then lef:=0;FmRashetEvolv.Left:=lef;
  FmViewWindow.Left:=FmRashetEvolv.Left+FmRashetEvolv.Width+3;
  FmViewWindow.top:=FmRashetEvolv.top;
  if not FmViewWindow.Showing  then FmViewWindow.Show;
  FmViewWindow.RzPanelDraw.Repaint
end;

function TFmRashetEvolv.LoadItemArray(Ind:word):Integer;
begin
  try
   with MSaveData[Ind] do
    begin
      ComBoxNameRashet.Text:=Name_Rashet;
      EditMod.Text:=m;
      Edit_Z.Text:=Z;
      EditUgol.Text:=Ao;
      Edit_kHa.Text:=Ha;
      Edit_SmKon_X.Text:=Xk;
      Edit_kRadZazor.Text:=c;
      Edit_kDeltaY.Text:=y;
      Edit_Da.Text:=Da;
      Edit_D.Text:=D;
      Edit_Db.Text:=Db;
      Edit_Df.Text:=Df;
      Edit_Mod2.Text:=m;
      EditUgolv2.Text:=Ao;
      Edit_C.Text:=c;
      Editv2_kDeltaY.Text:=y;
      RzSpinEditKorB.Text:=Kbz;
      Edit_S.Text:=b;
      EditList_H.Text:=Zam_H;
      ActRashet:=Ind;
    end;
    Result:=1;
   except
     Result:=0;
  end;
end;


procedure TFmRashetEvolv.RzBtnLoadClick(Sender: TObject);
begin
 FmLoadRashet.ShowModal
end;

procedure TFmRashetEvolv.SaveIndRaschet(Sender: TObject);
var i_w:integer;
begin
 if (Sender as TRzRapidFireButton).Name='RzBtnSaveBase' then i_w:=ActRashet
  else
   begin
    Inc(Count_Rashet);
    SetLength(MSaveData,Count_Rashet);i_w:=Count_Rashet-1;
    ActRashet:=i_w;
   end;

   with MSaveData[i_w] do
    begin
      m:=EditMod.Text;
      Name_Rashet:=ComBoxNameRashet.Text;
      ID_Rashet:=ActRashet;
      z:=Edit_Z.Text;
      Ao:=EditUgol.Text;
      Ha:=Edit_kHa.Text;
      Xk:=Edit_SmKon_X.Text;
      c:=Edit_kRadZazor.Text;
      y:=Edit_kDeltaY.Text;
      Da:=Edit_Da.Text;
      D:=Edit_D.Text;
      Db:=Edit_Db.Text;
      Df:=Edit_Df.Text;
      Kbz:=RzSpinEditKorB.Text;
      b:=Edit_S.Text;
      Zam_H:=EditList_H.Text;
    end;
  ComBoxNameRashet.Clear;ComBoxNameRashet.Text:=MSaveData[i_w].Name_Rashet;
  for i_w:=0 to Length(MSaveData)-1 do
     ComBoxNameRashet.Items.Add(MSaveData[i_w].Name_Rashet);
end;


procedure TFmRashetEvolv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if RzCheckBoxSaveFile.Checked then SaveBaseFile(NameFileBase);
end;


procedure TFmRashetEvolv.RzBtnSaveBaseFileClick(Sender: TObject);
begin
 SaveIndRaschet(RzBtnSaveBase);
 SaveBaseFile(NameFileBase)
end;

procedure TFmRashetEvolv.ComBoxNameRashetSelect(Sender: TObject);
begin
LoadItemArray(ComBoxNameRashet.ItemIndex);
end;

procedure TFmRashetEvolv.RzBitBtnSaveClick(Sender: TObject);
begin
 if RzMemo1.Lines.Count<>0 then
    if RzSaveDialog1.Execute then
    try
     if ExtractFileExt(RzSaveDialog1.FileName)='' then
     RzSaveDialog1.FileName:=RzSaveDialog1.FileName+RzSaveDialog1.DefaultExt;
     RzMemo1.Lines.SaveToFile(RzSaveDialog1.FileName);
    except
      MessageDlg('Ошибка сохранения файла: '+RzSaveDialog1.FileName,
      mtError, [mbOk], 0)
    end;
end;


end.




