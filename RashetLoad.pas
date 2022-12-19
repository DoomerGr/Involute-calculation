unit RashetLoad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzLstBox, ExtCtrls, RzPanel, RzLabel, Menus,
  RzShellDialogs, ImgList;

type
  TFmLoadRashet = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzListBoxRashet: TRzListBox;
    RzBitBtnLoad: TRzBitBtn;
    RzBitBtnClose: TRzBitBtn;
    RzBitBtnDelete: TRzBitBtn;
    mmFileMenu: TMainMenu;
    N1: TMenuItem;
    MnISaveFileBase: TMenuItem;
    N3_LoadFile: TMenuItem;
    MnISaveFileAs: TMenuItem;
    N5: TMenuItem;
    RzOpenDlgBaseFile: TRzOpenDialog;
    N6: TMenuItem;
    N7: TMenuItem;
    RzSvDlgSaveFileBase: TRzSaveDialog;
    ImageList1: TImageList;
    procedure RzBitBtnCloseClick(Sender: TObject);
    procedure RzBitBtnLoadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzBitBtnDeleteClick(Sender: TObject);
    procedure RzListBoxRashetDblClick(Sender: TObject);
    procedure N3_LoadFileClick(Sender: TObject);
    procedure LoadDataWin;
    procedure MnISaveFileAsClick(Sender: TObject);
    procedure MnISaveFileBaseClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure MnISaveFileAsMeasureItem(Sender: TObject; ACanvas: TCanvas;
      var Width, Height: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmLoadRashet: TFmLoadRashet;

implementation

uses Raschet_1;

{$R *.dfm}

procedure TFmLoadRashet.RzBitBtnCloseClick(Sender: TObject);
begin
 Close
end;

procedure TFmLoadRashet.RzBitBtnLoadClick(Sender: TObject);
begin
 FmRashetEvolv.LoadItemArray(RzListBoxRashet.ItemIndex);
 close
end;

procedure TFmLoadRashet.FormShow(Sender: TObject);
begin
  LoadDataWin
end;


procedure TFmLoadRashet.LoadDataWin;
var i:Integer;
begin
 RzListBoxRashet.Clear;
 with FmRashetEvolv do
  for i:=0 to Length(MSaveData)-1 do
   begin
    RzListBoxRashet.Add(IntToStr(i+1)+'. '+MSaveData[i].Name_Rashet)
   end;
  if RzListBoxRashet.Items.Count=0 then
   begin
    MnISaveFileBase.Enabled:=False;
    MnISaveFileAs.Enabled:=False;
    RzBitBtnDelete.Enabled:=False;
    RzBitBtnLoad.Enabled:=False
   end
    else
     begin
      MnISaveFileBase.Enabled:=True;
      MnISaveFileAs.Enabled:=True;
      RzBitBtnDelete.Enabled:=True;
      RzBitBtnLoad.Enabled:=True;
     end;
  RzListBoxRashet.ItemIndex:=0;
end;

procedure TFmLoadRashet.RzBitBtnDeleteClick(Sender: TObject);
var p,i:integer;

begin
 if RzListBoxRashet.Items.Count=0 then Exit;
 p:=RzListBoxRashet.ItemIndex;

 with FmRashetEvolv do
  begin
   for i:=RzListBoxRashet.ItemIndex to  High(MSaveData)-1 do
    begin
     MSaveData[i]:=MSaveData[i+1]
    end;
    SetLength(MSaveData,Length(MSaveData)-1);

  end;
 RzListBoxRashet.Clear;

 with FmRashetEvolv do
  begin
   ComBoxNameRashet.Clear;
   for i:=0 to Length(MSaveData)-1 do
    begin
     RzListBoxRashet.Add(IntToStr(i+1)+'. '+MSaveData[i].Name_Rashet);
     ComBoxNameRashet.Items.Add(MSaveData[i].Name_Rashet);
    end;
  end;

   if RzListBoxRashet.Items.Count=0 then
   begin
    MnISaveFileBase.Enabled:=False;
    MnISaveFileAs.Enabled:=False;
    RzBitBtnDelete.Enabled:=False;
    RzBitBtnLoad.Enabled:=False
   end
    else
     begin
      RzBitBtnDelete.Enabled:=True;
      RzBitBtnLoad.Enabled:=True;
      MnISaveFileBase.Enabled:=True;
      MnISaveFileAs.Enabled:=True;
     end;
    if RzListBoxRashet.Items.Count<>0 then
     if p>RzListBoxRashet.Items.Count-1 then  RzListBoxRashet.ItemIndex:=RzListBoxRashet.Items.Count-1
      else RzListBoxRashet.ItemIndex:=p
    else
       with FmRashetEvolv do
        begin
         SetLength(MSaveData,1);
         MSaveData[0]:=DefoltData;
         LoadItemArray(0)
        end;
    FmRashetEvolv.Count_Rashet:=Length(FmRashetEvolv.MSaveData);
    FmRashetEvolv.LoadItemArray(0);
end;

procedure TFmLoadRashet.RzListBoxRashetDblClick(Sender: TObject);
begin
  if RzListBoxRashet.ItemIndex>=0 then
   begin
    FmRashetEvolv.LoadItemArray(RzListBoxRashet.ItemIndex);
    close
   end;
end;

procedure TFmLoadRashet.N3_LoadFileClick(Sender: TObject);
begin
 if RzOpenDlgBaseFile.Execute then
  begin
   FmRashetEvolv.NameFileBase:=RzOpenDlgBaseFile.FileName;
   FmRashetEvolv.OpenBaseFile(FmRashetEvolv.NameFileBase);
   LoadDataWin
  end;
end;

procedure TFmLoadRashet.MnISaveFileAsClick(Sender: TObject);
begin
 if RzSvDlgSaveFileBase.Execute then
  begin
    FmRashetEvolv.NameFileBase:=RzSvDlgSaveFileBase.FileName;
    FmRashetEvolv.SaveBaseFile(FmRashetEvolv.NameFileBase);
  end;
end;

procedure TFmLoadRashet.MnISaveFileBaseClick(Sender: TObject);
begin
 FmRashetEvolv.SaveBaseFile(FmRashetEvolv.NameFileBase)
end;

procedure TFmLoadRashet.N7Click(Sender: TObject);
begin
 close
end;


procedure TFmLoadRashet.MnISaveFileAsMeasureItem(Sender: TObject;
  ACanvas: TCanvas; var Width, Height: Integer);
begin
 Width:=Width+2;
 Height:=Height+6;
end;

end.
