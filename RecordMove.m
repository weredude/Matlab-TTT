%script can access workspace variables
%each move is added to the winning possiblities, rows, columns, or diagonal

filledRows(moveIndex1) = filledRows(moveIndex1) + currentTurn;
filledColumns(moveIndex2) = filledColumns(moveIndex2) + currentTurn;

if moveIndex1 == moveIndex2
    filledDiagonals(1) = filledDiagonals(1) + currentTurn;
end
if moveIndex1+moveIndex2 == 4
    filledDiagonals(2) = filledDiagonals(2) + currentTurn;
end
turnCount = turnCount+1;