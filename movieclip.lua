-- Project: Asset Layout Test
-- From http://GameDevNation.com
-- Source: http://gamedevnation.com/game-development/graphics-layout-tool/

local M = {}
local movieclip = require("movieclip")

-- turn all objects into a drag-drop movie clips
-- and spits the co-ordinates into the coronaSDK console
function M.movieclip()

end
local sky = display.newImage("sky.jpg", 0, 0)

local myPics = { "grass.png", "bamboo.png", "palm.png" }
local pieces = {}

local function dropPiece()
  for x = 1, #myPics do
    local pname = pieces[x].thename
    local px = pieces[x].x
    local py = pieces[x].y
    local codestr = "local " .. pname:sub(0, -5) .. " = display.newImage(\"" .. pname .. "\", " .. px .. ", " .. py .. ")"
    print(codestr)
  end
end

local i = 1
for i = 1, #myPics do
  pieces[i] = movieclip.newAnim{ myPics[i] }
  pieces[i].thename = myPics[i]
  pieces[i]:setDrag{ drag = true, onRelease = dropPiece}
  pieces[i]:setReferencePoint(display.TopLeftReferencePoint)
  pieces[i].x = i * 30
  pieces[i].y = 20
end