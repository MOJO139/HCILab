unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;

type
  TForm2 = class(TForm)
    //Поля класса:
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    x1: TEdit;
    x2: TEdit;
    y1: TEdit;
    y2: TEdit;
    Calculate: TButton;
    GroupBox2: TGroupBox;
    Results: TMemo;
    SaveDialog1: TSaveDialog;
    MainMenu1: TMainMenu;
    OpenDialog1: TOpenDialog;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;

    //Методы класса:
    procedure FormCreate(Sender: TObject);
    procedure CalculateClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure y2KeyPress(Sender: TObject; var Key: Char);
  end;

var
  Form2: TForm2; //Объявление объекта класса;

implementation

{$R *.dfm}

uses DistanceBetweenPoints, fileControl; //Подключение модулей для загрузки в/из файла и с функцией для расчета дистанции между точками;

//Для определения метода класса вне самого класса нужно обратиться к прототипу метода в теле класса, через имя класса и селектор;
procedure TForm2.CalculateClick(Sender: TObject); //Процедура нажатия на кнопку "Вычислить";
  begin
    if (x1.Text = '') or (x1.Text = '-') or (x1.Text = FormatSettings.DecimalSeparator) then //Проверка x1 на корректность;
      ShowMessage('Поле x первой точки не должно быть пустым/знаком !!')
    else if (y1.Text = '') or (y1.Text = '-') or (y1.Text = FormatSettings.DecimalSeparator) then //Проверка y1 на корректность;
      ShowMessage('Поле y первой точки не должно быть пустым/знаком !!')
    else if (x2.Text = '') or (x2.Text = '-') or (x2.Text = FormatSettings.DecimalSeparator) then //Проверка x2 на корректность;
      ShowMessage('Поле x второй точки не должно быть пустым/знаком !!')
    else if (y2.Text = '') or (y2.Text = '-') or (y2.Text = FormatSettings.DecimalSeparator) then //Проверка y1 на корректность;
      ShowMessage('Поле y второй точки не должно быть пустым/знаком !!')
    else //Если все прошло проверку на корректность;
      begin
        Results.Lines.Add('Растояние между точками: A( ' + x1.Text + ';' + y1.Text + ') и B(' + x2.Text + ';' + y2.Text + ') равно: '
                          + FormatFloat('0.0', (DistanseBetween(StrTofloat(x1.Text), StrTofloat(y1.Text), StrTofloat(x2.Text), StrTofloat(y2.Text)))) + ';');
        Results.Lines.Add(StringOfChar('=', 60));
      end;
  end;

procedure TForm2.FormCreate(Sender: TObject); //Процедура вызываемая при создании формы;
  begin
    Randomize;

    Results.Text := ''; //Очистка Memo;
    Results.Lines.Add(StringOfChar('=', 60)); //Вывод первого разделителя;

    x1.Text := intToStr(Random(101) - 50); //Задание рандомного заничения x1;
    y1.Text := intToStr(Random(101) - 50); //Задание рандомного заничения y1;

    x2.Text := intToStr(Random(101) - 50); //Задание рандомного заничения x2;
    y2.Text := intToStr(Random(101) - 50); //Задание рандомного заничения y2;
  end;

procedure TForm2.N2Click(Sender: TObject); //Процедура нажатия на кнопку "Открыть";
  var b_fx, b_fy, b_sx, b_sy : string;

  begin
    if OpenDialog1.Execute then
      loadParameters(b_fx, b_fy, b_sx, b_sy, OpenDialog1.FileName); //Процедура для загрузки данных из файла;

    if not(b_fx = '') or not(b_fy = '') or not(b_sx = '') or not(b_sy = '') then
      begin
        x1.Text := b_fx;
        y1.Text := b_fy;

        x2.Text := b_sx;
        y2.Text := b_sy;
      end;
  end;

procedure TForm2.N3Click(Sender: TObject); //Процедура выполняемая по нажатию кнопки "сохранить";
  begin
    if SaveDialog1.Execute then
      saveParameters(x1.Text, y1.Text, x2.Text, y2.Text, SaveDialog1.FileName); //Процедура для сохранения данных в файл;
  end;

procedure TForm2.N4Click(Sender: TObject); //Процедура выполняемая по нажатию кнопки "сохранить отчет";
  begin
    if SaveDialog1.Execute then
      saveLog(Results.Text, SaveDialog1.FileName); //Процедура для сохранения лога в файл;
  end;

procedure TForm2.N5Click(Sender: TObject); //Процедура выполняемая по нажатию кнопки "выйти";
  begin
    Form2.Close; //Закрытие формы;
  end;

procedure TForm2.N7Click(Sender: TObject);
  begin
    ShowMessage('Сделал: Павленко Андрей.');
  end;

procedure TForm2.N8Click(Sender: TObject);
  begin
    ShowMessage('Вычислить расстояние между двумя точками.');
  end;

procedure TForm2.N9Click(Sender: TObject);
  begin
    ShowMessage('https://ivtipm.github.io/Programming/Glava01/index01.htm#z23');
  end;

procedure TForm2.y2KeyPress(Sender: TObject; var Key: Char); //Процедура нажатия клавиш для всех edit;
  begin
    if not(Key in ['0' .. '9', #8, '-', FormatSettings.DecimalSeparator]) then //Контроль вводимых символов;
      Key := #0;
  end;

end.
