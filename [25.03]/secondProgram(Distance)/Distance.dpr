program Distance;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form2},
  DistanceBetweenPoints in 'DistanceBetweenPoints.pas',
  fileControl in 'fileControl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
