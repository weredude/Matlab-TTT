%when start button is clicked this runs
%first enable all slot buttons, then move if computer is moving first


for slotNum = 1:9
   set(findobj('tag', ['Slot',num2str(slotNum)]), 'Enable', 'on');
end

if strcmp(first2Move, 'computer') && ~humanVsHuman
    FindNextMove;
    xOrOValue = computerMove;
    RecordMove;
    gameState(moveIndex1,moveIndex2) = computerMove;
    moveSlot = Vector2Slot(moveIndex1,moveIndex2);
    set(findobj('userdata',moveSlot),'string','X');
    set(findobj('tag', 'StartButtonPB'),'Enable', 'off');
    set(findobj('userdata',moveSlot),'Enable', 'off');
end