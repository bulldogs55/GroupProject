clear 
clc

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



fprintf("Material: %s\n\tOperating %0.0f weeks per year will generate per year:\n\t\tRevenue:\t$%0.0f\n\t\tCost:\t$%0.0f\n\tThe breakeven time is %0.2f months\n\tThe total profit after %0.0f years is $%e.\n", materials{Menu}, numWeeksPerYearOp, revenuePerYear, costPerYear, monthsBreakeven, yearOp, totalProfit);

