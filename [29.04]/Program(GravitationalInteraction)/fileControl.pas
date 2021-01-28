unit fileControl;

interface
  uses Power, System.SysUtils; //Для доступа к gForce подключаем Power;

  //Прототипы процедур:
  procedure loadParameters(var firstBodyMass : real; var secondBodyMass : real; var distanceBetweenBodies : real; const path : string);
  procedure saveParameters(firstBodyMass, secondBodyMass, distanceBetweenBodies : real; const path : string);
  procedure saveLog(_log : array of gForce; const path : string);

implementation

  procedure loadParameters(var firstBodyMass : real; var secondBodyMass : real; var distanceBetweenBodies : real; const path : string); //Процедура загрузки параметров из файла;
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


  procedure saveParameters(firstBodyMass, secondBodyMass, distanceBetweenBodies : real; const path : string); //Процедура сохранинеия параметров в файл;
    var outputFile : Text; //Создание файловой переменной типа текст;

    begin
      Assign(outputFile, path); //Подключение файла по адресу path;
      Rewrite(outputFile); //Открытие файла на запись;

      Writeln(outputFile, FloatToStrF(firstBodyMass, fffixed, 8, 3)); //Запись массы первого тела в файл;
      Writeln(outputFile, FloatToStrF(secondBodyMass, fffixed, 8, 3)); //Запись массы второго тела в файл;
      Writeln(outputFile, FloatToStrF(distanceBetweenBodies, fffixed, 8, 3)); //Запись расстояния между телами в файл;

      Close(outputFile); //Закрытие файла;
    end;

  procedure saveLog(_log : array of gForce; const path : string); //Процедура сохранения лога в файл;
    var outputFile : Text; //Создание файловой переменной типа текст;
        i : integer;

    begin
      Assign(outputFile, path); //Подключение файла по адресу path;
      Rewrite(outputFile); //Открытие файла на запись;

      //Проходимся по массиву и вносим поля его записей в файл:
      for i := 0 to High(_Log) do
        begin
          Writeln(outputFile, 'Масса первого тела: ', FloatToStrF(_Log[i].firstBodyMass, fffixed, 8, 3), ';');
          Writeln(outputFile, 'Масса второго тела: ', FloatToStrF(_Log[i].secondBodyMass, fffixed, 8, 3), ';');
          Writeln(outputFile, 'Расстояние между телами: ', FloatToStrF(_Log[i].distantionBetweenBodys, fffixed, 8, 3), ';');
          Writeln(outputFile, 'Сила гравитационного взаимодействия: ', FloatToStrF(_Log[i].Result, ffexponent, 8, 3), ';');
          Writeln(outputFile, ''); //Переносим строку для красоты);
        end;

      Close(outputFile); //Закрытие файла;
    end;
end.
