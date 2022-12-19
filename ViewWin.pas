unit ViewWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, StdCtrls, RzStatus,Raschet_1, RzLstBox,
  RzChkLst, Mask, RzEdit, RzButton, RzLabel, Menus, RzCommon, RzBorder,
  RzSpnEdt, Buttons, ImgList, RzRadChk, System.ImageList;


type

TParamDraw = record
  Scale:real;
  Centrirovanie_X,Centrirovanie_Y:Integer;
  Dr_DlnPic_X,Dr_DlnPic_Y,Dr_Min_X,Dr_Min_Y,Dr_Max_X,Dr_Max_Y:extended;
end;


TParamCircle = record
   X1,Y1,X2,Y2,Xc,Yc,Rad:real;
   Pen:TPen;
end;

TParamLine = record
   X1,Y1,X2,Y2:real;
   Pen:TPen;
end;

TModeView =(Line,Pan,PanFrame,None);


  TFmViewWindow = class(TForm)
    RzStatusBar1: TRzStatusBar;
    RzStatusPaneKoordY: TRzStatusPane;
    RzStatusPaneKoordX: TRzStatusPane;
    PopupMenu1: TPopupMenu;
    N1_Delete: TMenuItem;
    TRzStPane_KorB: TRzStatusPane;
    TRzStPane_Z: TRzStatusPane;
    TRzStPane_C: TRzStatusPane;
    TRzStPane_Ao: TRzStatusPane;
    TRzStPane_M: TRzStatusPane;
    TRzStPane_Kx: TRzStatusPane;
    TRzStPane_Y: TRzStatusPane;
    TRzStPane_Ha: TRzStatusPane;
    RzPanel1: TRzPanel;
    RzLabel3: TRzLabel;
    RzCheckListKontur: TRzCheckList;
    RzPanel2: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    RzEdit1: TRzEdit;
    RzPanel4: TRzPanel;
    RzLabel8: TRzLabel;
    RzPanel5: TRzPanel;
    ColorDialog1: TColorDialog;
    RzSpin_WLine: TRzSpinEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    Shape_IndColor: TShape;
    RzCheckBoxVspGeom: TRzCheckBox;
    RzMemo1: TRzMemo;
    RzPanel3: TRzPanel;
    RzLabel4: TRzLabel;
    ShapeIzmColor: TShape;
    RzLblIzmColor: TRzLabel;
    RzBorder1: TRzBorder;
    RzBorder2: TRzBorder;
    RzSpnWIzm: TRzSpinEdit;
    RzLabel7: TRzLabel;
    ImageList1: TImageList;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8_CopyRotKontur: TMenuItem;
    N8_Insert_GeomData: TMenuItem;
    Panel1: TPanel;
    RzPanelDraw: TRzPanel;
    RzToolbar1: TRzToolbar;
    RzToolBtnLine: TRzToolButton;
    RzToolBtnScaleUp: TRzToolButton;
    RzToolBtnScaleDown: TRzToolButton;
    RzToolBtnInscribe: TRzToolButton;
    RzToolBtnPan: TRzToolButton;
    BtnDelete: TRzToolButton;
    RzToolBtnPanFrame: TRzToolButton;
    procedure MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure RzPanelDrawMouseEnter(Sender: TObject);
    procedure RzPanelDrawMouseLeave(Sender: TObject);
    procedure RzPanelDrawCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    function  Def_ParamDraw(Kontur:PDataKonturZuba):real;
    procedure Draw_Kontur_Zuba(Kontur:PDataKonturZuba;Mode:TPenMode);
    function Circle(X1,Y1,X2,Y2,Xc,Yc,Rad:Extended;Md:TPenMode;St:TPenStyle;Wt:integer;Col:TColor):integer;
    function LineDraw(X1,Y1,X2,Y2:Extended;Md:TPenMode;St:TPenStyle;Wt:integer;Col:TColor):integer;
    procedure RzPanelDrawPaint(Sender: TObject);
    procedure RzCheckListKonturClick(Sender: TObject);
    procedure N1_DeleteClick(Sender: TObject);
    procedure RzSpin_WLineChange(Sender: TObject);
    procedure RzLabel1Click(Sender: TObject);
    procedure Shape_IndColorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Izmerit(TopLeft, BottomRight: TPoint);
    procedure RzPanelDrawMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RzCheckListKonturChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure RzCheckBoxVspGeomClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RzLblIzmColorClick(Sender: TObject);
    procedure ShapeIzmColorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RzSpnWIzmChange(Sender: TObject);
    procedure RzBitBtnDelLineClick(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
//    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure RzPanelDrawMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DrawKursorMouseMove(X, Y: Integer);
    procedure Draw_List(Sender: TObject);
    procedure RzToolBtnInscribeClick(Sender: TObject);
    procedure RzToolBtnScaleDownClick(Sender: TObject);
    procedure RzToolBtnScaleUpClick(Sender: TObject);
    procedure RzToolBtnLineClick(Sender: TObject);
    procedure RzToolBtnPanClick(Sender: TObject);
    procedure RzToolBtnPanFrameClick(Sender: TObject);
    procedure DrawPanFrame(TopLeft, BottomRight: TPoint);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure N8_CopyRotKonturClick(Sender: TObject);
    function CreateMiltiZyb(MiltiZub:PDataKonturZuba):PDataKonturZuba;
    procedure N8_Insert_GeomDataClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private

  public
   ParamDraw:TParamDraw;
   Old_Pozic_kur:TPoint;
   Base_Kolontitul,NomElement,Kolontitul: integer;
   Pan_Frame,KursAfterPaint,Working:boolean;
   Origin, MovePt:TPoint;
   PanRect:TRect;
   Izmer_1,Izmer_2:TEvPoint;
   MemLineDraw:array of TParamLine;
   PenIzmer:TPen;
   ModeView:TModeView;
   Pan_Xt,Pan_Yt,Pan_X,Pan_Y,Pan_Xst,Pan_Yst:Integer;
   DataRot:TDataRot;
  end;

var FmViewWindow: TFmViewWindow;

implementation

uses DlgRotKontur1;


{$R *.dfm}


function K_Sc(Koord:extended;Scale:real):integer;
begin
 Result:=(Round(Koord*Scale));
end;


{procedure TFmViewWindow.AppMessage(var Msg: TMsg; var Handled: Boolean);
var i: integer;
 begin
  if (Msg.message = WM_MOUSEWHEEL) then
   begin
    Msg.lParam := 0;
    i :=Msg.wParam;
     if i > 0 then
      begin
       Kolontitul:=Kolontitul+10;
       RzPanelDraw.Repaint;
      end
     else
     begin
       Kolontitul:=Kolontitul-10;
       RzPanelDraw.Repaint;
     end;
     Handled := False;
   end;
end;}


function TFmViewWindow.Def_ParamDraw(Kontur:PDataKonturZuba):real;
var    Tmp:Real;
       i:integer;
begin
 With Kontur^ do
  begin
    if RzCheckListKontur.ItemsChecked<>0 then
      begin
       for i:=0 to RzCheckListKontur.Count-1 do
        if RzCheckListKontur.Selected[i] then
         with PDataKonturZuba(RzCheckListKontur.Items.Objects[i])^ do
           begin
            if ParamDraw.Dr_Min_X>Min_X then ParamDraw.Dr_Min_X:=Min_X;
            if ParamDraw.Dr_Min_Y>Min_Y then ParamDraw.Dr_Min_Y:=Min_Y;
            if ParamDraw.Dr_Max_X<Max_X then ParamDraw.Dr_Max_X:=Max_X;
            if ParamDraw.Dr_Max_Y<Max_Y then ParamDraw.Dr_Max_Y:=Max_Y;
           end
      end
    else
     begin
      ParamDraw.Dr_Min_X:=Min_X;ParamDraw.Dr_Max_X:=Max_X;
      ParamDraw.Dr_Min_Y:=Min_Y;ParamDraw.Dr_Max_Y:=Max_Y;
     end;
  end;
  with ParamDraw do
   begin
    Dr_DlnPic_X:=abs(Dr_Max_X-Dr_Min_X);Dr_DlnPic_Y:=abs(Dr_Max_Y-Dr_Min_Y);
    if Dr_DlnPic_X>Dr_DlnPic_Y then Tmp:=Dr_DlnPic_X else Tmp:=Dr_DlnPic_Y;
    if RzPanelDraw.Width>=RzPanelDraw.Height then Scale:=(RzPanelDraw.Height-kolontitul*2)/Tmp
    else  Scale:=(RzPanelDraw.Width-kolontitul*2)/Tmp;
    Centrirovanie_Y:=Round((RzPanelDraw.Height-K_Sc(Dr_DlnPic_Y,Scale))/2);
    Centrirovanie_X:=Round((RzPanelDraw.Width-K_Sc(Dr_DlnPic_X,Scale))/2)
   end;
  result:=1;
end;

function TFmViewWindow.Circle(X1,Y1,X2,Y2,Xc,Yc,Rad:Extended;Md:TPenMode;St:TPenStyle;Wt:integer;Col:TColor):integer;
var  X_L,Y_L,X_R,Y_R:integer;
     X1_t,Y1_t,X2_t,Y2_t:integer;
     Mdt:TPenMode;
     Stt:TPenStyle;
     Colt:TColor;
     Wtt:Integer;

begin

 With RzPanelDraw.Canvas do
  begin
    mdt:=Pen.Mode;stt:=Pen.Style;Colt:=Pen.Color;Wtt:=Pen.Width;
    Pen.Mode:=Md;Pen.Color:=Col;Pen.Style:=St;Pen.Width:=Wt;

    X_L:=K_Sc(Xc-Rad-ParamDraw.Dr_Min_X,ParamDraw.Scale)+ParamDraw.Centrirovanie_X;
    Y_L:=K_Sc(ParamDraw.Dr_Max_Y-Rad-Yc,ParamDraw.Scale)+ParamDraw.Centrirovanie_Y;
    X_R:=K_Sc(Xc+Rad-ParamDraw.Dr_Min_X,ParamDraw.Scale)+ParamDraw.Centrirovanie_X;
    Y_R:=K_Sc(ParamDraw.Dr_Max_Y+rad-Yc,ParamDraw.Scale)+ParamDraw.Centrirovanie_Y;

    X1_t:=K_Sc(X1-ParamDraw.Dr_Min_X,ParamDraw.Scale)+ParamDraw.Centrirovanie_X;
    Y1_t:=K_Sc(ParamDraw.Dr_Max_Y-Y1,ParamDraw.Scale)+ParamDraw.Centrirovanie_Y;
    X2_t:=K_Sc(X2-ParamDraw.Dr_Min_X,ParamDraw.Scale)+ParamDraw.Centrirovanie_X;
    Y2_t:=K_Sc(ParamDraw.Dr_Max_Y-Y2,ParamDraw.Scale)+ParamDraw.Centrirovanie_Y;

    Arc(X_L+Pan_X,Y_L+Pan_Y,X_R+Pan_X,Y_R+Pan_Y,X1_t+Pan_X,Y1_t+Pan_Y,X2_t+Pan_X,Y2_t+Pan_Y);
    Pen.Mode:=mdt; Pen.Style:=stt; Pen.Color:=Colt; Pen.Width:=Wtt;
  end;
end;



function TFmViewWindow.LineDraw(X1,Y1,X2,Y2:Extended;Md:TPenMode;St:TPenStyle;Wt:integer;Col:TColor):integer;
var  Mdt:TPenMode;
     Stt:TPenStyle;
     Colt:TColor;
     Wtt:Integer;
begin
  With RzPanelDraw.Canvas do
   begin
    mdt:=Pen.Mode;stt:=Pen.Style;Colt:=Pen.Color;Wtt:=Pen.Width;
    Pen.Mode:=Md;Pen.Color:=Col;Pen.Style:=St;Pen.Width:=Wt;
    MoveTo(K_Sc(X1-ParamDraw.Dr_Min_X,ParamDraw.Scale)+ParamDraw.Centrirovanie_X+Pan_X,
       K_Sc(ParamDraw.Dr_Max_Y-Y1,ParamDraw.Scale)+ParamDraw.Centrirovanie_Y+Pan_Y);
    LineTo((K_Sc(X2-ParamDraw.Dr_Min_X,ParamDraw.Scale)+ParamDraw.Centrirovanie_X+Pan_X),
       K_Sc(ParamDraw.Dr_Max_Y-Y2,ParamDraw.Scale)+ParamDraw.Centrirovanie_Y+Pan_Y);
    Pen.Mode:=mdt; Pen.Style:=stt; Pen.Color:=Colt; Pen.Width:=Wtt;
   end;
end;



procedure TFmViewWindow.Draw_Kontur_Zuba(Kontur:PDataKonturZuba;Mode:TPenMode);
var i,r:integer;
begin
 if not Pan_Frame then Def_ParamDraw(Kontur);
 With Kontur^ do
  begin
    for i:=0 to length(Point)-1 do
    with Point[i] do
     begin
      if i=0 then LineDraw(X1,Y1,X1,Y1,Mode,psSolid,W_Line,Color)
      else  if Point[i-1].info='Y' then
       LineDraw(Point[i-1].X1,Point[i-1].Y1,X1,Y1,Mode,psSolid,W_Line,Color);
     end;
    with InputData do
     begin
       TRzStPane_M.Caption:='m='+m;TRzStPane_Ao.Caption:='Ao='+Ao;
       TRzStPane_C.Caption:='c='+copy(c,1,6);
       TRzStPane_Z.Caption:='z='+Z;
       TRzStPane_KorB.Caption:='Kb='+Kbz;TRzStPane_Ha.Caption:='ha='+copy(Ha,1,6);
       TRzStPane_Y.Caption:='Y='+copy(Y,1,6);TRzStPane_Kx.Caption:='Xk='+copy(Xk,1,6);
      if RzCheckBoxVspGeom.Checked then
        begin
           Circle(0,0,0,0,0,0,StrToFloat(Da)/2,Mode,psSolid	,1,clBlue);
           Circle(0,0,0,0,0,0,StrToFloat(D)/2,Mode,psDashDotDot	,1,clBlack);
           Circle(0,0,0,0,0,0,StrToFloat(Df)/2,Mode,psSolid	,1,clBlue);
           r:=round(StrToFloat(Da)+20);
           LineDraw(-r,0,r,0,Mode,psDashDot,1,clBlack);
           LineDraw(0,r,0,-r,Mode,psDashDot,1,clBlack);
        end;
     end;
     Shape_IndColor.Brush.Color:=Color;
  end;

end;

procedure TFmViewWindow.DrawKursorMouseMove(X, Y: Integer);
begin
 with RzPanelDraw.Canvas  do
  begin
   Pen.Color:=Color;
   Pen.Width:=1;
   Pen.Mode:=pmXor;
    if  not KursAfterPaint then
      begin
       MoveTo(Old_Pozic_kur.X, 0);
       LineTo(Old_Pozic_kur.X, Height);
       MoveTo(0,Old_Pozic_kur.Y);
       LineTo(Width,Old_Pozic_kur.Y );
       MoveTo(X, 0);
       LineTo(X, Height);
       MoveTo(0,Y);
       LineTo(Width,Y );
       Old_Pozic_kur.X:=X;Old_Pozic_kur.Y:=Y;
      end
    else
      begin
       MoveTo(X, 0);
       LineTo(X, Height);
       MoveTo(0,Y);
       LineTo(Width,Y );
       KursAfterPaint:=False;
       Old_Pozic_kur.X:=X;Old_Pozic_kur.Y:=Y;
       end;
  end
end;

procedure TFmViewWindow.MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
 var Scal,x_T,y_T:real;
begin
   if RzCheckListKontur.Count<>0 then
     begin
       x_T:=ParamDraw.Dr_Min_X+(X-ParamDraw.Centrirovanie_X-Pan_X)/ParamDraw.Scale;
       y_T:=ParamDraw.Dr_Max_Y-(Y-ParamDraw.Centrirovanie_Y-Pan_Y)/ParamDraw.Scale;
     end
   else begin x_T:=X;y_T:=Y end;

   RzStatusPaneKoordX.Caption:=Format('X '+'%3.3f',[x_T]);
   RzStatusPaneKoordY.Caption:=Format('Y '+'%3.3f',[y_T]);

  if Working then
   case ModeView of
    Pan: begin
       Pan_X:=X-Pan_Xst+Pan_Xt;
       Pan_Y:=Y-Pan_Yst+Pan_Yt;
       RzPanelDraw.Repaint;
       DrawKursorMouseMove(X,Y);
       exit;
     end;
    Line: begin
       Izmerit(Origin, MovePt);
       MovePt := Point(X, Y);
       Izmerit(Origin, MovePt);
       x_t:=ParamDraw.Dr_Min_X+(X-ParamDraw.Centrirovanie_X-Pan_X)/ParamDraw.Scale;
       y_t:=ParamDraw.Dr_Max_Y-(Y-ParamDraw.Centrirovanie_Y-Pan_Y)/ParamDraw.Scale;
       RzEdit1.Text:=Format('%4.6f',[sqrt(sqr(x_t-Izmer_1.X1)+sqr(y_t-Izmer_1.Y1))]);
     end;
   PanFrame:
    begin
      DrawPanFrame(Origin, MovePt);
      MovePt := Point(X, Y);
      DrawPanFrame(Origin, MovePt);
    end;
  end;

  DrawKursorMouseMove(X,Y);
  if KursAfterPaint then KursAfterPaint:=False;
end;

procedure TFmViewWindow.FormCreate(Sender: TObject);
begin
 RzPanelDraw.Canvas.FillRect(ClientRect);Working:=false;Pan_X:=0;Pan_Y:=0;
 Pan_Xt:=0;Pan_Yt:=0;KursAfterPaint:=False;ModeView:=None;
 Old_Pozic_kur.X:=0;Old_Pozic_kur.Y:=0;
 Base_Kolontitul:=10;NomElement:=0;Pan_Frame:=False;

 Kolontitul:=Base_Kolontitul;
 PenIzmer:=TPen.Create;

 PenIzmer.Color:=clGray;PenIzmer.Width:=1;PenIzmer.Style:=psSolid;
 PenIzmer.Mode :=pmNotXor;
 ShapeIzmColor.Brush.Color:=PenIzmer.Color;

  with RzPanelDraw.Canvas  do
   begin
    Pen.Color:=clRed;
    Pen.Width:=1;
    Pen.Mode:=pmCopy;
   end;
end;

procedure TFmViewWindow.RzPanelDrawMouseEnter(Sender: TObject);
var CState:integer;
begin
  if (Working) and (ModeView=Line) then begin Izmerit(Origin, MovePt);MovePt:=Origin end;
  CState := ShowCursor(True);
  while Cstate >= 0 do  Cstate := ShowCursor(False);
  RzPanelDraw.SetFocus;
end;

procedure TFmViewWindow.RzPanelDrawMouseLeave(Sender: TObject);
var CState:integer;
begin
  CState := ShowCursor(True);
  if ModeView=Pan then
   begin  Working:=False;  Pan_Xt:=Pan_X;Pan_Yt:=Pan_Y; end;
end;

procedure TFmViewWindow.RzPanelDrawCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
 Old_Pozic_kur.X:=0;Old_Pozic_kur.Y:=0;
 RzPanelDraw.Repaint
end;


procedure TFmViewWindow.Draw_List(Sender: TObject);
var i:integer;
begin
  if RzCheckListKontur.Count>0 then
    begin
     Draw_Kontur_Zuba(PDataKonturZuba(RzCheckListKontur.Items.Objects[RzCheckListKontur.ItemIndex]),pmCopy);
     if (RzCheckListKontur.Count<>0) then
      for i:=0 to RzCheckListKontur.Count-1 do
       if RzCheckListKontur.ItemChecked[i] then
        Draw_Kontur_Zuba(PDataKonturZuba(RzCheckListKontur.Items.Objects[i]),pmCopy);
    end
  else
  begin
   Old_Pozic_kur.X:=0;Old_Pozic_kur.Y:=0;
   TRzStPane_M.Caption:='m=';TRzStPane_Ao.Caption:='Ao=';
   TRzStPane_C.Caption:='c=';
   TRzStPane_Z.Caption:='z=';
   TRzStPane_KorB.Caption:='Kb=';TRzStPane_Ha.Caption:='ha=';
   TRzStPane_Y.Caption:='Y=';TRzStPane_Kx.Caption:='Xk=';
  end;
end;


procedure TFmViewWindow.RzPanelDrawPaint(Sender: TObject);
var i:integer;
begin
 if RzCheckListKontur.Count<>0 then Draw_List(Sender);

 if Length(MemLineDraw)<>0 then
  for i:=0 to NomElement-1 do
    with MemLineDraw[i] do
     LineDraw(X1,Y1,X2,Y2,pmCopy,Pen.Style,Pen.Width,Pen.Color);
 KursAfterPaint:=True;
end;


procedure TFmViewWindow.N1_DeleteClick(Sender: TObject);
var i,ii:integer;
begin
 ii:=RzCheckListKontur.ItemIndex;
  if RzCheckListKontur.Count<>0 then
   begin
    Dispose(PDataKonturZuba(RzCheckListKontur.Items.Objects[RzCheckListKontur.ItemIndex]));
    RzCheckListKontur.Items.Delete(RzCheckListKontur.ItemIndex);
    for i:=0 to RzCheckListKontur.Count-1 do
       RzCheckListKontur.Items.Strings[i]:='Контур '+IntTostr(i+1);
   end;
  RzPanelDraw.Canvas.FillRect(ClientRect);
  if RzCheckListKontur.Count<>0 then
   if ii+1>RzCheckListKontur.Count then RzCheckListKontur.ItemIndex:=ii-1
    else RzCheckListKontur.ItemIndex:=ii;
   RzPanelDraw.Repaint;
end;

procedure TFmViewWindow.RzSpin_WLineChange(Sender: TObject);
begin
 PDataKonturZuba(RzCheckListKontur.Items.Objects[RzCheckListKontur.ItemIndex]).W_Line:=trunc(RzSpin_WLine.value);
 RzPanelDraw.Repaint;
end;

procedure TFmViewWindow.RzLabel1Click(Sender: TObject);
begin
 ColorDialog1.Color:= PDataKonturZuba(RzCheckListKontur.Items.Objects[RzCheckListKontur.ItemIndex]).Color;
 if ColorDialog1.Execute then
 PDataKonturZuba(RzCheckListKontur.Items.Objects[RzCheckListKontur.ItemIndex]).Color:=ColorDialog1.Color;
 Shape_IndColor.Brush.Color:=ColorDialog1.Color;
 RzPanelDraw.Repaint;
end;

procedure TFmViewWindow.Shape_IndColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
RzLabel1Click(Sender);
end;

procedure TFmViewWindow.RzCheckListKonturClick(Sender: TObject);
begin
 if RzCheckListKontur.ItemsChecked=0 then
  begin
   with PDataKonturZuba(RzCheckListKontur.Items.Objects[RzCheckListKontur.ItemIndex])^ do
    begin
     RzPanelDraw.Canvas.FillRect(ClientRect);
     RzSpin_WLine.Value:=W_Line;
     Shape_IndColor.Brush.Color:=Color;
    end;
   Old_Pozic_kur.X:=0;Old_Pozic_kur.Y:=0;
   RzPanelDraw.Repaint;
  end
   else Shape_IndColor.Brush.Color:=PDataKonturZuba(RzCheckListKontur.Items.Objects[RzCheckListKontur.ItemIndex])^.Color;
  RzCheckBoxVspGeom.Checked:=PDataKonturZuba(RzCheckListKontur.Items.Objects[RzCheckListKontur.ItemIndex])^.VspGeom;

  with PDataKonturZuba(RzCheckListKontur.Items.Objects[RzCheckListKontur.ItemIndex])^.InputData do
     begin
       TRzStPane_M.Caption:='m='+m;TRzStPane_Ao.Caption:='Ao='+Ao;
       TRzStPane_C.Caption:='c='+copy(c,1,6);
       TRzStPane_Z.Caption:='z='+Z;
       TRzStPane_KorB.Caption:='Kb='+Kbz;TRzStPane_Ha.Caption:='ha='+copy(Ha,1,6);
       TRzStPane_Y.Caption:='Y='+copy(Y,1,6);TRzStPane_Kx.Caption:='Xk='+copy(Xk,1,6);
     end;
end;


procedure TFmViewWindow.Izmerit(TopLeft, BottomRight: TPoint);
begin
  with RzPanelDraw.Canvas do
  begin
    Pen:=PenIzmer;
    MoveTo(TopLeft.X, TopLeft.Y);
    LineTo(BottomRight.X, BottomRight.Y);
  end;
end;


procedure TFmViewWindow.DrawPanFrame(TopLeft, BottomRight: TPoint);
begin
  with RzPanelDraw.Canvas do
  begin
    Pen:=PenIzmer;
    MoveTo(TopLeft.X, TopLeft.Y);
    LineTo(TopLeft.X, BottomRight.Y);
    LineTo(BottomRight.X, BottomRight.Y);
    LineTo(BottomRight.X, TopLeft.Y);
    LineTo(TopLeft.X, TopLeft.Y);
  end;
end;


procedure TFmViewWindow.RzPanelDrawMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ModeView=Pan then Working:=false;
  if Button=mbMiddle then ModeView:=None;
  Pan_Xt:=Pan_X;Pan_Yt:=Pan_Y;
  DrawKursorMouseMove(X,Y);
end;

procedure TFmViewWindow.RzPanelDrawMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Tmp:Real;
begin
  if Button=mbMiddle then
   begin
     Working:=True;
     Pan_Xst:=X;
     Pan_Yst:=Y;
     ModeView:=Pan;
   end;
  if (Button=mbRight) and (ModeView=Line) and (Working) then
   begin
    Izmerit(Origin, MovePt);Working:=False;Exit
   end;

 if Button=mbLeft then
  case ModeView of
    Pan: begin
          working:=not working;
          Pan_Xst:=X;
          Pan_Yst:=Y;
          end;
    Line:begin
        if not Working then
          begin
           Working:=true;
           RzPanelDraw.Canvas.MoveTo(X, Y);
           Origin:=Point(X,Y);
           MovePt:=Origin;
           Izmer_1.X1:=ParamDraw.Dr_Min_X+(X-ParamDraw.Centrirovanie_X-Pan_X)/ParamDraw.Scale;
           Izmer_1.Y1:=ParamDraw.Dr_Max_Y-(Y-ParamDraw.Centrirovanie_Y-Pan_Y)/ParamDraw.Scale;
           if Length(MemLineDraw)=0 then SetLength(MemLineDraw,10);
           if Length(MemLineDraw)-1=NomElement then SetLength(MemLineDraw,Length(MemLineDraw)+10);
           with MemLineDraw[NomElement] do
            begin
              X1:=Izmer_1.X1;
              Y1:=Izmer_1.Y1;
              Pen:=PenIzmer;
            end
          end
        else
         begin
           Working:=not Working;
           Izmer_2.X1:=ParamDraw.Dr_Min_X+(X-ParamDraw.Centrirovanie_X-Pan_X)/ParamDraw.Scale;
           Izmer_2.Y1:=ParamDraw.Dr_Max_Y-(Y-ParamDraw.Centrirovanie_Y-Pan_Y)/ParamDraw.Scale;
           RzEdit1.Text:=Format('%4.6f',[sqrt(sqr(Izmer_2.X1-Izmer_1.X1)+sqr(Izmer_2.Y1-Izmer_1.Y1))]);
           with MemLineDraw[NomElement] do
            begin
              X2:=Izmer_2.X1;
              Y2:=Izmer_2.Y1;
              inc(NomElement);
            end
         end
     end;
    PanFrame:
        if not Working then
          begin
           Working:=true;Kolontitul:=0;
           RzPanelDraw.Canvas.MoveTo(X, Y);
           Izmer_1.X1:=ParamDraw.Dr_Min_X+(X-ParamDraw.Centrirovanie_X-Pan_X)/ParamDraw.Scale;
           Izmer_1.Y1:=ParamDraw.Dr_Max_Y-(Y-ParamDraw.Centrirovanie_Y-Pan_Y)/ParamDraw.Scale;
           Origin:=Point(X,Y);
           MovePt:=Origin;
           Pan_Frame:=True;
          end
        else
         begin
           Working:=not Working;
           Izmer_2.X1:=ParamDraw.Dr_Min_X+(X-ParamDraw.Centrirovanie_X-Pan_X)/ParamDraw.Scale;
           Izmer_2.Y1:=ParamDraw.Dr_Max_Y-(Y-ParamDraw.Centrirovanie_Y-Pan_Y)/ParamDraw.Scale;
           MovePt:=Point(X,Y);
           DrawPanFrame(Origin, MovePt);
           if Izmer_1.X1<Izmer_2.X1 then
            begin
             ParamDraw.Dr_Min_X:=Izmer_1.X1;ParamDraw.Dr_Max_X:=Izmer_2.X1
            end
           else
            begin
             ParamDraw.Dr_Min_X:=Izmer_2.X1;ParamDraw.Dr_Max_X:=Izmer_1.X1
            end;

           if Izmer_1.Y1<Izmer_2.Y1 then
            begin
              ParamDraw.Dr_Min_Y:=Izmer_1.Y1;ParamDraw.Dr_Max_Y:=Izmer_2.Y1
            end
           else
            begin
             ParamDraw.Dr_Min_Y:=Izmer_2.Y1;ParamDraw.Dr_Max_Y:=Izmer_1.Y1
            end;

           with ParamDraw do
             begin
              Dr_DlnPic_X:=abs(Dr_Max_X-Dr_Min_X);Dr_DlnPic_Y:=abs(Dr_Max_Y-Dr_Min_Y);
              if Dr_DlnPic_X>Dr_DlnPic_Y then Tmp:=Dr_DlnPic_X else Tmp:=Dr_DlnPic_Y;
              if RzPanelDraw.Width>=RzPanelDraw.Height then Scale:=(RzPanelDraw.Height-kolontitul*2)/Tmp
              else  Scale:=(RzPanelDraw.Width-kolontitul*2)/Tmp;
              Centrirovanie_Y:=Round((RzPanelDraw.Height-K_Sc(Dr_DlnPic_Y,Scale))/2);
              Centrirovanie_X:=Round((RzPanelDraw.Width-K_Sc(Dr_DlnPic_X,Scale))/2)
            end;
            Working:=False;
            RzPanelDraw.Repaint;
         end
  end;
end;


procedure TFmViewWindow.RzCheckListKonturChange(Sender: TObject;
  Index: Integer; NewState: TCheckBoxState);
begin
 RzPanelDraw.Repaint;
end;

procedure TFmViewWindow.RzCheckBoxVspGeomClick(Sender: TObject);
begin
 PDataKonturZuba(RzCheckListKontur.Items.Objects[RzCheckListKontur.ItemIndex])^.VspGeom:=RzCheckBoxVspGeom.Checked;
 RzPanelDraw.Repaint;
end;

procedure TFmViewWindow.RzBitBtn1Click(Sender: TObject);
begin
 if RzEdit1.Text<>'' then RzMemo1.Lines.Add(RzEdit1.Text);
end;

procedure TFmViewWindow.FormDestroy(Sender: TObject);
var i:integer;
begin
 For i:=0 to RzCheckListKontur.Count-1 do
  if RzCheckListKontur.Items.Objects[i]<>nil then
    Dispose(PDataKonturZuba(RzCheckListKontur.Items.Objects[i]));
end;

procedure TFmViewWindow.RzLblIzmColorClick(Sender: TObject);
begin
 ColorDialog1.Color:=PenIzmer.Color;
 if ColorDialog1.Execute then PenIzmer.Color:=ColorDialog1.Color;
 ShapeIzmColor.Brush.Color:=PenIzmer.Color;
 RzPanelDraw.Repaint;
end;

procedure TFmViewWindow.ShapeIzmColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 RzLblIzmColorClick(sender);
end;

procedure TFmViewWindow.RzSpnWIzmChange(Sender: TObject);
begin
 PenIzmer.Width:=trunc(RzSpnWIzm.value);
 RzPanelDraw.Repaint;
end;

procedure TFmViewWindow.RzBitBtnDelLineClick(Sender: TObject);
begin
 if Length(MemLineDraw)<>0 then
  begin
   NomElement:=0;SetLength(MemLineDraw,0);
   RzPanelDraw.Repaint;
  end;

end;

procedure TFmViewWindow.RzBitBtn2Click(Sender: TObject);
begin
 Kolontitul:=Kolontitul+10;
 RzPanelDraw.Repaint;
end;

procedure TFmViewWindow.FormMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var i:integer;
    tmp:real;
begin
 if (ssCtrl in Shift) or (ssShift in Shift) then i:=10 else i:=2;
 Kolontitul:=Kolontitul+i;
 Old_Pozic_kur.X:=0;Old_Pozic_kur.Y:=0;
   with ParamDraw do
  begin
   if Dr_DlnPic_X>Dr_DlnPic_Y then Tmp:=Dr_DlnPic_X else Tmp:=Dr_DlnPic_Y;
   if Pan_Frame then
   if RzPanelDraw.Width>=RzPanelDraw.Height then Scale:=(RzPanelDraw.Height-kolontitul*2)/Tmp
     else  Scale:=(RzPanelDraw.Width-kolontitul*2)/Tmp;
  end;

 RzPanelDraw.Repaint;
end;

procedure TFmViewWindow.FormMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var i:integer;
     tmp:real;
begin
 if (ssCtrl in Shift) or (ssShift in Shift) then i:=10 else i:=2;
 Kolontitul:=Kolontitul-i;
 Old_Pozic_kur.X:=0;Old_Pozic_kur.Y:=0;
 with ParamDraw do
  begin
   if Dr_DlnPic_X>Dr_DlnPic_Y then Tmp:=Dr_DlnPic_X else Tmp:=Dr_DlnPic_Y;
   if Pan_Frame then
   if RzPanelDraw.Width>=RzPanelDraw.Height then Scale:=(RzPanelDraw.Height-kolontitul*2)/Tmp
     else  Scale:=(RzPanelDraw.Width-kolontitul*2)/Tmp;
  end;
 RzPanelDraw.Repaint;
end;

procedure TFmViewWindow.RzToolBtnScaleDownClick(Sender: TObject);
begin
 Kolontitul:=Kolontitul+5;
 Old_Pozic_kur.X:=0;Old_Pozic_kur.Y:=0;
 RzPanelDraw.Repaint;
end;

procedure TFmViewWindow.RzToolBtnInscribeClick(Sender: TObject);
begin
 Pan_Xt:=0;Pan_Yt:=0;Pan_X:=0;Pan_Y:=0;
 ModeView:=None;Pan_Frame:=False;
 Kolontitul:=Base_Kolontitul;
 RzPanelDraw.Repaint;
end;

procedure TFmViewWindow.RzToolBtnScaleUpClick(Sender: TObject);
begin
 Kolontitul:=Kolontitul-5;
 Old_Pozic_kur.X:=0;Old_Pozic_kur.Y:=0;
 RzPanelDraw.Repaint;
end;

procedure TFmViewWindow.RzToolBtnLineClick(Sender: TObject);
begin
 if ModeView=Line then ModeView:=None else ModeView:=Line;
end;

procedure TFmViewWindow.RzToolBtnPanClick(Sender: TObject);
begin
 if ModeView=Pan then ModeView:=None else ModeView:=Pan;
end;

procedure TFmViewWindow.RzToolBtnPanFrameClick(Sender: TObject);
begin
 if ModeView=PanFrame then ModeView:=None else  ModeView:=PanFrame;
end;

procedure TFmViewWindow.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if (ord(Key)=27) and (ModeView=Line) and (Working) then
  begin
    Izmerit(Origin, MovePt);Working:=False;Exit
  end;
end;


function TFmViewWindow.CreateMiltiZyb(MiltiZub:PDataKonturZuba):PDataKonturZuba;
var  np,i,j:integer;
     Pnt:TMPoint;
begin
 New(Result);np:=0;
 Result^:=MiltiZub^;
 with MiltiZub^ do
  begin
    SetLength(Result^.Point,N_Point*2*DataRot.N_Z);
    np:=(N_Point*2)-1;
   with Result^ do
     begin
      for i:=1 to DataRot.N_Z-1 do
       begin
        for j:=0 to (N_Point*2)-1 do
         begin
          inc(np);
          Pnt:=PointRot(DataRot.Xc,DataRot.Yc,Point[j].X1,Point[j].Y1,DataRot.Angle*i);
          Point[np].X1:=Pnt.X1;
          Point[np].Y1:=Pnt.Y1;
          Point[np].info:='Y';
          if Pnt.X1>Max_X then Max_X:=Pnt.X1
           else if Pnt.X1<Min_X then Min_X:=Pnt.X1;
            if Pnt.Y1>Max_Y then Max_Y:=Pnt.Y1
             else if Pnt.Y1<Min_Y then Min_Y:=Pnt.Y1;
         end;
        Point[np].info:='N';
       end;
       DlnPic_X:=abs(Max_X-Min_X);DlnPic_Y:=abs(Max_Y-Min_Y);
     end
  end;
 Dispose(MiltiZub);
end;

procedure TFmViewWindow.N8_CopyRotKonturClick(Sender: TObject);
var   Rez:TModalResult;
begin
 FmDlgRotKontur.RzNumericEditRotAngle.Value:=360/StrToInt(PDataKonturZuba(RzCheckListKontur.Items.Objects[RzCheckListKontur.ItemIndex])^.InputData.Z);
 FmDlgRotKontur.RzSpinEdit_NZub.IntValue:=StrToInt(PDataKonturZuba(RzCheckListKontur.Items.Objects[RzCheckListKontur.ItemIndex])^.InputData.Z);
 if RzCheckListKontur.Count<>0 then Rez:=FmDlgRotKontur.ShowModal;
 if (Rez<>mrOk) and (DataRot.N_Z>1) then exit
  else
    begin
     RzCheckListKontur.Items.Objects[RzCheckListKontur.ItemIndex]:=
     pointer(CreateMiltiZyb(PDataKonturZuba(RzCheckListKontur.Items.Objects[RzCheckListKontur.ItemIndex])));
     RzPanelDraw.Canvas.FillRect(ClientRect);
     RzPanelDraw.Repaint;
    end;
end;

procedure TFmViewWindow.N8_Insert_GeomDataClick(Sender: TObject);
var Data:TInputData;
    i:integer;
begin

 Data:=PDataKonturZuba(RzCheckListKontur.Items.Objects[RzCheckListKontur.ItemIndex])^.InputData;

 with FmRashetEvolv do
  begin
     RzMemo1.Lines.Add('===============Исходные данные для построения эвольвенты==============='+#13+#10);
     RzMemo1.Lines.Add('Модуль: '+Data.m+'; Число зубьев: '+Data.z+'; Угол зацепления: '+Data.Ao+';');
     RzMemo1.Lines.Add('Коэффициент смещения исходного контура: '+Data.Xk+';');
     RzMemo1.Lines.Add('Коэффициент высоты головки зуба: '+Data.Ha+';');
     RzMemo1.Lines.Add('Коэффициент уравнительного смещения: '+Data.y+';');
     RzMemo1.Lines.Add('Коэффициент радиального зазора: '+Data.c+';');
     RzMemo1.Lines.Add('Наружный диаметр: '+Data.Da+'; Делительный диаметр: '+Data.D+';');
     RzMemo1.Lines.Add('Диаметр впадин: '+Data.Df+'; Диаметр основной окружности: '+Data.Db+';'+#13+#10);

    RzMemo1.Lines.Add('===========Расчетные координаты точек эвольвенты в декартовых координатах======='+#13+#10);
     With PDataKonturZuba(RzCheckListKontur.Items.Objects[RzCheckListKontur.ItemIndex])^ do
      begin
       for i:=0 to length(Point)-1 do
         begin
          RzMemo1.Lines.Add(Format('N'+inttostr(i+1)+' X%1.'+FloatTostr(RzSpinEditToch_P.Value)+'f'+
          ' Y%1.'+FloatTostr(RzSpinEditToch_P.Value)+'f',[Point[i].X1, Point[i].Y1]) );
         end;
      end;
  end;

end;

procedure TFmViewWindow.PopupMenu1Popup(Sender: TObject);
var i:integer;
begin
 if RzCheckListKontur.Count=0 then
  for i:=0 to PopupMenu1.Items.Count-1 do
  PopupMenu1.Items[i].Enabled:=false else
    for i:=0 to PopupMenu1.Items.Count-1 do
  PopupMenu1.Items[i].Enabled:=True;
end;

end.
