-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- set default background color to white
display.setDefault("background", 255, 255, 255, 1)

local utility= require("utility")

utility.draw_grid(20,20)
