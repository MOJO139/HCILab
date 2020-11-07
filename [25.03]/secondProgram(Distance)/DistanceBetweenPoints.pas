unit DistanceBetweenPoints;

interface
  function DistanseBetween(fx, fy, sx, sy : real) : double; //Прототип функции для расчета растояния между точками на плоскости;

implementation
  function DistanseBetween(fx, fy, sx, sy : real) : double; //Реализация функции для расчета растояния между точками на плоскости; 
    begin
      Result := sqrt((sx - fx)*(sx - fx) + (sy - fy)*(sy - fy));
    end;
end.
