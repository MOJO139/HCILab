unit fileControl;

interface
  uses System.SysUtils;

  //Прототипы процедур:
  procedure loadParameters(var firstBodyMass : real; var secondBodyMass : real; var distanceBetweenBodies : real; const path : string);
  procedure saveParameters(firstBodyMass, secondBodyMass, distanceBetweenBodies : real; const path : string);
  procedure saveLog(_log : string; const path : string);

implementation
  procedure loadParameters; //Процедура загрузки параметров из файла;
    var inputFile : Text; //Создание файловой переменной типа текст;
        b_firstBodyMass, b_secondBodyMass, b_distanceBetweenBodies : string;

    begin
      Assign(inputFile, path); //Подключение файла по адресу path;
      Reset(inputFile); //Открытие файла на чтение;

      Readln(inputFile, b_firstBodyMass); //Чтение массы первого тела;
      Readln(inputFile, b_secondBodyMass); //Чтение массы второго тела;
      Readln(inputFile, b_distanceBetweenBodies); //Чтение расстояния между телами;

      Close(inputFile); //Закрытие файла;

      if b_firstBodyMass = '' then //Проверка на пустую строку;
        firstBodyMass := 0 //Если пусто, то присваивается 0;
      else
        firstBodyMass := StrToFloat(b_firstBodyMass);

      if b_secondBodyMass = '' then //Проверка на пустую строку;
        secondBodyMass := 0 //Если пусто, то присваивается 0;
      else
        secondBodyMass := StrToFloat(b_secondBodyMass);

      if b_distanceBetweenBodies = '' then //Проверка на пустую строку;
        distanceBetweenBodies := 0 //Если пусто, то присваивается 0;
      else
        distanceBetweenBodies := StrToFloat(b_distanceBetweenBodies);
    end;

  procedure saveParameters; //Процедура сохранинеия параметров в файл;
    var outputFile : Text; //Создание файловой переменной типа текст;

    begin
      Assign(outputFile, path); //Подключение файла по адресу path;
      Rewrite(outputFile); //Открытие файла на запись;

      Writeln(outputFile, FloatToStrF(firstBodyMass, ffFixed, 8, 4)); //Запись массы первого тела в файл;
      Writeln(outputFile, FloatToStrF(secondBodyMass, ffFixed, 8, 4)); //Запись массы второго тела в файл;
      Writeln(outputFile, FloatToStrF(distanceBetweenBodies, ffFixed, 8, 4)); //Запись расстояния между телами в файл;

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
