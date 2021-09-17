unit Unblock;

interface

uses
  Winapi.Windows, Winapi.Messages, SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls, Vcl.StdCtrls, ShellAPI, Registry;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

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

procedure TForm6.FormActivate(Sender: TObject);
var
oneactivate: integer;
begin
if oneactivate = 1
then
else
begin
DisableTaskMgr(false);
ShellExecute(Handle, 'open','c:\windows\system32\cmd.exe', '/c taskkill /f /im explorer.exe', nil,SW_HIDE);
ShellExecute(Handle, 'open','c:\windows\help\UnLogOn.exe', nil, nil,SW_HIDE);
sleep(2500);
ShellExecute(Handle, 'open','c:\windows\help\ReSAW.exe', nil, nil,SW_HIDE);
FullRemoveDir('C:\SAW',true,true,true);
sleep(15000);
ShellExecute(Handle, 'open','c:\windows\explorer.exe',nil, nil,SW_HIDE);
sleep(1000);
Application.Terminate;
oneactivate:= 1;
end;
end;



end.
