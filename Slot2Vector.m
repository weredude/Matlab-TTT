%converts a slot number 1-9 to its 2 index form [1,1]-[3,3]

function[index1, index2] = Slot2Vector(slot)
    
    if slot <= 3
        index1 = 1;
        index2 = slot;
    elseif slot <= 6
        index1 = 2;
        index2 = slot-3;
    else
        index1 = 3;
        index2 = slot-6;
    end

end