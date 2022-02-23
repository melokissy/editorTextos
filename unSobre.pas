unit unSobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmSobre = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    procedure btnOkClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.dfm}

procedure TfrmSobre.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSobre.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
