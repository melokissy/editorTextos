program Project1;

uses
  Vcl.Forms,
  unPrincipal in 'unPrincipal.pas' {Form1},
  unSobre in 'unSobre.pas' {frmSobre};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
