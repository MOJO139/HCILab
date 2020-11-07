program GravitationalInteraction;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form2},
  fileControl in 'fileControl.pas',
  Power in 'Power.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
