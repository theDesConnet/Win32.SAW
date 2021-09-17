program SAW;



{$R *.dres}

uses
  Vcl.Forms,
  Warning in 'Warning.pas' {Form3},
  Starting in 'Starting.pas' {Form1},
  Main in 'Main.pas' {Form2},
  Vcl.Themes,
  Vcl.Styles,
  Popup1 in 'Popup1.pas' {Form4},
  Popup2 in 'Popup2.pas' {Form5},
  Unblock in 'Unblock.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
