function out = GRounder(in)

 global FPD;
 num = FPD + floor(log(in)/log(10))+1;
 digits(num);
 tmp = in*(10^(FPD+1));
 tmp = floor(tmp);
 tmp = round(tmp/10);
 tmp = tmp/(10^FPD);
 out = vpa(tmp);

end