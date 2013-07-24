function [f] = OneWayANOVA( x )
%OneWayANOVA Put Treatments in columns and repititions in rows.
%   To use, create a matrix with the treatments(I) arranged in columns and
%   the samples(J) in the rows.  The function will generate a table with
%   all of the neccessary values for use in the analysis.

%initial math
[j,i] = size(x);
dftr = i-1;
dfe = i*(j-1);
dft = i*j-1;
xbar = mean(x);
gxbar = mean(xbar);
sstr = 0;
sse = 0;
sst = 0;

%array math
for y = 1:i
    for z = 1:j
        sstr = sstr + (xbar(y)-gxbar)^2;
        sse = sse + (x(z,y)-xbar(y))^2;
        sst = sst + (x(z,y)-gxbar)^2;
    end
end

%final math
mstr = sstr/dftr;
mse = sse/dfe;
f = mstr/mse;

%create table
line1='Source | D.F. |   SS   |   MS   |   f  ';
line2=sprintf('Tr     |% 5g |%# 5.5g |%# 5.5g |%# 5.5g',dftr,sstr,mstr,f);
line3=sprintf('Error  |% 5g |%# 5.5g |%# 5.5g',dfe,sse,mse);
line4=sprintf('Total  |% 5g |%# 5.5g',dft,sst);

%display table
disp(line1)
disp(line2)
disp(line3)
disp(line4)
end

