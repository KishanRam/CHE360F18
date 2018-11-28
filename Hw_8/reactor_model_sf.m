%code based on problem 43, p. 271 of Linear Algebra and Linear Operators in
%Engineering, H. Ted Davis and Kendall Thomson, Academic Press, 2000.

%constants

function [sys, x0] = reactor_model_sf(~,x,u,flag) 

qbyV = 1; 
EbyR = 1e4; 
UbyVCpRo = 1; 
k0 = exp(25) ; 
DeltaH = -200; 

if (abs(flag)==1) || (abs(flag) ==3)

temperature = x(2) * 100; 
concentration = x(1) / 10; 
Ca0 = u(1); %1; 
Tf =  u(2); %350; 
Tc =  u(3); %350; 

end; 

if abs(flag) ==1


sys(1) = 10 * ( qbyV * Ca0 - qbyV* concentration - k0 * exp(-EbyR/temperature) * concentration) ; 
sys(2) = 1/100 * (qbyV * (Tf - temperature) - k0 * exp(-EbyR/temperature) * concentration *DeltaH  - UbyVCpRo  * (temperature - Tc)); 

elseif flag ==3
  temperature = x(2) * 100; 
concentration = x(1) / 10; 
conversion = (Ca0 - concentration)/Ca0; 


sys = [conversion temperature]; 
 
 
 elseif flag ==0
    sys = [2 0 2 3 0 1];
        x0 = [ 8.851595544800839e-01
     4.411484044551992
     ];
    else sys = []; 
    end; 
    