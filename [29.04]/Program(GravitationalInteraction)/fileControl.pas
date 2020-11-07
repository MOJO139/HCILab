unit fileControl;

interface
  uses Power; //Для доступа к gForce подключаем Power;

  //Прототипы процедур:
  procedure loadParameters(var firstBodyMass : string; var secondBodyMass : string; var distanceBetweenBodies : string; const path : string);
  procedure saveParameters(firstBodyMass, secondBodyMass, distanceBetweenBodies : string; const path : string);
  procedure saveLog(_log : array of gForce; const path : string);

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
        i : integer;

    begin
      Assign(outputFile, path); //Подключение файла по адресу path;
      Rewrite(outputFile); //Открытие файла на запись;

      //Проходимся по массиву и вносим поля его записей в файл:
      for i := 0 to High(_Log) do
        begin
          Writeln(outputFile, 'Масса первого тела: ', _Log[i].firstBodyMass, ';');
          Writeln(outputFile, 'Масса второго тела: ', _Log[i].secondBodyMass, ';');
          Writeln(outputFile, 'Расстояние между телами: ', _Log[i].distantionBetweenBodys, ';');
          Writeln(outputFile, 'Сила гравитационного взаимодействия: ', _Log[i].Result, ';');
          Writeln(outputFile, ''); //Переносим строку для красоты);
        end;

      Close(outputFile); //Закрытие файла;
    end;
end.
