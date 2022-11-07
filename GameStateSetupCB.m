%sets up workspace variables
%zeros(size1, size2) makes a [size1,size2] matrix of 0s

rng shuffle

filledColumns = zeros(1,3);
filledRows = zeros(1,3);
filledDiagonals = zeros(1,2);
gameState = zeros(3,3);

xOrOValue = 1;
turnCount = 0;
gameOver = false;

moveIndex1 = 0;
moveIndex2 = 0;

mode = 'medium';
first2Move = 'comp';