local M = {}

-- handy utility function for printing lua table
function M.print_r ( t ) 
        local print_r_cache={}
        local function sub_print_r(t,indent)
                if (print_r_cache[tostring(t)]) then
                        print(indent.."*"..tostring(t))
                else
                        print_r_cache[tostring(t)]=true
                        if (type(t)=="table") then
                                for pos,val in pairs(t) do
                                        if (type(val)=="table") then
                                                print(indent.."["..pos.."] => "..tostring(t).." {")
                                                sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                                                print(indent..string.rep(" ",string.len(pos)+6).."}")
                                        elseif (type(val)=="string") then
                                                print(indent.."["..pos..'] => "'..val..'"')
                                        else
                                                print(indent.."["..pos.."] => "..tostring(val))
                                        end
                                end
                        else
                                print(indent..tostring(t))
                        end
                end
        end
        if (type(t)=="table") then
                print(tostring(t).." {")
                sub_print_r(t,"  ")
                print("}")
        else
                sub_print_r(t,"  ")
        end
        print()
end

-- function to draw a grid on the screen
-- can be used to check object positioning
function M.draw_grid(rows, cols)
	   -- find row and column width
       local actual_height = display.actualContentHeight
       local actual_width  = display.actualContentWidth
       local col_width  = actual_width/cols
       local row_width  = actual_height/rows
       
       

       local row_position = row_width
       for i=1,rows do
       		local line = display.newLine(0, row_position, display.actualContentWidth, row_position)
       		line:setStrokeColor( 1, 0, 0, 1 )
			line.strokeWidth = 4
			row_position = row_position + row_width
       	end

       	local col_position = col_width
       	for i=1,cols do
       		local line = display.newLine(col_position, 0, col_position, display.actualContentHeight)
       		line:setStrokeColor( 1, 0, 0, 1 )
			line.strokeWidth = 4
			col_position = col_position + col_width
       	end
end
return M
