﻿unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.Grids, fileControl, Power;

const ColsCount = 4; //Константа столбцов для того, что бы не было магических цифр;

type
  TForm2 = class(TForm) //Класс фаормы Form2, унаследованный от TForm;
    //Поля класса:
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    firstBodyMass: TEdit;
    secondBodyMass: TEdit;
    distantionBetweenBodys: TEdit;
    Button1: TButton;
    MainMenu1: TMainMenu;
    menu_file: TMenuItem;
    menu_file_open: TMenuItem;
    menu_file_save: TMenuItem;
    menu_file_saveLog: TMenuItem;
    menu_close: TMenuItem;
    menu_info: TMenuItem;
    menu_info_author: TMenuItem;
    menu_info_task: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Results: TStringGrid;

    //Методы класса:
    procedure FormCreate(Sender: TObject);
    procedure menu_file_saveClick(Sender: TObject);
    procedure menu_file_openClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure menu_closeClick(Sender: TObject);
    procedure menu_info_authorClick(Sender: TObject);
    procedure menu_info_taskClick(Sender: TObject);
    procedure firstBodyMassKeyPress(Sender: TObject; var Key: Char);
    procedure menu_file_saveLogClick(Sender: TObject);
  end;

var
  Form2: TForm2; //Определение объекта класса;
  powerStor : array of gForce; //Объявляем массива из записей типа gForce;

implementation

{$R *.dfm}

//При определениии метода вне класса необходимо сначала указать пространство имен класса, те имя класса и обратиться к прототипу метода класса внетри него;
procedure TForm2.Button1Click(Sender: TObject); //Процедура нажатия на кнопку "Вычислить";
  begin
    if (firstBodyMass.Text = '') or (firstBodyMass.Text = '-') or (firstBodyMass.Text = FormatSettings.DecimalSeparator)then
      ShowMessage('Масса первого тела не может быть пустой/знаком !!')
    else if (secondBodyMass.Text = '') or (secondBodyMass.Text = '-') or (secondBodyMass.Text = FormatSettings.DecimalSeparator)then
      ShowMessage('Масса второго тела не может быть пустой/знаком !!')
    else if (distantionBetweenBodys.Text = '') or (distantionBetweenBodys.Text = '-') or (distantionBetweenBodys.Text = FormatSettings.DecimalSeparator)then
      ShowMessage('Растояние между телами не может быть пустой/знаком !!')
    else
      begin
        SetLength(powerStor, Length(powerStor) + 1); //Увеличиваем размер массива на единицу;

        //Считываем занчение полей Edit в массив:
        powerStor[high(powerStor)].firstBodyMass := StrToFloat(firstBodyMass.Text);
        powerStor[high(powerStor)].secondBodyMass := StrToFloat(secondBodyMass.Text);
        powerStor[high(powerStor)].distantionBetweenBodys := StrToFloat(distantionBetweenBodys.Text);
        powerStor[high(powerStor)].Result := gPower(StrToFloat(firstBodyMass.Text), StrToFloat(secondBodyMass.Text), StrToFloat(distantionBetweenBodys.Text));

        Results.RowCount := Results.RowCount + 1; //Увеличиваем колличество строк в StringGrid;

        //Переновим значения из массива в StringGrid:
        Results.Cells[0, Results.RowCount - 1] := FloatToStr(powerStor[high(powerStor)].firstBodyMass);
        Results.Cells[1, Results.RowCount - 1] := FloatToStr(powerStor[high(powerStor)].secondBodyMass);
        Results.Cells[2, Results.RowCount - 1] := FloatToStr(powerStor[high(powerStor)].distantionBetweenBodys);
        Results.Cells[3, Results.RowCount - 1] := FloatToStrF(powerStor[high(powerStor)].Result, ffGeneral, 6, 2);
      end;
  end;

procedure TForm2.firstBodyMassKeyPress(Sender: TObject; var Key: Char); //Процедура нажатия на клавишу для всех полей edit;
  begin
    if not(Key in ['0' .. '9', '-', #8, FormatSettings.DecimalSeparator]) then //Контроль вводимых символов;
      Key := #0;
  end;

procedure TForm2.FormCreate(Sender: TObject); //Процедура вызываемая при создании формы;
  var I: Integer;

  begin
    Randomize;

    //Подпиь заголовков столбцов:
    Results.Cells[0, 0] := 'Масса первого тела';
    Results.Cells[1, 0] := 'Масса второго тела';
    Results.Cells[2, 0] := 'Растояние между телами';
    Results.Cells[3, 0] := 'Гравитаионное взаимодествие';

    firstBodyMass.Text := intToStr(random(999) + 1); //Генерация рандомного значения массы первого тела;
    secondBodyMass.Text := intToStr(random(99) + 1); //Генерация рандомного значения массы второго тела;
    distantionBetweenBodys.Text := intToStr(random(14000) + 1000); //Генерация рандомного значения растояния между телами;
  end;

procedure TForm2.menu_file_openClick(Sender: TObject); //Процедура нажатия на кнопку "открыть";
  var b_firstBodyMass, b_secondBodyMass, b_distantionBetweenBodys : real;

  begin
    if OpenDialog1.Execute then //Проверка выполнения диалога открытия;
      loadParameters(b_firstBodyMass, b_secondBodyMass, b_distantionBetweenBodys, OpenDialog1.FileName); //Вывоз процедуры загрузки данных из файла;

    firstBodyMass.Text := FloatToStrF(b_firstBodyMass, fffixed, 8, 3);
    secondBodyMass.Text := FloatToStrF(b_secondBodyMass, fffixed, 8, 3);
    distantionBetweenBodys.Text := FloatToStrF(b_distantionBetweenBodys, fffixed, 8, 3);

  end;

procedure TForm2.menu_file_saveClick(Sender: TObject); //Процедура нажатия на кнопку "сохранить";
  begin
    if SaveDialog1.Execute then //Проверка выполнения диалога сохранения;
      saveParameters(StrToFloat(firstBodyMass.Text), StrToFloat(secondBodyMass.Text), StrToFloat(distantionBetweenBodys.Text), SaveDialog1.FileName); //Вывоз процедуры загрузки данных в файла;
  end;

procedure TForm2.menu_file_saveLogClick(Sender: TObject); //Процедура нажатия на кнопку "сохранить отчет";
  begin
    if SaveDialog1.Execute then //Проверка выполнения диалога сохранения;
      saveLog(powerStor, SaveDialog1.FileName); //Вывоз процедуры загрузки данных из массива в файла;
  end;

procedure TForm2.menu_closeClick(Sender: TObject); //Процедура нажатия на кнопку "выйти";
  begin
    form2.Close;
  end;

procedure TForm2.menu_info_authorClick(Sender: TObject); //Процедура нажатия на кнопку "автор";
  begin
    ShowMessage('Сделал: Павленко Андрей.');
  end;

procedure TForm2.menu_info_taskClick(Sender: TObject); //Процедура нажатия на кнопку "задание";
  begin
    ShowMessage('Сделать программу по расчету силы гравитационного взаимодействия между двумя телами.');
  end;

end.
