--Simple text engine for Corona SDK
--author : Andrea Bonapersona "Rayjax" - 2014 

module(..., package.seeall)

local _sharedInstance

function getInstance()
    if _sharedInstance==nil then
        _sharedInstance = _new()
    end

    return _sharedInstance
end

function _new()

	local this = {}

    function this:createTextWithShadow(x, y, displayGroup, textContent, fontType, fontSize, textRGB, shadowOffsetX, shadowOffsetY, shadowSizeMultiplier, shadowRGB)
    	if fontType == nil then
    		fontType = native.systemFont
    	end

	    local text = display.newText(textContent, x, y, fontType, fontSize)
	    text:setFillColor(textRGB.r, textRGB.g, textRGB.b)
	    text.text = textContent
	    
	    local textShadow = display.newText(textContent, 0, 0, fontType, fontSize * shadowSizeMultiplier)
	    textShadow.x = x + shadowOffsetX
	    textShadow.y = y + shadowOffsetY
	    textShadow:setFillColor(shadowRGB.r, shadowRGB.g, shadowRGB.b)
	    textShadow.text = textContent

	    displayGroup:insert(textShadow)
	    displayGroup:insert(text)
	    return text, textShadow
	end

	function this:createTextWithStroke( x, y, displayGroup, textContent, fontType, fontSize, textRGB, strokeType, strokeSize, strokeRGB, strokeQuality, smoothnessStrenght)

    	local textStrokes = {}

    	function round(float)
    		return math.floor(float+0.5)
    	end

    	--Stroke quality defines the number of layers for the stroke
    	strokeQuality = math.min(strokeQuality, 100)
    	strokeQuality = math.max(strokeQuality, 1)
    	strokeQuality = strokeQuality / 12.5
    	local startStroke = 5 - math.floor(strokeQuality / 2)
    	local endStroke = 4 + math.ceil(strokeQuality / 2)

    	--Smoothness strenght defines the number of smooth stroke layers used
    	smoothnessStrenght = math.min(smoothnessStrenght, 100)
    	smoothnessStrenght = math.max(smoothnessStrenght, 1)
    	smoothnessStrenght = round(1/(smoothnessStrenght / 100))
    	local increment = 1 * smoothnessStrenght

    	--Draws a stroke layer with specified parameters
    	function drawStroke(x, y, offset, alpha)
    		local strokeX, strokeY
    		for j = startStroke, endStroke do
    			strokeX = x
    			strokeY = y
    			if j == 1 then
    				strokeX = x + offset
    				strokeY = y - offset
    			elseif j == 2 then
    			 	strokeX = x + offset
    				strokeY = y + offset
    			elseif j == 3 then
    				strokeY = y - offset
    			elseif j == 4 then
    				strokeY = y + offset
    			elseif j == 5 then
    				strokeX = x - offset
    			elseif j == 6 then
    				strokeX = x + offset
    			elseif j == 7 then
    				strokeX = x - offset
    				strokeY = y - offset
    			elseif j == 8 then
    				strokeX = x - offset
    				strokeY = y + offset
    			end

				local textStroke = display.newText(  textContent, x, y, fontType, fontSize )
				textStroke.x = strokeX
	    		textStroke.y = strokeY
				textStroke:setFillColor(strokeRGB.r, strokeRGB.g, strokeRGB.b)
				textStroke.alpha = alpha
				table.insert(textStrokes, textStroke)
				displayGroup:insert(textStroke)
			end
		end

    	--For hard stroke, one iteration is enough
    	if strokeType == "hard" then
    		drawStroke(x, y, strokeSize, 1)

    	--For smooth strokes, several iterations are necessary
    	else
    		local alpha = 1
    		for i = 1, strokeSize, increment do
    			if strokeType == "linearSmooth" then
    				alpha = math.max(alpha - (increment/strokeSize), 0.1)
    			else
    				alpha = 1 / i
    			end
				drawStroke(x, y, i, alpha)
			end
    	end

		--Text
		local text = display.newText(textContent, x, y, fontType, fontSize)
	    text:setFillColor(textRGB.r, textRGB.g, textRGB.b)
	    text.text = textContent
	    displayGroup:insert(text)

	    return text, textStrokes
	end

    return this

end