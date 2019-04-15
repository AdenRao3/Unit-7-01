-----------------------------------------------------------------------------------------
--
-- Created by: Aden Rao
-- Created on: April 1, 2019
--
-- This program has two objects one that you can drag (comprhensive touch event) and another object that is just a normal touch event.
--
-----------------------------------------------------------------------------------------

-- simple touch code
-------------------------------------------------------------

-- Ball image
local theBall = display.newImageRect( "./assets/ball2.png", 150, 150 )
theBall.x = display.contentCenterX
theBall.y = display.contentCenterY + 50
theBall.id = " theBall "

-- Touch listener function 
local function onBallTouched( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. event.target.id )
        theBall.y = theBall.y + 10
    elseif ( event.phase == "ended" ) then
        print( "Touch event ended on: " .. event.target.id )
        theBall.y = theBall.y + 10        
    end
  
    return true
end

theBall:addEventListener( "touch", onBallTouched )
--------------------------------------------------------------

-- Comprehensive touch 
----------------------------------------------------------------
--backround colour and ball image
--------------
display.setDefault( "background", 125/255, 0/255, 200/255 )

local ball = display.newImageRect( "./assets/ball.png", 300, 225 )
ball.x = display.contentCenterX
ball.y = display.contentCenterY - 160
ball.id = " ball "
--------------

-- touch listener function
function ball:touch( event )
  if event.phase == "began" then
    display.getCurrentStage():setFocus( self, event.id )
    self.isFocus = true
    self.markX = self.x
    self.markY = self.y

  elseif self.isFocus then

-- If statement for moving the ball
    if event.phase == "moved" then
      self.x = event.x - event.xStart + self.markX
      self.y = event.y - event.yStart + self.markY
    elseif event.phase == "ended" or event.phase == "cancelled" then
      display.getCurrentStage():setFocus( self, nil )
      self.isFocus = false
    end

  end

 return true
end

-- Event listener 
ball:addEventListener( "touch", ball )
-----------------------------------------------------------------