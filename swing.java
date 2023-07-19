//được sửa đổi dựa trên gann swing của meo meo và insidebar của Hlong
//@version=5
indicator('TLP Swing Chart', shorttitle='TLP SWING', overlay=true, max_lines_count=500)

//-----Input-------
DefaultTLPSetting = "TLPSwingSetting"
showTLP = input.bool(true, 'Show TLP SWING', group=DefaultTLPSetting, inline = "Line1")
colorTLP = input.color(color.orange, group=DefaultTLPSetting, inline = "line1")
widthTLP = input.int(defval=1,title = "",minval=1, group=DefaultTLPSetting , step=1, inline = "Line1")

IOSB = "TLPInOutSideBarSetting"
sib = input(false,group =IOSB, title="Show Inside Bars")
sob = input(true,group =IOSB, title="Show Outside Bars")
ZoneColor = input(defval = color.new(color.orange, 80),group =IOSB, title = "Background Color")
BorderColor = input(defval = color.new(color.orange, 80),group =IOSB, title = "Border Color")


var aCZ = array.new_float(0)

float highest = high[1]
float lowest = low[1]


if (array.size(aCZ) > 0) 
    highest := array.get(aCZ, 0)
    lowest := array.get(aCZ, 1)

insideBarCondtion = low >= lowest and low <= highest and high >= lowest and high <= highest      


if ( insideBarCondtion == true )
    array.push(aCZ, high[1])
    array.push(aCZ, low[1])

if( array.size(aCZ) >= 2 and insideBarCondtion == false )
    float maxCZ = array.max(aCZ)
    float minCZ = array.min(aCZ)
    box.new(bar_index - (array.size(aCZ) / 2) - 1, maxCZ, bar_index - 1, minCZ, bgcolor = ZoneColor, border_color = BorderColor)
    array.clear(aCZ)

// Funtion
arrayPopPush(_array,_value) =>
    array.pop(_array)
    array.push(_array,_value)
arrayShiftPush(_array,_value) =>
    array.shift(_array)
    array.push(_array,_value)

var arrayX = array.new_int(5,bar_index)
var arrayY = array.new_float()
line lineTLP = na
int drawLine = 0
highPrev = high
lowPrev = low
bool runCheckChoCh = false
if(array.size(arrayY) == 0)
	array.push(arrayY,close - math.abs(high - low)*1)
	array.push(arrayY,close + math.abs(high - low)*1)
	array.push(arrayY,close - math.abs(high - low)*2)
	array.push(arrayY,close + math.abs(high - low)*2)
	array.push(arrayY,close)

// 0:Tiếp tục 1:Đảo chiều; // Outsidebar 2:Tiếp tục 3:Tiếp tục và Đảo chiều
drawLine := 0
runCheckChoCh := runCheckChoCh[1]
if(high[0] > highPrev[1] and low[0] > lowPrev[1])
	if(array.get(arrayY,4) >= array.get(arrayY,3))
	    if(high[0] > array.get(arrayY,4))
		    arrayPopPush(arrayX,bar_index)
	        arrayPopPush(arrayY,high[0])
	else
		arrayShiftPush(arrayX,bar_index)
	    arrayShiftPush(arrayY,high[0])
		drawLine := 1
		runCheckChoCh := true
else if(high[0] < highPrev[1] and low[0] < lowPrev[1])
	if(array.get(arrayY,4) >= array.get(arrayY,3))
		arrayShiftPush(arrayX,bar_index)
	    arrayShiftPush(arrayY,low[0])
		drawLine := 1
		runCheckChoCh := true
	else
	    if(low[0] < array.get(arrayY,4))
		    arrayPopPush(arrayX,bar_index)
	        arrayPopPush(arrayY,low[0])
else if(high[0] >= highPrev[1] and low[0] <= lowPrev[1])
    if(array.get(arrayY,4) > array.get(arrayY,3))
        if(high[0] > array.get(arrayY,4))
		    arrayPopPush(arrayX,bar_index)
	        arrayPopPush(arrayY,high[0])
	        drawLine := 2
        if(array.get(arrayY,3) > low[0])
		    arrayShiftPush(arrayX,bar_index)
		    arrayShiftPush(arrayY,low[0])
		    drawLine := 3
			runCheckChoCh := true
	else if(array.get(arrayY,4) < array.get(arrayY,3))
	    if(low[0] < array.get(arrayY,4))
		    arrayPopPush(arrayX,bar_index)
	        arrayPopPush(arrayY,low[0])
	        drawLine := 2
        if(high[0] > array.get(arrayY,3))
		    arrayShiftPush(arrayX,bar_index)
		    arrayShiftPush(arrayY,high[0])
		    drawLine := 3
			runCheckChoCh := true
else if(high[0] <= highPrev[1] and low[0] >= lowPrev[1])
	highPrev := highPrev[1]
	lowPrev := lowPrev[1]
	

if(showTLP)
    if(drawLine == 0 or drawLine == 2)
    	line.delete(lineTLP[1])
        lineTLP := line.new(array.get(arrayX,3),array.get(arrayY,3),array.get(arrayX,4),array.get(arrayY,4), color = colorTLP, width = widthTLP)
    else if(drawLine == 1)
        lineTLP := line.new(array.get(arrayX,3),array.get(arrayY,3),array.get(arrayX,4),array.get(arrayY,4), color = colorTLP, width = widthTLP)
    else if(drawLine == 3)
        line.delete(lineTLP[1])
        lineTLP := line.new(array.get(arrayX,2),array.get(arrayY,2),array.get(arrayX,3),array.get(arrayY,3), color = colorTLP, width = widthTLP)
        lineTLP := line.new(array.get(arrayX,3),array.get(arrayY,3),array.get(arrayX,4),array.get(arrayY,4), color = colorTLP, width = widthTLP)
//Inside Bars
insideBar() => sib and high <= high[1] and low >= low[1] ? 1 : 0
outsideBar() => sob and (high > high[1] and low < low[1]) ? 1 : 0

//Inside and Outside Bars
barcolor(insideBar() ? color.yellow : na )
barcolor(outsideBar() ? color.blue : na )
//NoSD
noS = close[1] < open[1] and  close > open and low < low[1]
noD = close[1] > open[1] and  close < open and high > high[1]

plotshape(noS, title='No S',style = shape.arrowup, location = location.belowbar, size = size.small,color=color.green )
plotshape(noD, title='No D',style = shape.arrowdown, location = location.abovebar, size = size.small,color=color.red )
