
function love.load()
  circle2 = {x = 400, y = 600, r = 30}
  circle = {x = 300, y = 700, r = 100}
end

function love.update(dt)
  -- move circle2 --
  if love.keyboard.isDown("up") then
    circle2.y = circle2.y - 1
  end
  if love.keyboard.isDown("down") then
    circle2.y = circle2.y + 1
  end
  if love.keyboard.isDown("left") then
    circle2.x = circle2.x - 1
  end
  if love.keyboard.isDown("right") then
    circle2.x = circle2.x + 1
  end

  -- change radius --
  if love.keyboard.isDown("2") and love.keyboard.isDown("up") then
    circle2.r = circle2.r + 1
  end
  if love.keyboard.isDown("2") and love.keyboard.isDown("down") then
    circle2.r = circle2.r - 1
  end
  
  -- move circle --
  if love.keyboard.isDown("w") then
    circle.y = circle.y - 1
  end
  if love.keyboard.isDown("s") then
    circle.y = circle.y + 1
  end
  if love.keyboard.isDown("a") then
    circle.x = circle.x - 1
  end
  if love.keyboard.isDown("d") then
    circle.x = circle.x + 1
  end
  
  -- circle2 window border --
  if circle2.x > 1690 then 
    circle2.x = circle2.x - 10
  end
  if circle2.x < 10 then 
    circle2.x = circle2.x + 10
  end
  if circle2.y > 790 then 
    circle2.y= circle2.y - 10
  end
  if circle2.y < 10 then 
    circle2.y = circle2.y + 10
  end

  --circle2 window border --
  if circle.x > 1690 then 
    circle.x = circle.x - 10
  end
  if circle.x < 10 then 
    circle.x = circle.x + 10
  end
  if circle.y > 790 then 
    circle.y = circle.y - 10
  end
  if circle.y < 10 then 
    circle.y = circle.y + 10
  end
  
  -- detect collision --
  
  color = detectCollision(circle2.x, circle2.y, circle.x, circle.y, circle.r, circle2.r)

  -- print helpful info --
  printcircle2 = "circle2 X: " .. tostring(circle2.x) .. " circle2 Y: " .. tostring(circle2.y) .. " circle2 R: " .. tostring(circle2.r)
  printCircle = "circle X: " .. tostring(circle.x) .. " circle Y: " .. tostring(circle.y) .. " circle R: " .. tostring(circle.r)
  printXdiff = "circle2 X - Circle X: " .. tostring(circle2.x - circle.x)
  printYdiff = "circle2 Y - Circle Y: " .. tostring(circle2.y - circle.y)
  
  printLines = "lineA: " .. tostring(lineA) .. " lineB: " .. tostring(lineB) .. " lineH: " .. tostring(lineH)
end

function love.draw()
  love.graphics.setNewFont(30)
  love.graphics.setColor(0,1,0)  
  love.graphics.circle("fill", circle.x, circle.y, circle.r)
  love.graphics.print(printCircle, 20, 20)
  if color then
    love.graphics.setColor(1,0,0)
  else
    love.graphics.setColor(0,0,1)
  end
  love.graphics.circle("fill", circle2.x, circle2.y, circle2.r)
  love.graphics.print(printcircle2, 20, 60)
  
  love.graphics.setColor(1,1,1)
  love.graphics.print(printXdiff, 20, 100)
  love.graphics.print(printYdiff, 20, 140)
  
  love.graphics.print(printLines, 20, 180)
  
  love.graphics.print({{1,0,0}, "h", {0,1,0}, "e", {0,0,1}, "l", {0.5, 0.2, 0}, "l", {0.6, 0.5, 0.3}, "o"}, 150, 210)
  
  -- add lines --
  love.graphics.setLineWidth(4)
  love.graphics.setColor(0.6,0,0.2)
  love.graphics.line(circle2.x, circle2.y, circle.x, circle.y)
  love.graphics.setColor(1,1,1)
  love.graphics.line(circle2.x, circle2.y, circle2.x, circle.y)
  love.graphics.line(circle2.x, circle.y, circle.x, circle.y)
end

function detectCollision(x1, y1, x2, y2, r, r2)
  lineA = math.abs(x1 - x2)
  lineB = math.abs(y1 - y2)
  lineH = math.floor(math.sqrt(( lineA * lineA ) + ( lineB * lineB )))
  if lineH <  (r + r2) then
    return true
  else
    return false 
  end
end

