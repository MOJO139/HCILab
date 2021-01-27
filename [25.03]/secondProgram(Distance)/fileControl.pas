unit fileControl;

interface
  uses System.SysUtils;

  //Прототипы процедур:
  procedure loadParameters(var fx : real; var fy : real; var sx : real; var sy : real; const path : string);
  procedure saveParameters(fx, fy, sx, sy : real; const path : string);
  procedure saveLog(_log : string; const path : string);

implementation
  procedure loadParameters; //Процедура загрузки параметров из файла;
    var inputFile : Text; //Создание файловой переменной типа текст;
        b_fx, b_fy, b_sx, b_sy : string;

    begin
      Assign(inputFile, path); //Подключение файла по адресу path;
      Reset(inputFile); //Открытие файла на чтение;

      Readln(inputFile, b_fx); //Чтение первого икса тела;
      Readln(inputFile, b_fy); //Чтение первого игрика тела;
      Readln(inputFile, b_sx); //Чтение второго икса тела;
      Readln(inputFile, b_sy); //Чтение второго игрика тела;

      Close(inputFile); //Закрытие файла;

      if b_fx = '' then //Проверка на пустую строку;
        fx := 0 //Если пусто, то присваивается 0;
      else
        fx := StrToFloat(b_fx);

      if b_fy = '' then //Проверка на пустую строку;
        fy := 0 //Если пусто, то присваивается 0;
      else
        fy := StrToFloat(b_fy);

      if b_sx = '' then //Проверка на пустую строку;
        sx := 0 //Если пусто, то присваивается 0;
      else
        sx := StrToFloat(b_sx);

      if b_sy = '' then //Проверка на пустую строку;
        sy := 0 //Если пусто, то присваивается 0;
      else
        sy := StrToFloat(b_sy);
    end;

  procedure saveParameters; //Процедура сохранинеия параметров в файл;
    var outputFile : Text; //Создание файловой переменной типа текст;

    begin
      Assign(outputFile, path); //Подключение файла по адресу path;
      Rewrite(outputFile); //Открытие файла на запись;

      Writeln(outputFile, FloatToStrF(fx, ffFixed, 8, 4)); //Запись первого икса в файл;
      Writeln(outputFile, FloatToStrF(fy, ffFixed, 8, 4)); //Запись первого игрика в файл;
      Writeln(outputFile, FloatToStrF(sx, ffFixed, 8, 4)); //Запись второго икса в файл;
      Writeln(outputFile, FloatToStrF(sy, ffFixed, 8, 4)); //Запись второго игрика в файл;

      Close(outputFile); //Закрытие файла;
    end;

  procedure saveLog; //Процедура сохранения лога в файл;
    var outputFile : Text; //Создание файловой переменной типа текст;

    begin
      Assign(outputFile, path); //Подключение файла по адресу path;
      Rewrite(outputFile); //Открытие файла на запись;

      Write(outputFile, _log); //Запись лога в файл;

      Close(outputFile); //Закрытие файла;
    end;
end.
