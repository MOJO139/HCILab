unit Power;

interface
  const G = 6.6742e-11; //Гравитационная постоянная;

  type
    gForce = record //Для обособленности от интерфейсной части создаем тип gForce здесь;
      firstBodyMass, secondBodyMass, distantionBetweenBodys : double;
      Result : double;
    end;

  //Прототип функции:
  function gPower(firstBodyMass, secondBodyMass,  distanceBetweenBodies : real) : real;

implementation
  function gPower(firstBodyMass, secondBodyMass,  distanceBetweenBodies : real) : real; //Функция для расчета силы гравитационного взаимодейтсвия между телами;
    begin
      Result := (G*firstBodyMass*secondBodyMass)/(distanceBetweenBodies*distanceBetweenBodies); //Расчет силы гравитационного взаимодейтсвия между телами;
    end;
end.
