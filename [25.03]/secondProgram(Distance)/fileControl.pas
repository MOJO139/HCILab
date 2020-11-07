unit fileControl;

interface
  //Прототипы процедур:
  procedure loadParameters(var fx : string; var fy : string; var sx : string; var sy : string; const path : string);
  procedure saveParameters(fx, fy, sx, sy : string; const path : string);
  procedure saveLog(_log : string; const path : string);

implementation
  procedure loadParameters; //Процедура загрузки параметров из файла;
    var inputFile : Text; //Создание файловой переменной типа текст;

    begin
      Assign(inputFile, path); //Подключение файла по адресу path;
      Reset(inputFile); //Открытие файла на чтение;

      Readln(inputFile, fx); //Чтение первого икса тела;
      Readln(inputFile, fy); //Чтение первого игрика тела;
      Readln(inputFile, sx); //Чтение второго икса тела;
      Readln(inputFile, sy); //Чтение второго игрика тела;

      Close(inputFile); //Закрытие файла;

      if fx = '' then //Проверка на пустую строку;
        fx := '0'; //Если пусто, то присваивается 0;

      if fy = '' then //Проверка на пустую строку;
        fy := '0'; //Если пусто, то присваивается 0;

      if sx = '' then //Проверка на пустую строку;
        sx := '0'; //Если пусто, то присваивается 0;

      if sy = '' then //Проверка на пустую строку;
        sy := '0'; //Если пусто, то присваивается 0;
    end;

  procedure saveParameters; //Процедура сохранинеия параметров в файл;
    var outputFile : Text; //Создание файловой переменной типа текст;

    begin
      Assign(outputFile, path); //Подключение файла по адресу path;
      Rewrite(outputFile); //Открытие файла на запись;

      Writeln(outputFile, fx); //Запись первого икса в файл;
      Writeln(outputFile, fy); //Запись первого игрика в файл;
      Writeln(outputFile, sx); //Запись второго икса в файл;
      Writeln(outputFile, sy); //Запись второго игрика в файл;

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
