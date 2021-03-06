Corona Text Engine
==================

Simple text effect engine for Corona SDK (cross-platform game engine)


## Usage
```lua
--Import text engine
local textEngine = require("textEngine")

--Get an instance of textEngine (which is a singleton)
local _textEngine = textEngine:getInstance()

--Create a displayGroup to hold the text and his shadow/stroke
dg_Main = display.newGroup()

--Create a background
local background = display.newRect(350, 450, 700, 900)
dg_Main:insert(background)

--Create some texts
_textEngine:createTextWithStroke(170, 170, dg_Main, "The quick", native.systemFont, 55, {r=0.2,g=0.35,b=1}, "hard", 2, {r=0,g=0,b=0}, 100, 100)


_textEngine:createTextWithStroke(315, 1020, dg_Main, "D O G", native.systemFont, 200, {r=0,g=0,b=0}, "hard", 18, {r=1,g=0.6,b=0}, 100, 100)
```

###Short API :

```lua
createTextWithShadow(x, y, displayGroup, textContent, fontType, fontSize, textRGB, shadowOffsetX, shadowOffsetY, shadowSizeMultiplier, shadowRGB)

createTextWithStroke( x, y, displayGroup, textContent, fontType, fontSize, textRGB, strokeType, strokeSize, strokeRGB, strokeQuality, smoothnessStrength)
```

*Parameters are pretty self-explanatory*. 

You can use custom fonts or native ones.

RGB parameters expect an object like {r=0.5,g=0.5,b=0.5}. 

StrokeType can be "hard", "smooth", or "linearSmooth". Choose the one which best suits your needs. 

If you use very big or very small font size, you should calibrate smoothnessStrenght accordingly,
Please know that this code uses several text layers to achieve strokes and shadows in Corona. If you have performance issues, try lowering strokeSize, smoothnessStrength or strokeQuality

**Compatible with Graphics 2.0**

Should also work with graphics 1.0 (do not forget in that case to use 0-255 values for RGBs instead of 0-1)

![alt tag](https://github.com/Rayjax/corona_text_engine/blob/master/example.png)

Have fun

(Collaboration is highly appreciated if you find this useful)
