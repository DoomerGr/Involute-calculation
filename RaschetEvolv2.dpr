program RaschetEvolv2;

uses
  Forms,
  Raschet_1 in 'Raschet_1.pas' {FmRashetEvolv},
  ViewWin in 'ViewWin.pas' {FmViewWindow},
  DlgRotKontur1 in 'DlgRotKontur1.pas' {FmDlgRotKontur},
  RashetLoad in 'RashetLoad.pas' {FmLoadRashet},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  TStyleManager.TrySetStyle('Lavender Classico');
  Application.Title := 'Расчет эвольвентного профиля';
  Application.CreateForm(TFmRashetEvolv, FmRashetEvolv);
  Application.CreateForm(TFmViewWindow, FmViewWindow);
  Application.CreateForm(TFmDlgRotKontur, FmDlgRotKontur);
  Application.CreateForm(TFmLoadRashet, FmLoadRashet);
  //  Application.OnMessage := FmViewWindow.AppMessage;
  Application.Run;
end.
