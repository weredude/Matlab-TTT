%converts a 2 index form [1,1]-[3,3] to a slot number 1-9

function[slot] = Vector2Slot(index1, index2)
    slot = index2 + 3*(index1-1);
end