%Breakeven Analysis Project 2020

%Team #11_THUR_3:
%Justin Geisen
%Carl Raymundo
%Emmanuel Pembele


clear 
clc
close all

materials = {'Concrete','Wood','Adobe'};
Menu = menu('Select Material', materials);
array1 = {'Concrete', 16, 30,96000,900,5,5;'Wood',23,53,115000,800,12,11;'Adobe',18,42,68000,600,6,5};

chosenArray = array1(Menu,:);

thicknessFt = chosenArray{2}/12;

surfaceArea = 3000;

materialCost = thicknessFt*surfaceArea*chosenArray{3};

miscCost = chosenArray{4};

fixedLaborCost = chosenArray{5}*chosenArray{6}*chosenArray{7};

fixedCost = materialCost + miscCost + fixedLaborCost;


energyCost = input('What is the energy cost per week(USD)? ');

laborCost = input('What is the labor cost per week(USD)? ');

maintenanceCost = input('What is the maintenance cost per week(USD)? ');

landFillCost = input('What is the landfill cost per week(USD)? ');

%number of weeks per year for zoo operation
numWeeksPerYearOp = input('What is the number of weeks per year that the zoo will operate? ');

%number of years of operation
yearOp = input('What is the number of years that the zoo will operate for? ');

%Price of Admission
priceAdmission=input('What is the price of admission per person? ');
%Number of People that visit per week
visitor=input('What is the number of people that visit per week? ');
%Expected Donations per week
donations=input('What is the expected amount of donations per week? ');

weeklyIncome = priceAdmission*visitor+donations;

capital = fixedCost;

costPerWeek = energyCost + laborCost + maintenanceCost + landFillCost;

monthsBreakeven = (capital/(weeklyIncome - costPerWeek))/4;

revenuePerYear = weeklyIncome * numWeeksPerYearOp;

costPerYear = costPerWeek * numWeeksPerYearOp;

totalProfit = (revenuePerYear - costPerYear) * yearOp  - capital;

donation = capital + (costPerWeek - weeklyIncome) * 28;

breakEvenYear = (capital/(weeklyIncome - costPerWeek))/numWeeksPerYearOp;

fprintf('\nMaterial: %s\n\tOperating %0.0f weeks per year will generate per year:\n\t\tRevenue:\t$%0.0f\n\t\tCost:\t\t$%0.0f\n\tThe breakeven time is %0.2f months\n\tThe total profit after %0.0f years is $%e.\n', materials{Menu}, numWeeksPerYearOp, revenuePerYear, costPerYear, monthsBreakeven, yearOp, totalProfit);

fprintf('\nIt will take a one-time donation of $%0.2f to breakeven in seven months.\n', donation);

%x is years
x = 0:yearOp

revenueY = revenuePerYear * x;

costY = costPerYear * x + capital;

revenueAtBreakeven = breakEvenYear * revenuePerYear;

figure(1)

plot (x, revenueY, x, costY, breakEvenYear, revenueAtBreakeven, 'ok');

grid on;

legend('Revenue', ' Cost', 'location', 'best');

xlabel('Years');

ylabel('Money(USD)');

title1 = sprintf('Cost and Revenue for %s', materials{Menu});

title(title1);

yProfit = (revenuePerYear - costPerYear) * x - capital;

figure(2)

x2 = 0:yearOp;

plot(x2, yProfit, breakEvenYear, 0, 'ko');

grid on;

xlabel('Years');

ylabel('Money(USD)');

title2 = sprintf('Profit for %s', materials{Menu});

title(title2);
