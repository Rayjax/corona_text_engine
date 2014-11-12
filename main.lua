
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
_textEngine:createTextWithStroke(385, 170, dg_Main, "brown", native.systemFont, 55, {r=0.7,g=0.3,b=0.1}, "hard", 5, {r=0,g=0,b=0}, 100, 100)
_textEngine:createTextWithStroke(500, 290, dg_Main, "FOX", native.systemFont, 85, {r=255,g=255,b=255}, "linearSmooth", 10, {r=1,g=0.2,b=0}, 100, 50)
_textEngine:createTextWithStroke(130, 360, dg_Main, "jumps", native.systemFont, 85, {r=1,g=1,b=1}, "linearSmooth", 10, {r=0,g=0,b=0}, 100, 30)
_textEngine:createTextWithStroke(430, 470, dg_Main, "over", native.systemFont, 155, {r=0,g=0,b=0}, "smooth", 10, {r=0,g=0.65,b=0}, 100, 100)
_textEngine:createTextWithShadow(290, 650, dg_Main, "the lazy", native.systemFont, 165, {r=0.4,g=0.4,b=0.4}, 12, 12, 1, {r=0,g=0,b=0}, 100, 100)
_textEngine:createTextWithStroke(315, 1020, dg_Main, "D O G", native.systemFont, 200, {r=0,g=0,b=0}, "hard", 18, {r=1,g=0.6,b=0}, 100, 100)
text = display.newText("dwdw d", 100, 100, native.systemFont, 50)