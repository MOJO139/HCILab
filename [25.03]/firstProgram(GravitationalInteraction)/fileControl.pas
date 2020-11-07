unit fileControl;

interface
  //Прототипы процедур:
  procedure loadParameters(var firstBodyMass : string; var secondBodyMass : string; var distanceBetweenBodies : string; const path : string);
  procedure saveParameters(firstBodyMass, secondBodyMass, distanceBetweenBodies : string; const path : string);
  procedure saveLog(_log : string; const path : string);

implementation
  procedure loadParameters; //Процедура загрузки параметров из файла;
    var inputFile : Text; //Создание файловой переменной типа текст;

    begin
      Assign(inputFile, path); //Подключение файла по адресу path;
      Reset(inputFile); //Открытие файла на чтение;

      Readln(inputFile, firstBodyMass); //Чтение массы первого тела;
      Readln(inputFile, secondBodyMass); //Чтение массы второго тела;
      Readln(inputFile, distanceBetweenBodies); //Чтение расстояния между телами;

      Close(inputFile); //Закрытие файла;

      if firstBodyMass = '' then //Проверка на пустую строку;
        firstBodyMass := '0'; //Если пусто, то присваивается 0;

      if secondBodyMass = '' then //Проверка на пустую строку;
        secondBodyMass := '0'; //Если пусто, то присваивается 0;

      if distanceBetweenBodies = '' then //Проверка на пустую строку;
        distanceBetweenBodies := '0'; //Если пусто, то присваивается 0;
    end;

  procedure saveParameters; //Процедура сохранинеия параметров в файл;
    var outputFile : Text; //Создание файловой переменной типа текст;

    begin
      Assign(outputFile, path); //Подключение файла по адресу path;
      Rewrite(outputFile); //Открытие файла на запись;

      Writeln(outputFile, firstBodyMass); //Запись массы первого тела в файл;
      Writeln(outputFile, secondBodyMass); //Запись массы второго тела в файл;
      Writeln(outputFile, distanceBetweenBodies); //Запись расстояния между телами в файл;

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
