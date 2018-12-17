A= [2,2048]; 
a=fopen("../assets/sample_data.dat"); 
X=fread(a, A ,'int16'); 
Y=transpose(X);

R1=Y(1:128, 1:2); 
R2=R1(:,1); 
R3=R1(:,2); 
RP=R2.^2+R3.^2

Prob6 = RP(33:128,:); 
Mean=mean(Prob6);

figure
hold on 
plot(RP) 
xlabel('t (unit*150m)') 
ylabel('Power') 
title('Radar Signal Strength vs Range') 
grid on 
hold off

Plot6=RP-2*Mean; 
Plot7=RP-4*Mean; 
Plot8=RP-7*Mean; 
Plot9=RP-12*Mean; 
Plot10=RP-18*Mean;

sixb=sum((Plot6) > 0) -1 
sixc=sum((Plot7) > 0) -1 
sixd=sum((Plot8) > 0) -1 
sixe=sum((Plot9) > 0) -1 
sixf=sum((Plot10) > 0) -1

Pro7=Y(:,1).^2+Y(:,2).^2; 
Pro7T=reshape(Pro7,[],16);

Cdata=transpose(Pro7T);

figure 
h=imagesc(Cdata)
xlabel('Range(150m per unit)')
ylabel('Time(1ms)')
title('Radar Signal Strength per Pulse')

Pave=sum(Cdata)/16; 

figure 
plot(Pave) 
xlabel('t (unit*150m)') 
ylabel('Power') 
title('Average Radar Signal Strength (Power) vs Range') 
grid on 
axis([1 128 0 5000000]);
Pro9=sqrt(Pro7); 
Pro9T=reshape(Pro9,[],16); Pro9reshape = transpose(Pro9T); 
Promean=sum(Pro9reshape)/16;
Pfave=Promean.^2; 

figure 
plot(Pfave) 
xlabel('t (unit*150m)') 
ylabel('Power') 
title('Average Radar Signal Strength (Voltage^2) vs Range') 
grid on 
axis([1 128 0 5000000]);

