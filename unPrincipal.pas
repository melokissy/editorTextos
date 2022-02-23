unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList, Vcl.Menus,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    ImageList1: TImageList;
    Arquivo1: TMenuItem;
    Novo1: TMenuItem;
    Abrir1: TMenuItem;
    Salvar1: TMenuItem;
    Editar1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Editarfonte1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    Panel1: TPanel;
    reEditor: TRichEdit;
    StatusBar1: TStatusBar;
    OpenDialog: TOpenDialog;
    SaveDialog1: TSaveDialog;
    FontDialog: TFontDialog;
    PrintDialog: TPrintDialog;
    Sobre1: TMenuItem;
    Sobreoeditor1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Novo1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Editarfonte1Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure Sobreoeditor1Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses unSobre;

procedure TForm1.Abrir1Click(Sender: TObject);
begin
  OpenDialog.Title:='Abre arquivos .RTF';
  OpenDialog.InitialDir:= ExtractFilePath(Application.ExeName); //pega o local do exe

  if OpenDialog.Execute then
  begin
    reEditor.Lines.Clear;
    reEditor.Lines.LoadFromFile(OpenDialog.FileName);
    StatusBar1.Panels[1].Text:= 'Mensagem: Local do arquivo: '+OpenDialog.FileName;
  end;

end;

procedure TForm1.Editarfonte1Click(Sender: TObject);
begin
  if FontDialog.Execute then
    begin
      reEditor.SelAttributes.Size := FontDialog.Font.Size;
      reEditor.SelAttributes.Style := FontDialog.Font.Style;
      reEditor.SelAttributes.Color := FontDialog.Font.Color;
      reEditor.SelAttributes.Name := FontDialog.Font.Name;
      Application.ProcessMessages;
    end;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageDlg('Deseja mesmo encerrar a aplicação?', mtConfirmation,
  [mbYes,mbNo], 0) = mrYes then
  begin
    Application.Terminate;
  end
  else
    Action := caNone;

end;

procedure TForm1.Novo1Click(Sender: TObject);
begin
  reEditor.Lines.Clear;
  reEditor.SetFocus;
end;

procedure TForm1.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Salvar1Click(Sender: TObject);
begin
  SaveDialog1.Title:='Salva arquivos .RTF';
  SaveDialog1.InitialDir:= ExtractFilePath(Application.ExeName);
  if SaveDialog1.Execute then
  begin
    reEditor.Lines.SaveToFile(SaveDialog1.FileName);
    StatusBar1.Panels[1].Text:= 'Mensagem: Local do arquivo: '+SaveDialog1.FileName;
  end;

end;

procedure TForm1.Sobreoeditor1Click(Sender: TObject);
begin
  // abre o form de sobre do sistema
  try
    // no create passa (classe, objeto)
    Application.CreateForm(TfrmSobre, frmSobre);
    frmSobre.Showmodal;  
  finally
  end;
end;

procedure TForm1.ToolButton10Click(Sender: TObject);
begin
  //impressao
  if PrintDialog.Execute then
  begin
    reEditor.Print(reEditor.Text);
  end;
end;

procedure TForm1.ToolButton5Click(Sender: TObject);
begin
  reEditor.SelAttributes.Style := Font.Style + [fsItalic];
end;

procedure TForm1.ToolButton6Click(Sender: TObject);
begin
  reEditor.SelAttributes.Style := Font.Style + [fsBold];
end;

procedure TForm1.ToolButton7Click(Sender: TObject);
begin
  reEditor.SelAttributes.Style := Font.Style + [fsUnderline];
end;

end.
