%this function is very messy
%cant access workspace variables so filledR, filledC etc must be passed


if strcmp(mode,'expert')
    %if the board is empty move in the center
    if turnCount == 0
        moveIndex1 = 2;
        moveIndex2 = 2;
    %check for win
    [moveIndex1, moveIndex2, didWinOrBlock] = WinOrBlock(filledRows, filledColumns, filledDiagonals, gameState, xOrOValue);
    elseif ~didWinOrBlock
        %check for block
        [moveIndex1, moveIndex2, didWinOrBlock] = WinOrBlock(filledRows, filledColumns, filledDiagonals, gameState, -xOrOValue);
        if ~didWinOrBlock
            %rest of decision making
        end
    end

elseif strcmp(mode,'medium')
    %look if a win is possible
    [moveIndex1, moveIndex2, didWinOrBlock] = WinOrBlock(filledRows, filledColumns, filledDiagonals, gameState, xOrOValue);
    if ~didWinOrBlock
        %look for block
        [moveIndex1, moveIndex2, didWinOrBlock] = WinOrBlock(filledRows, filledColumns, filledDiagonals, gameState, -xOrOValue);
        if~didWinOrBlock
            %neither win nor block => pick a random open spot
            [openSpotsR,openSpotsC] = find(gameState==0);
            randIndex = randi(numel(openSpotsR));
            moveIndex1 = openSpotsR(randIndex);
            moveIndex2 = openSpotsC(randIndex);
        end
    end
    
else
    %easy mode => pick a random open spot
    [openSpotsR,openSpotsC] = find(gameState==0);
    randIndex = randi(numel(openSpotsR));
    moveIndex1 = openSpotsR(randIndex);
    moveIndex2 = openSpotsC(randIndex);
end
        
%nested function can access the variables in the outer function
function[index1, index2, foundOption] = WinOrBlock(filledR, filledC, filledD, state, turnVar)
    %look for a win or a block
    rIndex = find(filledR == 2*turnVar);
    cIndex = find(filledC == 2*turnVar);
    if rIndex
        %if a row has a possible win, look for the 0 and get the index
        index1 = rIndex;
        index2 = find(state(rIndex,:)==0);
        foundOption = true;
    elseif cIndex
        %if a column has a possible win, look for the 0 and get the index
        index1 = find(state(:,cIndex)==0);
        index2 = cIndex;
        foundOption = true;
    elseif filledD(1) == 2*turnVar
        %if a diagonal has a win, check each spot for a 0 and get the
        %index
        for index = 1:3
            if state(index,index) == 0
                index1 = index;
                index2 = index;
                foundOption = true;
            end
        end
    elseif filledD(2) == 2*turnVar
        for index = 1:3
            if state(index,size(state,1)+1-index) == 0
                index1 = index;
                index2 = size(state,1)+1-index;
                foundOption = true;
            end
        end
    else
        index1 = 0;
        index2 = 0;
        foundOption = false;
    end
end