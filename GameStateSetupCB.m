%sets up workspace variables
%zeros(size1, size2) makes a [size1,size2] matrix of 0s

rng shuffle

filledColumns = zeros(1,3);
filledRows = zeros(1,3);
filledDiagonals = zeros(1,2);
gameState = zeros(3,3);
cornerSpots = [1,1;1,3;3,1;3,3;];

xOrOValue = 1;
turnCount = 0;
gameOver = false;

moveIndex1 = 0;
moveIndex2 = 0;

humanVsHuman = true;
mode = 'medium';
first2Move = 'computer';

if strcmp(first2Move, 'human') || humanVsHuman
    computerMove = -1;
    playerMove = 1;
else
    computerMove = 1;
    playerMove = -1;
end