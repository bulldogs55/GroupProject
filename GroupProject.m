%Written by Carl, Justin, Emmanuel
%ENGR 1250 - 011
clear;
clc;

% 1 - Input the Cell Array and Variables
materials = {'Concrete','Wood','Adobe'};
Menu = menu('Select Material', materials);
array1 = {'Concrete', 16, 30,96000,900,5,5;'Wood',23,53,115000,800,12,11;'Adobe',18,42,68000,600,6,5};

chosenArray = array1(Menu,:);

thicknessFt = chosenArray{2}/12;        %ft

surfaceArea = 3000;       %ft

% 2 - Calculate the Fixed Cost
materialCost = thicknessFt*surfaceArea*chosenArray{3};        %$

miscCost = chosenArray{4};                                %$

fixedLaborCost = chosenArray{5}*chosenArray{6}*chosenArray{7};     %$

fixedCost = materialCost + miscCost + fixedLaborCost;            %$


