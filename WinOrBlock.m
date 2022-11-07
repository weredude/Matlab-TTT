
        %look for a win or a block
        rIndex = find(filledR == 2*turnVar);
        cIndex = find(filledC == 2*turnVar);
        if rIndex
            %if a row has a possible win, look for the 0 and get the index
            newIndex1 = rIndex;
            newIndex2 = find(state(rIndex,:)==0);
            foundOption = true;
        elseif cIndex
            %if a column has a possible win, look for the 0 and get the index
            newIndex1 = find(state(:,cIndex)==0);
            newIndex2 = cIndex;
            foundOption = true;
        elseif filledD(1) == 2*turnVar
            %if a diagonal has a win, check each spot for a 0 and get the
            %index
            for index = 1:3
                if state(index,index) == 0
                    newIndex1 = index;
                    newIndex2 = index;
                    foundOption = true;
                end
            end
        elseif filledD(2) == 2*turnVar
            for index = 1:3
                if state(index,size(state,1)+1-index) == 0
                    newIndex1 = index;
                    newIndex2 = size(state,1)+1-index;
                    foundOption = true;
                end
            end
        else
            foundOption = false;
        end
    end