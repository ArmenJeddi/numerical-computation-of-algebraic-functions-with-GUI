function out = GRounder(in)

 global FPD;
 if (abs(in)<1)
     num = FPD;
 else
     num = FPD + floor(log(abs(in))/log(10))+1;
 end
 digits(num);
 tmp = in*(10^(FPD+1));
 tmp = floor(tmp);
 tmp = round(tmp/10);
 tmp = tmp/(10^FPD);
 out = vpa(tmp);

end