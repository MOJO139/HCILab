unit DistanceBetweenPoints;

interface
  function DistanseBetween(fx, fy, sx, sy : real) : double;

implementation
  function DistanseBetween(fx, fy, sx, sy : real) : double;
    begin
      Result := sqrt((sx - fx)*(sx - fx) + (sy - fy)*(sy - fy));
    end;
end.
