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
numWeeksPerYearOp = input('What is the number of weeks per year that the zoo will operate?');

%number of years of operation
yearOp = input('What is the number of years that the zoo will operate for?');
