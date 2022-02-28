close all
clc
clear

%CEN524 Project - Fall 2020


% Names: 

% Georges Elkassouf – 20161452
% Elie Bou Rizk – 20161140
% Mayline Achkar – 20172777


%Submitted to:

%Dr. Gérard-Philippe Zéhil

%------------------------------------------------------------------%



%INPUT FILE

%------------------------------------------------------------------%


%Prestressing force
P = 100;

%Cross-sectional area
A = 0.5;

%Moment of inertia
I = 0.042;

%ct
ct = 0.5;

%cb as a negative value
cb = -0.5 ;

%Unit weight of concrete
gamma = 23;

%Superimposed dead load of the beam 
wsd = 10;

%Live load of the beam in span 1
live1 = 5;

%Live load of the beam in span 2
live2 = 7;

%Live load of the beam in span 3
live3 = 12;

%Length of span 1
l1 = 10;

%Length of span 2
l2 = 15;

%Length of span 3
l3 = 5;

%Value of the force in span 1
F1 = 10;

%Value of the force in span 2 
F2 = 20;

%Value of the force in span 3
F3 = 30;

%Distance d1 from support A to F1
d1 = 2;

%Distance d2 from support B to F2
d2 = 7;

%Distance d3 from support C to F3
d3 = 3;

x1 = (0:0.1:(l1/4));
%Equation of tendon 1 in span 1 in function of x1
e1x =(-2/55)*x1 + 0.3;

x2 = ((l1/4):0.1:(l1/2));
%Equation of tendon 2 in span 1 in function of x2
e2x =(-2/55)*x2 + 0.3;

x3 = ((l1/2):0.1:(l1*(3/4)));
%Equation of tendon 3 in span 1 in function of x3
e3x = (-2/55)*x3 + 0.3;

x4 = ((l1*(3/4)):0.1:l1);
%Equation of tendon 4 in span 1 in function of x4
e4x = (-2/55)*x4 + 0.3;

x5 = (l1:0.1:(l1+(l2/4)));
%Equation of tendon 5 in span 2 in function of x5
e5x = (-2/55)*x5 + 0.3;
 
x6  = ((l1+(l2/4)):0.1:(l1+(l2/2)));
%Equation of tendon 6 in span 2 in function of x6
e6x =(32/10125)*x6.^2 - (176/2025)*x6 +(161/405);

x7  = ((l1+(l2/2)):0.1:(l1+(l2*(3/4))));
%Equation of tendon 7 in span 2 in function of x7
e7x =(32/10125)*x7.^2 - (176/2025)*x7 +(161/405);

x8  = ((l1+(l2*(3/4))):0.1:(l1+l2));
%Equation of tendon 8 in span 2 in function of x8
e8x =(32/10125)*x8.^2 - (176/2025)*x8 +(161/405);

x9  = ((l1+l2):0.1:(l1+l2+l3/4));
%Equation of tendon 9 in span 3 in function of x9
e9x =(-1/25)*x9 + 6/5;

x10  = ((l1+l2+l3/4):0.1:(l1+l2+l3/2));
%Equation of tendon 10 in span 3 in function of x10
e10x =(-1/25)*x10 + 6/5;

x11  = ((l1+l2+l3/2):0.1:(l1+l2+(l3*(3/4))));
%Equation of tendon 11 in span 3 in function of x11
e11x =(-1/25)*x11 + 6/5;

x12  = ((l1+l2+(l3*(3/4))):0.1:(l1+l2+l3));
%Equation of tendon 12 in span 3 in function of x12
e12x =(-1/25)*x12 + 6/5;


    

%--------------------------------------------------------------------%



for j = 1:1
    
if isempty(P);
    disp ('ERROR!, You did not make any input');
    break
end


if isempty(A);
    disp ('ERROR!, You did not make any input');
    break
end


if isempty(I);
    disp ('ERROR!, You did not make any input');
    break
end


if isempty(ct);
    disp ('ERROR!, You did not make any input');
    break
end


if isempty(cb);
    disp ('ERROR!, You did not make any input');
    break
end

if cb > 0;
    disp ('ERROR!, cb must be negative')
    break
    
end



if isempty(gamma);
    disp ('ERROR!, You did not make any input');
    break
    
end


if isempty(wsd);
    disp ('ERROR!, You did not make any input');
    break
    
end

wsw = gamma * A;
    

if isempty(live1);
    disp ('ERROR!, You did not make any input');
    break
    
end
    


if isempty(live2);
    disp ('ERROR!, You did not make any input');
    break
    
end



if isempty(live3);
    disp ('ERROR!, You did not make any input');
    break
    
end
    

w1 = wsd + wsw + live1;
w2 = wsd + wsw + live2;
w3 = wsd + wsw + live3;



if F1 == 0;
    d1 = 0.01;
elseif F2 == 0;
    d2 == 0.01;
else F3 == 0;
    d3 == 0.01;
end


if isempty(l1);
    disp ('ERROR!, You did not make any input');
    break
    
end

if l1 <= 0;
    disp('ERROR!, l1 must be greater than zero');
    break
    
end

if  floor (l1) ~= ceil (l1);
    disp('ERROR!, l1 must be an integer');
    break
end



if isempty(l2);
    disp ('ERROR!, You did not make any input');
    break
    
end

if l2 <= 0;
    disp('ERROR!, l2 must be greater than zero');
    break
    
end

if  floor (l2) ~= ceil (l2) ;
    disp('ERROR!, l2 must be an integer');
    break
end



if isempty(l3);
    disp ('ERROR!, You did not make any input');
    break
    
end

if l3 <= 0;
    disp('ERROR!, l3 must be greater than zero');
    break
    
end

if  floor (l3) ~= ceil (l3) ;
    disp('ERROR!, l3 must be an integer');
    break
    
end

    
    
L = l1 + l2 + l3;


if isempty(F1);
    disp ('ERROR!, You did not make any input');
    break
    
end



if isempty(F2);
    disp ('ERROR!, You did not make any input');
    break
    
end


if isempty(F3);
    disp ('ERROR!, You did not make any input');
    break
    
end

F = F1 + F2 + F3;



if isempty(d1);
    disp ('ERROR!, You did not make any input');
    break
    
end

if d1 >= l1;
    disp('ERROR!, d1 must be less than l1');
    break
    
end

if d1 < 0;
    disp('ERROR!, d1 must be greater than zero');
    break
    

end


if isempty(d2);
    disp ('ERROR!, You did not make any input');
    break
    
end

if d2 >= l2;
    disp('ERROR!, d2 must be less than l2');
    break
    
end
    
if d2 < 0;
    disp('ERROR!, d2 must be greater than zero');
    break
    

end



if isempty(d3);
    disp ('ERROR!, You did not make any input');
    break
    
end

if d3 >= l3;
    disp('ERROR!, d3 must be less than l3');
    break
    
end
    
 if d3 < 0;
    disp('ERROR!, d3 must be greater than zero');
    break
    
end


d31 = d1;
d32 = l1 + d2;
d33 = l1 + l2 + d3;

R3D = (F1*d31 + F2*d32 + F3*d33)/L;
R3A = F - R3D;

M31 = R3A*d31;
M32 = ((R3A*d32) - F1*(d32 - d31));
M33 = ((R3A*d33) - F1*(d33 - d31) - F2*(d33 - d32));




for k1=1:length(x1);

    e1x (k1);
    
end



for k2=1:length(x2);

    e2x (k2);
    
end




for k3=1:length(x3);

    e3x (k3);
    
end




for k4=1:length(x4);

    e4x (k4);
    
end



for k5=1:length(x5);

    e5x (k5);
    
end



for k6=1:length(x6);

    e6x (k6);
    
end



for k7=1:length(x7);

    e7x (k7);
    
end




for k8=1:length(x8);

    e8x (k8);
    
end



for k9=1:length(x9);

    e9x (k9);
    
end




for k10=1:length(x10)

    e10x (k10);
    
end




for k11=1:length(x11);

    e11x (k11);
    
end




for k12=1:length(x12);

    e12x (k12);
    
end


x = (0:0.1:L);

for i =1:length(x)
     
  
    %BEAM 1
    
if x(i)>=0 && x(i)<=(l1/4);
    
   e1(i)=e1x(k1);
    
elseif x(i)>(l1/4) && x(i)<=(l1/2);
    
    e2(i)=e2x(k2);
     
elseif x(i)> (l1/2) && x(i)<=(l1*(3/4));
         
       e3(i)=e3x(k3);
     
elseif x(i)> (l1*(3/4)) && x(i)<=(l1);
         
       e4(i)=e4x(k4);
     
elseif x(i)> (l1) && x(i)<=(l1+(l2/4));
         
       e5(i)=e5x(k5);
     
elseif x(i)> (l1+(l2/4)) && x(i)<=(l1+(l2/2));
         
       e6(i)=e6x(k6);
     
elseif x(i)> (l1+(l2/2)) && x(i)<=(l1+(l2*(3/4)));
         
        e7(i)=e7x(k7);
     
elseif x(i)> (l1+(l2*(3/4))) && x(i)<=(l1+l2);
         
      e8(i)=e8x(k8);
     
elseif x(i)> (l1+l2) && x(i)<=(l1+l2+(l3/4));
         
       e9(i)=e9x(k9);
     
elseif x(i)> (l1+l2+(l3/4)) && x(i)<=(l1+l2+(l3/2));
          
       e10(i)=e10x(k10);
     
elseif x(i)> (l1+l2+(l3/2)) && x(i)<=(l1+l2+(l3*(3/4)))
          
      e11(i)=e11x(k11);
     
else x(i)> (l1+l2+(l3*(3/4))) && x(i)<=(l1+l2+l3);
    
       e12(i)=e12x(k12);
end

%Primary 

if x(i)>=0 && x(i)<=(l1/4);
    
    p1(i)=P*e1(i);
    
elseif x(i)>(l1/4) && x(i)<=(l1/2);
    
     p1(i)=P*e2(i);
     
elseif x(i)> (l1/2) && x(i)<=(l1*(3/4));
         
     p1(i)=P*e3(i);
     
elseif x(i)> (l1*(3/4)) && x(i)<=(l1);
         
     p1(i)=P*e4(i);
     
elseif x(i)> (l1) && x(i)<=(l1+(l2/4));
         
    p1(i)=P*e5(i);
     
elseif x(i)> (l1+(l2/4)) && x(i)<=(l1+(l2/2));
         
     p1(i)=P*e6(i);
     
elseif x(i)> (l1+(l2/2)) && x(i)<=(l1+(l2*(3/4)));
         
     p1(i)=P*e7(i);
     
elseif x(i)> (l1+(l2*(3/4))) && x(i)<=(l1+l2);
         
     p1(i)=P*e8(i);
     
elseif x(i)> (l1+l2) && x(i)<=(l1+l2+(l3/4));
         
     p1(i)=P*e9(i);
     
elseif x(i)> (l1+l2+(l3/4)) && x(i)<=(l1+l2+(l3/2));
          
     p1(i)=P*e10(i);
     
elseif x(i)> (l1+l2+(l3/2)) && x(i)<=(l1+l2+(l3*(3/4)));
          
     p1(i)=P*e11(i);
     
else x(i)> (l1+l2+(l3*(3/4))) && x(i)<=(l1+l2+l3);
    
     p1(i)=P*e12(i);
end


%secondary

if x(i) >= 0 && x(i)<= l1;
    
s1(i)= x(i)/l1 ;

elseif x(i) > l1 && x(i)<= (l1+l2);
    
s1(i)= 1- ((x(i)-l1)/l2);
 
else
    x(i) > (l1+l2) && x(i)<= L;
    
s1(i)= 0 ; 

end

%tertiary

if x(i) >= 0 && x(i)<= l1;

t1(i)= 0;

elseif x(i) > l1 && x(i)<= (l1 + l2);
    
t1(i)= (x(i)-l1)/l2;

else
    x(i)>= (l1 + l2) && x(i)<= L;

t1(i)= 1- ((x(i)-l1-l2)/l3);


end

     
    %BEAM 2
    
%Primary 2
%Moment

if x(i) >= 0 && x(i)<= l1;
    
p2(i)= (-(w1*(x(i).^2))+(w1*l1)*x(i))/2;

elseif x(i) > l1 && x(i)<= (l1+l2);

p2(i)= (-(w2*((x(i)-l1).^2))+(w2*l2*(x(i)-l1)))/2;

else
    x(i) > (l1+l2) && x(i)<= L;
    
p2(i)= ((-w3*((x(i)-l1-l2).^2))+(w3*l3*(x(i)-l1-l2)))/2;


end



%Secondary 2
%Moment

if x(i) >= 0 && x(i)<= l1;
    
s2(i)= x(i)/l1 ;

elseif x(i) > l1 && x(i)<= (l1+l2);
    
s2(i)= 1- ((x(i)-l1)/l2);
 
else
    x(i) > (l1+l2) && x(i)<= L;
    
s2(i)= 0 ;   
    

end


%Tertiary  2
%Moment

if x(i) >= 0 && x(i)<= l1;

t2(i)= 0;

elseif x(i) > l1 && x(i)<= (l1 + l2);
    
t2(i)= (x(i)-l1)/l2;

else
    x(i)>= (l1 + l2) && x(i)<= L;

t2(i)= 1- ((x(i)-l1-l2)/l3);


end



    %BEAM 3

%Primary 3
%Moment

if x(i) >= 0 && x(i)<= d31;
    
p3(i)= (M31/d31)*x(i);

elseif x(i) > d31 && x(i)<= d32;

p3(i)= M31+((M32-M31)/(d32-d31))*(x(i)-d31);

elseif x(i) > d32 && x(i)<= d33;
    
p3(i)= M32+((M33-M32)/(d33-d32))*(x(i)-d32);

else
    
    x(i) > d33 && x(i)<= L;
    
    
p3(i)= M33-((M33*(x(i)-d33))/(L-d33));

end



%Secondary 3
%Moment

if x(i) >= 0 && x(i)<= l1;
    
s3(i)= -((l2+l3)/L)*x(i);

else
    
    x(i) > l1 && x(i)<= L;
    
s3(i)= -((l1*(l2+l3))/L)*(1-((x(i)-l1)/(l2+l3)));

end


%Tertiary 3
%Moment

if x(i) >= 0 && x(i)<= (l1 + l2);

t3(i)= -(l3/L)*x(i);

else
    
    x(i) > (l1 + l2) && x(i)<= L;
    
t3(i)= -((l3*(l1+l2))/L)*(1-((x(i)-l1-l2)/(l3)));


end
end


syms z;

PS11B2 = @(z) ((-(w1.*(z.^2))+(w1.*l1).*z)/2).*(z/l1);
PS1B2 = integral(PS11B2,0,l1);

PS22B2 = @(z) ((-(w2.*((z-l1).^2))+(w2.*l2.*(z-l1)))/2).*(1- ((z-l1)/l2)) ;
PS2B2 = integral(PS22B2,l1,(l1+l2));

PS3B2 = 0;

PT1B2 = 0;

PT22B2 = @(z)  ((-(w2.*((z-l1).^2))+(w2.*l2.*(z-l1)))/2).*((z-l1)/l2);
PT2B2 = integral(PT22B2, l1,(l1+l2));

PT33B2 = @(z)   (((-w3.*((z-l1-l2).^2))+(w3.*l3.*(z-l1-l2)))/2).*(1- ((z-l1-l2)/l3));
PT3B2 = integral(PT33B2,(l1+l2),L);

SS11B2 = @(z)  (z/l1).*(z/l1);
SS1B2 = integral(SS11B2,0,l1);

SS22B2 = @(z)   (1- ((z-l1)/l2)).*(1- ((z-l1)/l2));                
SS2B2 = integral(SS22B2,l1,(l1+l2));

SS3B2 = 0;

TT1B2 = 0;

TT22B2 = @(z)   ((z-l1)/l2).*((z-l1)/l2);
TT2B2 = integral (TT22B2, l1,(l1+l2));
TT33B2 = @(z)   (1- ((z-l1-l2)/l3)).*(1- ((z-l1-l2)/l3));
TT3B2 = integral (TT33B2, (l1+l2),L);

ST1B2 = 0;

ST22B2 = @(z)  (1- ((z-l1)/l2)).*((z-l1)/l2);
ST2B2 = integral(ST22B2,l1,(l1+l2));

ST3B2 = 0;

% Evaluate B3y & C3y


PS11B3 = @(z) ((M31/d31).*z).*(-((l2+l3)/L).*z);
PS1B3 = integral(PS11B3,0,d31);

PS22B3 = @(z)  (M31+((M32-M31)/(d32-d31)).*(z-d31)).*(-((l2+l3)/L).*z);
PS2B3 = integral(PS22B3,d31,l1);

PS33B3 = @(z)  (M31+((M32-M31)/(d32-d31)).*(z-d31)).*(-((l1.*(l2+l3))/L).*(1-((z-l1)/(l2+l3))));
PS3B3 = integral(PS33B3,l1,d32);

PS44B3 = @(z)   (M32+((M33-M32)/(d33-d32)).*(z-d32)).*(-((l1.*(l2+l3))/L).*(1-((z-l1)/(l2+l3))));
PS4B3 = integral(PS44B3,d32,d33);

PS55B3 = @(z)  (M33-((M33.*(z-d33))/(L-d33))).*(-((l1.*(l2+l3))/L).*(1-((z-l1)/(l2+l3))));
PS5B3 = integral(PS55B3,d33,L);

PT11B3 = @(z) ((M31/d31).* z) .* ((-l3/L).* z);
PT1B3 = integral(PT11B3, 0, d31);

PT22B3 = @(z) (M31+(((M32-M31)/(d32-d31)).*(z-d31))) .* ((-l3/L).* z);
PT2B3 = integral(PT22B3, d31, d32);

PT33B1 =@(z) (M32+(((M33-M32)/(d33-d32)).*(z-d32))) .* ((-l3/L) .*z);
PT3B3 = integral(PT33B1, d32 , (l1 + l2));

PT44B3 = @(z) (M32+(((M33-M32)/(d33-d32)).*(z-d32))) .*(-(((l3.*(l1+l2))/L).*(1-((z-l1-l2)/(l3)))));
PT4B3 = integral(PT44B3, (l1 + l2), d33);

PT55B3 = @(z) (M33-((M33.*(z-d33))/(L-d33))) .* (-(((l3.*(l1+l2))/L).*(1-((z-l1-l2)/(l3)))));
PT5B3 = integral (PT55B3, d33, L);

SS11B3 = @(z) (-((l2+l3)/L).*z).*(-((l2+l3)/L).*z);
SS1B3 = integral(SS11B3,0,l1);

SS22B3 = @(z) (-((l1.*(l2+l3))/L).*(1-((z-l1)/(l2+l3)))).*(-((l1*(l2+l3))/L).*(1-((z-l1)/(l2+l3))));
SS2B3 = integral(SS22B3,l1,L);

TT11B3 = @(z) ((-(l3/L).*z) .* (-(l3/L).*z));
TT1B3 = integral (TT11B3, 0, (l1 + l2));

TT22B3 = @(z) (-((l3*(l1+l2))/L).*(1-((z-l1-l2)/(l3)))).*(-((l3*(l1+l2))/L).*(1-((z-l1-l2)/(l3))));
TT2B3 = integral (TT22B3, (l1 + l2), L);

ST11B3 = @(z)(-((l2+l3)/L).*z).*(-(l3/L).*z);
ST1B3 = integral(ST11B3,0,l1);

ST22B3 = @(z)(-((l1.*(l2+l3))/L).*(1-((z-l1)/(l2+l3)))).*(-(l3/L).*z);
ST2B3 = integral(ST22B3,l1,(l1+l2));

ST33B3 = @(z)(-((l1.*(l2+l3))/L).*(1-((z-l1)/(l2+l3)))).*(-((l3*(l1+l2))/L).*(1-((z-l1-l2)/(l3))));
ST3B3 = integral(ST33B3,(l1+l2),L);

syms r

if  floor (((l1/4)*10)+1) == ceil (((l1/4)*10)+1) ;
    
PS11B1 = @(r)   p1(((l1/4)*10)+1).* (r/l1) ;
PS1B1 = integral(PS11B1,0,(l1/4));

PT11B1 = @(r)     p1(((l1/4)*10)+1).* (r/l1) ;
PT1B1 = integral(PT11B1,0,(l1/4));

else 
     
PS11B1 = @(r)   p1(((l1/4)*10)-0.5).* (r/l1) ;
PS1B1 = integral(PS11B1,0,(l1/4));

PT11B1 = @(r)     p1(((l1/4)*10)-0.5).* (r/l1) ;
PT1B1 = integral(PT11B1,0,(l1/4));
end

if  floor (((l1/2)*10)+1.5) == floor (((l1/2)*10)+1.5);
     
PS22B1 = @(r)    (p1(((l1/2)*10)+1)).* (r/l1);
PS2B1 = integral(PS22B1,(l1/4),(l1/2));

PT22B1 = @(r)    (p1(((l1/2)*10)+1)).* (r/l1);
PT2B1 = integral(PT22B1,(l1/4),(l1/2));

else 
    
PS22B1 = @(r)    (p1(((l1/2)*10)-0.5)).* (r/l1);
PS2B1 = integral(PS22B1,(l1/4),(l1/2));

PT22B1 = @(r)    (p1(((l1/2)*10)-0.5)).* (r/l1);
PT2B1 = integral(PT22B1,(l1/4),(l1/2));
end

if  floor (((l1*(3/4))*10)+1) == ceil (((l1*(3/4))*10)+1);

PS33B1 = @(r)  (p1(((l1*(3/4))*10)+1)).* (r/l1);
PS3B1 = integral(PS33B1,(l1/2),(l1*(3/4)));

PT33B1 = @(r)    (p1(((l1*(3/4))*10)+1)).* (r/l1);
PT3B1 = integral(PT33B1,(l1/2),(l1*(3/4)));

else
    
PS33B1 = @(r)  (p1(((l1*(3/4))*10)-0.5)).* (r/l1);
PS3B1 = integral(PS33B1,(l1/2),(l1*(3/4)));

PT33B1 = @(r)    (p1(((l1*(3/4))*10)-0.5)).* (r/l1);
PT3B1 = integral(PT33B1,(l1/2),(l1*(3/4)));
end

if  floor (((l1*10)+1)) == ceil (((l1*10)+1));

PS44B1 = @(r)   (p1((l1*10)+1)).* (r/l1);
PS4B1 = integral(PS44B1,(l1*(3/4)),l1);

PT44B1 = @(r)    (p1((l1*10)+1)).* (r/l1);
PT4B1 = integral(PT44B1,(l1*(3/4)),(l1));

else
    
PS44B1 = @(r)   (p1((l1*10)-0.5)).* (r/l1);
PS4B1 = integral(PS44B1,(l1*(3/4)),l1);

PT44B1 = @(r)    (p1((l1*10)-0.5)).* (r/l1);
PT4B1 = integral(PT44B1,(l1*(3/4)),(l1));
end

if  floor ((((l1+(l2/4))*10)+1)) == ceil((((l1+(l2/4))*10)+1));

PS55B1 = @(r)   (p1(((l1+(l2/4))*10)+1)).*( 1- ((r-l1)/l2));
PS5B1 = integral(PS55B1,l1,(l1+(l2/4)));

PT55B1 = @(r)    (p1(((l1+(l2/4))*10)+1)).*( 1- ((r-l1)/l2));
PT5B1 = integral(PT55B1,(l1),(l1+(l2/4)));

else
    
PS55B1 = @(r)   (p1(((l1+(l2/4))*10)-0.5)).*( 1- ((r-l1)/l2));
PS5B1 = integral(PS55B1,l1,(l1+(l2/4)));

PT55B1 = @(r)    (p1(((l1+(l2/4))*10)-0.5)).*( 1- ((r-l1)/l2));
PT5B1 = integral(PT55B1,(l1),(l1+(l2/4)));
end

if  floor (((l1+(l2/2))*10)+1) == ceil(((l1+(l2/2))*10)+1);

PS66B1 = @(r)  (p1(((l1+(l2/2))*10)+1)).*( 1- ((r-l1)/l2));
PS6B1 = integral(PS66B1,(l1+(l2/4)),(l1+(l2/2)));

PT66B1 = @(r)    (p1(((l1+(l2/2))*10)+1)).*( 1- ((r-l1)/l2));
PT6B1 = integral(PT66B1,(l1+(l2/4)),(l1+(l2/2)));

else
    
PS66B1 = @(r)  (p1(((l1+(l2/2))*10)-0.5)).*( 1- ((r-l1)/l2));
PS6B1 = integral(PS66B1,(l1+(l2/4)),(l1+(l2/2)));

PT66B1 = @(r)    (p1(((l1+(l2/2))*10)-0.5)).*( 1- ((r-l1)/l2));
PT6B1 = integral(PT66B1,(l1+(l2/4)),(l1+(l2/2)));
end

if  floor (((l1+(l2*(3/4)))*10)+1) == ceil(((l1+(l2*(3/4)))*10)+1);
    
PS77B1 = @(r)   (p1(((l1+(l2*(3/4)))*10)+1)).*( 1- ((r-l1)/l2));
PS7B1 = integral(PS77B1,(l1+(l2/2)),(l1+(l2*(3/4))));

PT77B1 = @(r)    (p1(((l1+(l2*(3/4)))*10)+1)).*( 1- ((r-l1)/l2));
PT7B1 = integral(PT77B1,(l1+(l2/2)),(l1+(l2*(3/4))));

else

PS77B1 = @(r)   (p1(((l1+(l2*(3/4)))*10)-0.5)).*( 1- ((r-l1)/l2));
PS7B1 = integral(PS77B1,(l1+(l2/2)),(l1+(l2*(3/4))));

PT77B1 = @(r)    (p1(((l1+(l2*(3/4)))*10)-0.5)).*( 1- ((r-l1)/l2));
PT7B1 = integral(PT77B1,(l1+(l2/2)),(l1+(l2*(3/4))));

end

if  floor ((((l1+l2)*10)+1)) == ceil((((l1+l2)*10)+1));

PS88B1 = @(r)  (p1(((l1+l2)*10)+1)).*( 1- ((r-l1)/l2));
PS8B1 = integral(PS88B1,(l1+(l2*(3/4))),(l1+l2));

PT88B1 = @(r)   (p1(((l1+l2)*10)+1)).*( 1- ((r-l1)/l2));
PT8B1 = integral(PT88B1,(l1+(l2*(3/4))),(l1+l2));

else
    
PS88B1 = @(r)  (p1(((l1+l2)*10)-0.5)).*( 1- ((r-l1)/l2));
PS8B1 = integral(PS88B1,(l1+(l2*(3/4))),(l1+l2));

PT88B1 = @(r)   (p1(((l1+l2)*10)-0.5)).*( 1- ((r-l1)/l2));
PT8B1 = integral(PT88B1,(l1+(l2*(3/4))),(l1+l2));

end

PS99B1 = 0;
PS9B1 = 0;

PS1010B1 = 0;
PS10B1 = 0;

PS1111B1 = 0;
PS11B1 = 0;

PS1212B1 =0;
PS12B1 = 0;

PT99B1 = 0;
PT9B1 = 0;

PT1010B1 = 0;
PT10B1 = 0;

PT1111B1 = 0;
PT11B1 = 0;


PT1212B1 =0;
PT12B1 = 0;


SS11B1 = @(r) (r/l1).*(r/l1);
SS1B1 = integral(SS11B1,0,l1);

SS22B1 = @(r) (1- ((r-l1)/l2)).*(1- ((r-l1)/l2));
SS2B1 = integral(SS22B1,l1,(l1+l2));

SS33B1 = 0;
SS3B1 = 0;

TT11B1 = 0;
TT1B1 = 0;

TT22B1 = @(r) ((r-l1)/l2).*((r-l1)/l2);
TT2B1 = integral (TT22B1, l1,(l1 + l2));

TT33B1 = @(r) (1- ((r-l1-l2)/l3)).*(1- ((r-l1-l2)/l3));
TT3B1 = integral (TT33B1,(l1 + l2),L);

ST11B1 = 0;
ST1B1 = 0;

ST22B1 = @(r)(1- ((r-l1)/l2)).*((r-l1)/l2);
ST2B1 = integral(ST22B1,l1,(l1+l2));

ST33B1 = 0;
ST3B1 =0;


PSB1 = PS1B1 + PS2B1 + PS3B1 + PS4B1 + PS5B1+PS6B1+PS7B1+PS8B1+PS9B1+PS10B1+PS11B1+PS12B1;
PTB1 = PT1B1 + PT2B1 + PT3B1 + PT4B1 + PT5B1 + PT6B1 + PT7B1+PT8B1+PT9B1+PT10B1+PT11B1+PT12B1;
SSB1 = SS1B1 + SS2B1 + SS3B1;
TTB1 = TT1B1 + TT2B1 + TT3B1;
STB1 = ST1B1 + ST2B1 + ST3B1;
PSB3 = PS1B3 + PS2B3 + PS3B3 + PS4B3 + PS5B3;
PTB3 = PT1B3 + PT2B3 + PT3B3 + PT4B3 + PT5B3;
SSB3 = SS1B3 + SS2B3;
TTB3 = TT1B3 + TT2B3;
STB3 = ST1B3 + ST2B3 + ST3B3;
PSB2 = PS1B2 + PS2B2 + PS3B2;
PTB2 = PT1B2 + PT2B2 + PT3B2;
SSB2 = SS1B2 + SS2B2 + SS3B2;
TTB2 = TT1B2 + TT2B2 + TT3B2;
STB2 = ST1B2 + ST2B2 + ST3B2;



%Solving the system for MB1 & MC1

E = [SSB1,STB1;STB1,TTB1];
F = [-PSB1;-PTB1];
SOLUTIONB1 = E\F;

MB1 = SOLUTIONB1(1);
MC1 = SOLUTIONB1(2);

M1Total= p1 + MB1*s1 + MC1*t1;


%Solving the system for MB2 & MC2

G = [SSB2,STB2;STB2,TTB2];
B = [-PSB2;-PTB2];
SOLUTIONB2 = G\B;

MB2 = SOLUTIONB2(1);
MC2 = SOLUTIONB2(2);

M2Total= p2 + MB2*s2 + MC2*t2;



%solving a system to find B3y & C3y

C = [SSB3,STB3;STB3,TTB3];
D = [-PSB3;-PTB3];
SOLUTIONB3 = C\D;

B3y = SOLUTIONB3(1);
C3y = SOLUTIONB3(2);

M3Total = p3 + B3y*s3 + C3y*t3;

%Equation of the total moment
MTotal= M1Total + M2Total + M3Total;


%Moment Diagram Plot for MTotal


MomentDiagram = figure('Name','Total Moment Diagram','NumberTitle','off');

plot(x, MTotal);
title('Total Moment Diagram', 'fontsize' , 12);
xlabel('x' , 'fontsize' ,12);
ylabel('Moment' , 'fontsize',12);
fill (x,MTotal,'b');
grid on;
box on;




%--------------------------Shear-------------

syms x
%Secondary 1
%Shear

vs11= diff(x/l1);
vs12= diff (1- ((x-l1)/l2));
vs13= 0;

%Tertiary  1
%Shear

vt11= 0;
vt12= diff ((x-l1)/l2);
vt13= diff ( 1- ((x-l1-l2)/l3));

%Secondary 2
%Shear

 
vs21 = diff(x/l1);


vs22 = diff(1- ((x-l1)/l2));
 

vs23 = 0;   


%Tertiary  2
%Shear


vt21= 0;


vt22 = diff((x-l1)/l2);


vt23 = diff(1- ((x-l1-l2)/l3));


%Primary 3
%Shear

 
vp31= diff((M31/d31)*x);


vp32= diff(M31+((M32-M31)/(d32-d31))*(x-d31));

   
vp33 = diff(M32+((M33-M32)/(d33-d32))*(x-d32));

  
vp34 = diff(M33-((M33*(x-d33))/(L-d33)));


%Secondary 3
%Shear

    
vs31 = diff(-((l2+l3)/L)*x);
   
vs32 = diff(-((l1*(l2+l3))/L)*(1-((x-l1)/(l2+l3))));


%Tertiary 3
%Shear

vt31 = diff(-(l3/L)*x);
    
vt32 = diff(-((l3*(l1+l2))/L)*(1-((x-l1-l2)/(l3))));


%----------------------------------------------------------------


x = (0:0.1:L);

for i = 1:length(x);

%Primary 2
%Shear

if x(i) >= 0 && x(i)<= l1;
    
VP2(i) = 210 - 42*x(i);

elseif x(i) > l1 && x(i)<= (l1+l2);

VP2(i)= 1505/2 - 43*x(i);

else
    
x(i) > (l1+l2) && x(i)<= L;
    
VP2(i)= 1100 - 40*x(i) ;

end


%Secondary 2
%Shear

if x(i) >= 0 && x(i)<= l1;
    
VS2(i)= vs21 ;

VS1(i)= vs11;

elseif x(i) > l1 && x(i)<= (l1+l2);
    
VS2(i)= vs22;

VS1(i)=vs12 ;

else
    
    x(i) > (l1+l2) && x(i)<= L;
    
VS2(i)= vs23; 

VS1(i)= vs13;   

end


%Tertiary  2
%Shear


if x(i) >= 0 && x(i)<= l1;

VT2(i)= vt21;

VT1(i)= vt11;

elseif x(i) > l1 && x(i)<= (l1 + l2);
    
VT2(i)= vt22;

VT1(i)= vt12;

else
    
    x(i)>= (l1 + l2) && x(i)<= L;

VT2(i)= vt23;

VT1(i)= vt13;

end


%Primary 3
%Shear


if x(i) >= 0 && x(i)<= d31;
    
VP3(i)= vp31;

elseif  x(i) > d31 && x(i)<= d32;

VP3(i)= vp32;

elseif x(i) > d32 && x(i)<= d33;
    
VP3(i)= vp33;

else x(i) > d33 && x(i)<= L;
    
    
VP3(i)= vp34;

end


%Secondary 3
%Shear

if x(i) >= 0 && x(i)<= l1;
    
VS3 (i)= vs31;

else
    
    x(i) > l1 && x(i)<= L;
    
VS3 (i) = vs32;

end


%Tertiary 3
%Shear


if x(i) >= 0 && x(i)<= (l1 + l2);

VT3(i)= vt31;

else
    
    x(i) > (l1 + l2) && x(i)<= L;
    
VT3(i)= vt32;


end
end


V1Total=   double (  MB1*VS1 + MC1*VT1);

V2Total=  double ( VP2 + MB2*VS2 + MC2*VT2);

V3Total = double (VP3 + B3y*VS3 + C3y*VT3);

VTotal=   V1Total + V2Total + V3Total;


%Shear Diagram Plot
ShearDiagram = figure('Name','Total Shear Diagram','NumberTitle','off');

plot(x, VTotal);
title('Total Shear Diagram', 'fontsize' , 12);
xlabel('x' , 'fontsize' ,12);
ylabel('Shear' , 'fontsize',12);
grid on;
box on;


%Stresses

StressTop = -P/A - (MTotal*ct)/I;
StressBottom = -P/A - (MTotal*cb)/I;


% Top Stress Diagram Plot

TopStressDiagram = figure('Name','Top Stress Diagram','NumberTitle','off');

plot(x, StressTop);
title('Top Stress Diagram', 'fontsize' , 12);
xlabel('x' , 'fontsize' ,12);
ylabel('Top Stress' , 'fontsize',12);
grid on;
box on;


 %Bottom Stress Diagram Plot

BottomStressDiagram = figure('Name','Bottom Stress Diagram','NumberTitle','off');

plot(x, StressBottom);
title('Bottom Stress Diagram', 'fontsize' , 12);
xlabel('x' , 'fontsize' ,12);
ylabel('Bottom Stress' , 'fontsize',12);
grid on;
box on;


%Stress, Moment and Shear values at a distance x

x = input('input the value of the distance x along the beam ');

M = MTotal((10.*x) + 1)
V = VTotal((10.*x) + 1)
TopFiberStress = StressTop((10.*x) + 1)
BottomFiberStress = StressBottom((10.*x) + 1)


%Stress value at an intermediate elevation y

y = input('input the value of the intermediate elevation y measured from the cgc line ');


StressIntermediate = -P/A - (MTotal*y)/I;

IntermediateStress = StressIntermediate((10.*x) + 1)

end