clearvars
close all;
%Name: Tony Nguyen
%REDid: 820611539

X = [4.2,1.4,6.6,4.7,2.6,5.8,1.8,5.8,7.3,7.1,6.4,4.6,1.6,2.3,4.2,3.7,5.9,6.0,10.7,5.3,5.1,4.9,8.3,7.1,9.2,4.4,8.0,10.5,5.1,5.8,2.6,7.7,6.1,5.5,4.7,4.0,2.3,11.9,8.6,5.6,4.2,6.2,7.7,6.6,6.9];
 
Y = [1.9,0.7,2.2,2.0,1.1,2.6,3.0,2.3,2.6,2.7,2.4,2.2,1.1,1.5,1.5,2.1,2.2,2.6,3.2,2.3,1.9,2.3,3.1,2.3,2.9,1.8,2.6,3.0,2.1,2.5,1.4,2.8,2.4,2.2,2.3,2.0,1.2,3.0,2.5,2.1,1.7,2.3,2.6,2.9,2.6];

%Question 1
mx = mean(X);
my = mean(Y);
fprintf("The sampple mean wind speed is %6.4f miles per hour. ", mx)
fprintf("The sample mean DC current is %6.4f kiloAmps.\n\n", my)

%Question 2
stdx = std(X);
stdy = std(Y);
fprintf("The sample standard deviation wind speed is %6.4f miles per hour. ", stdx)
fprintf("The sample standard deviation DC current is %6.4f kiloAmps.\n\n", stdy)
 
%Question 3
maxOfX = max(X);
minOfX = min(X);
rangeOfX = range(X);
fprintf("The maximum value of the wind speeds is %4.1f miles per hour. ", maxOfX)
fprintf("The minimum value of the wind speeds is %3.1f miles per hour. \n", minOfX)
fprintf("The range of the wind speeds is %4.1f miles per hour.\n\n", rangeOfX)

%Question 4
bins= 8;
jj = 1 : bins;
aj = minOfX + (((jj-1)/bins) * (maxOfX - minOfX));
bj = minOfX + (((jj)/bins) * (maxOfX - minOfX));
cj = (aj + bj) / 2;
fprintf("The values of aj are: "); disp(aj);
fprintf("The values of bj are: "); disp(bj);
fprintf("The values of cj are: "); disp(cj);

%Question 5
nj = zeros(1,8);
for i = 1 : 45
    for j = 1 : 8
        if (X(1,i) >= aj(1,j) & X(1,i) <= bj(1,j))
            nj(1,j) = nj(1,j) + 1;
        end
    end
end
fprintf("There are this many values in each of the bins: "); disp(nj);

%Question 6
figure(1);
hist(X,8);
set(1,'Color','red')
title('Histogram for the Wind Speed');
xlabel('Bins');
ylabel('Wind Speed');

%Question 7
xa = sort(X, 'ascend');
fprintf("The wind speed values sorted in ascending order is: \n"); fprintf("%4.1f ",xa); fprintf("\n\n");

%Question 8
numElems = numel(xa);
parity = mod(numElems,2);
if (parity == 0)
    medianIndex1 = ((numElems + 1)/2) + 1;
    medianIndex2 = numElems/2;
    medianOfX = (xa(1,medianIndex1) + xa(1,medianIndex2))/2;
elseif (parity == 1)
    medianIndex = (numElems + 1)/2;
    medianOfX = xa(1,medianIndex);
end
matlabMedian = median(xa);
fprintf("The median wind speed calculated manually is: %4.2f. ", medianOfX);
fprintf("The median wind speed calculated using the MATLab function, median(), is: %4.2f.\n", matlabMedian);

%Question 9
lengthOfX = length(xa);
pmf = nj/lengthOfX;
fprintf("The probability mass function of the random variable W has the values: "); disp(pmf);

%Question 10
cdf = zeros(1,8);
for i = 1 : 8
    for j = 1 : i
        cdf(1,i) = cdf(1,i) + pmf(1,j);
    end
end
fprintf("The cumulative probability distribution function has the values: "); disp(cdf);

%Question 11
figure(2);
set(2,'Color','red');
plot(cj,cdf);
title('Cumulative Probability of Wind Speed');
xlabel('Wind Speed');
ylabel('Cumulative Probability');

%Question 12
figure(3);
set(3,'Color','red');   
scatter(X,Y);
title('Scatter Graph for the Wind Speed & DC Current');
xlabel('Wind Speed');
ylabel('DC Current');
fprintf("The scatter graph has a positive correlation.\n\n");

%Question 13
covxy = (45/44)*(mean((X-mx).*(Y-my)));
fprintf("The covariance of the wind speed and DC current is: "); disp(covxy);

%Question 14
corxy = (covxy)/(stdx*stdy);
fprintf("The correlation coefficient is %6.4f. The calculation confirms my observation of the scatterplot.\n\n", corxy);






