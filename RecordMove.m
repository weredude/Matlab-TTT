%script can access workspace variables
%each move is added to the winning possiblities, rows, columns, or diagonal

filledRows(moveIndex1) = filledRows(moveIndex1) + xOrOValue;
filledColumns(moveIndex2) = filledColumns(moveIndex2) + xOrOValue;

if moveIndex1 == moveIndex2
    filledDiagonals(1) = filledDiagonals(1) + xOrOValue;
end
if moveIndex1+moveIndex2 == 4
    filledDiagonals(2) = filledDiagonals(2) + xOrOValue;
end
turnCount = turnCount+1;