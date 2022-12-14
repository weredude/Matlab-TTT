%callback script when button gets clicked
%gcbo is the callback object
%'userdata' contains the slot number for the button 1-9



%get slot number and convert to indexes
moveSlot = get(gcbo, 'userdata');
[moveIndex1, moveIndex2] = Slot2Vector(moveSlot);
%log the indexes into the win vectors
xOrOValue = playerMove;
RecordMove;
%assign gamestate value to -1 or 1(x or o)
gameState(moveIndex1,moveIndex2) = playerMove;
if playerMove == 1
    set(gcbo, 'string', 'X');
else
    set(gcbo, 'string', 'O');
end
%disable button
set(gcbo, 'Enable', 'off');
if humanVsHuman
    playerMove = playerMove * -1;
end

CheckForWin;
%if no win or tie
if ~gameOver && ~humanVsHuman
    %find the computer's move
    FindNextMove;
    %log the indexes into the win vectors
    xOrOValue = computerMove;
    RecordMove;
    %assign gamestate value to -1 or 1(x or o)
    gameState(moveIndex1,moveIndex2) = computerMove;
    %grab slot from double index
    moveSlot = Vector2Slot(moveIndex1,moveIndex2);
    if computerMove == 1
        set(findobj('userdata',moveSlot),'string','X');
    else
        set(findobj('userdata',moveSlot),'string','O');
    end
    set(findobj('userdata',moveSlot),'Enable', 'off');
    CheckForWin;
elseif gameOver
    %gameover => disable all slots
    for slotNum = 1:9
        set(findobj('tag', ['Slot',num2str(slotNum)]), 'Enable', 'off');
    end
end