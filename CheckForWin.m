

if any(abs(filledRows)==3)||any(abs(filledColumns)==3)||any(abs(filledDiagonals)==3)
    gameOver = true;
elseif all(gameState)
   gameOver = true;
else
   gameOver = false;
end