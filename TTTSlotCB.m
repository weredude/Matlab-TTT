%callback script when button gets clicked
%gcbo is the callback object
%'userdata' contains the slot number for the button 1-9





%get slot number and convert to indexes
moveSlot = get(gcbo, 'userdata');
[moveIndex1, moveIndex2] = Slot2Vector(moveSlot);
%log the indexes into the win vectors
RecordMove;
%assign gamestate value to -1 or 1(x or o)
gameState(moveIndex1,moveIndex2) = xOrOValue;
if xOrOValue == 1
    set(gcbo, 'string', 'X');
else
    set(gcbo, 'string', 'O');
end
%disable button
set(gcbo, 'Enable', 'off');
%switch turn
xOrOValue = xOrOValue*-1;

gameOver = CheckForWin(filledRows,filledColumns,filledDiagonals,gameState);
if ~gameOver
    [moveIndex1, moveIndex2] = FindNextMove(filledRows,filledColumns,filledDiagonals,gameState,mode,xOrOValue);
    RecordMove;
    gameState(moveIndex1,moveIndex2) = xOrOValue;
    moveSlot = Vector2Slot(moveIndex1,moveIndex2);
    if xOrOValue == 1
        set(findobj('userdata',moveSlot),'string','X');
    else
        set(findobj('userdata',moveSlot),'string','O');
    end
    set(findobj('userdata',moveSlot),'Enable', 'off');
    xOrOValue = xOrOValue*-1;

    gameOver = CheckForWin(filledRows,filledColumns,filledDiagonals,gameState);
else
    for slotNum = 1:9
        set(findobj('tag', ['Slot',num2str(slotNum)]), 'Enable', 'off');
    end
end

function [gameOver] = CheckForWin(filledR, filledC, filledD, state)

    if any(abs(filledR)==3)||any(abs(filledC)==3)||any(abs(filledD)==3)
        gameOver = true;
    elseif all(state)
        gameOver = true;
    else
        gameOver = false;
    end
end