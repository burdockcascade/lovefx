--CSS colors to RGB for LÖVE
--By Malmodev
-- https://github.com/malmodev/love2d-css-colors

--[[

    MIT License

    Copyright (c) 2020 m4ccas
    Copyright (c) 2022 Peter Richmond

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "SOFTWARE"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.

]]

function Color(color, alpha)

    color = color or "White"
    color = string.upper(color)
    alpha = alpha or 1 --alpha channel
  
    if color == "ALICEBLUE"
    then return {240/255, 248/255, 255/255, alpha}
  
  elseif color == "ANTIQUEWHITE"
    then return {250/255, 235/255, 215/255, alpha}
  
  elseif color == "AQUA"
    then return {0/255, 255/255, 255/255, alpha}
  
  elseif color == "AQUAMARINE"
    then return {127/255, 255/255, 212/255, alpha}
  
  elseif color == "AZURE"
    then return {240/255, 255/255, 255/255, alpha}
  
  elseif color == "BEIGE"
    then return {245/255, 245/255, 220/255, alpha}
  
  elseif color == "BISQUE"
    then return {255/255, 228/255, 196/255, alpha}
  
  elseif color == "BLACK"
    then return {0/255, 0/255, 0/255, alpha}
  
  elseif color == "BLANCHEDALMOND"
    then return {255/255, 235/255, 205/255, alpha}
  
  elseif color == "BLUE"
    then return {0/255, 0/255, 255/255, alpha}
  
  elseif color == "BLUEVIOLET"
    then return {138/255, 43/255, 226/255, alpha}
  
  elseif color == "BROWN"
    then return {165/255, 42/255, 42/255, alpha}
  
  elseif color == "BURLYWOOD"
    then return {222/255, 184/255, 135/255, alpha}
  
  elseif color == "CADETBLUE"
    then return {95/255, 158/255, 160/255, alpha}
  
  elseif color == "CHARTREUSE"
    then return {127/255, 255/255, 0/255, alpha}
  
  elseif color == "CHOCOLATE"
    then return {210/255, 105/255, 30/255, alpha}
  
  elseif color == "CORAL"
    then return {255/255, 127/255, 80/255, alpha}
  
  elseif color == "CORNFLOWERBLUE"
    then return {100/255, 149/255, 237/255, alpha}
  
  elseif color == "CORNSILK"
    then return {255/255, 248/255, 220/255, alpha}
  
  elseif color == "CRIMSON"
    then return {220/255, 20/255, 60/255, alpha}
  
  elseif color == "CYAN"
    then return {0/255, 255/255, 255/255, alpha}
  
  elseif color == "DARKBLUE"
    then return {0/255, 0/255, 139/255, alpha}
  
  elseif color == "DARKCYAN"
    then return {0/255, 139/255, 139/255, alpha}
  
  elseif color == "DARKGOLDENROD"
    then return {184/255, 134/255, 11/255, alpha}
  
  elseif color == "DARKGRAY" or color == "DARKGREY"
    then return {169/255, 169/255, 169/255, alpha}
  
  elseif color == "DARKGREEN"
    then return {0/255, 100/255, 0/255, alpha}
  
  elseif color == "DARKKHAKI"
    then return {189/255, 183/255, 107/255, alpha}
  
  elseif color == "DARKOLIVEGREEN"
    then return {85/255, 107/255, 47/255, alpha}
  
  elseif color == "DARKORANGE"
    then return {255/255, 140/255, 0/255, alpha}
  
  elseif color == "DARKORCHID"
    then return {153/255, 50/255, 204/255, alpha}
  
  elseif color == "DARKRED"
    then return {139/255, 0/255, 0/255, alpha}
  
  elseif color == "DARKSALMON"
    then return {233/255, 150/255, 122/255, alpha}
  
  elseif color == "DARKSEAGREEN"
    then return {143/255, 188/255, 143/255, alpha}
  
  elseif color == "DARKSLATEBLUE"
    then return {72/255, 61/255, 139/255, alpha}
  
  elseif color == "DARKSLATEGRAY" or color == "DARKSLATEGREY"
    then return {47/255, 79/255, 79/255, alpha}
  
  elseif color == "DARKTURQUOISE"
    then return {0/255, 206/255, 209/255, alpha}
  
  elseif color == "DARKVIOLET"
    then return {148/255, 0/255, 211/255, alpha}
  
  elseif color == "DEEPPINK"
    then return {255/255, 20/255, 147/255, alpha}
  
  elseif color == "DEEPSKYBLUE"
    then return {0/255, 191/255, 255/255, alpha}
  
  elseif color == "DIMGRAY" or color == "DIMGREY"
    then return {105/255, 105/255, 105/255, alpha}
  
  elseif color == "DODGERBLUE"
    then return {30/255, 144/255, 255/255, alpha}
  
  elseif color == "FIREBRICK"
    then return {178/255, 34/255, 34/255, alpha}
  
  elseif color == "FLORALWHITE"
    then return {255/255, 250/255, 240/255, alpha}
  
  elseif color == "FORESTGREEN"
    then return {34/255, 139/255, 34/255, alpha}
  
  elseif color == "FUCHSIA"
    then return {255/255, 0/255, 255/255, alpha}
  
  elseif color == "GAINSBORO"
    then return {220/255, 220/255, 220/255, alpha}
  
  elseif color == "GHOSTWHITE"
    then return {248/255, 248/255, 255/255, alpha}
  
  elseif color == "GOLD"
    then return {255/255, 215/255, 0/255, alpha}
  
  elseif color == "GOLDENROD"
    then return {218/255, 165/255, 32/255, alpha}
  
  elseif color == "GRAY" or color == "GREY"
    then return {128/255, 128/255, 128/255, alpha}
  
  elseif color == "GREEN"
    then return {0/255, 128/255, 0/255, alpha}
  
  elseif color == "GREENYELLOW"
    then return {173/255, 255/255, 47/255, alpha}
  
  elseif color == "HONEYDEW"
    then return {240/255, 255/255, 240/255, alpha}
  
  elseif color == "HOTPINK"
    then return {255/255, 105/255, 180/255, alpha}
  
  elseif color == "INDIANRED"
    then return {205/255, 92/255, 92/255, alpha}
  
  elseif color == "INDIGO"
    then return {75/255, 0/255, 130/255, alpha}
  
  elseif color == "IVORY"
    then return {255/255, 255/255, 240/255, alpha}
  
  elseif color == "KHAKI"
    then return {240/255, 230/255, 140/255, alpha}
  
  elseif color == "LAVENDER"
    then return {230/255, 230/255, 250/255, alpha}
  
  elseif color == "LAVENDERBLUSH"
    then return {255/255, 240/255, 245/255, alpha}
  
  elseif color == "LAWNGREEN"
    then return {124/255, 252/255, 0/255, alpha}
  
  elseif color == "LEMONCHIFFON"
    then return {255/255, 250/255, 205/255, alpha}
  
  elseif color == "LIGHTBLUE"
    then return {173/255, 216/255, 230/255, alpha}
  
  elseif color == "LIGHTCORAL"
    then return {224/255, 255/255, 255/255, alpha}
  
  elseif color == "LIGHTGOLDENRODYELLOW"
    then return {250/255, 250/255, 210/255, alpha}
  
  elseif color == "LIGHTGRAY" or color == "LIGHTGREY"
    then return {211/255, 211/255, 211/255, alpha}
  
  elseif color == "LIGHTGREEN"
    then return {144/255, 238/255, 144/255, alpha}
  
  elseif color == "LIGHTPINK"
    then return {255/255, 182/255, 193/255, alpha}
  
  elseif color == "LIGHTSALMON"
    then return {255/255, 160/255, 122/255, alpha}
  
  elseif color == "LIGHTSEAGREEN"
    then return {32/255, 178/255, 170/255, alpha}
  
  elseif color == "LIGHTSKYBLUE"
    then return {135/255, 206/255, 250/255, alpha}
  
  elseif color == "LIGHTSLATEGRAY" or color == "LIGHTSLATEGREY"
    then return {119/255, 136/255, 153/255, alpha}
  
  elseif color == "LIGHTSTEELBLUE"
    then return {176/255, 196/255, 222/255, alpha}
  
  elseif color == "LIGHTYELLOW"
    then return {255/255, 255/255, 224/255, alpha}
  
  elseif color == "LIME"
    then return {0/255, 255/255, 0/255, alpha}
  
  elseif color == "LIMEGREEN"
    then return {50/255, 205/255, 50/255, alpha}
  
  elseif color == "LINEN"
    then return {250/255, 240/255, 230/255, alpha}
  
  elseif color == "MAGENTA"
    then return {255/255, 0/255, 255/255, alpha}
  
  elseif color == "MAROON"
    then return {128/255, 0/255, 0/255, alpha}
  
  elseif color == "MEDIUMAQUAMARINE"
    then return {102/255, 205/255, 170/255, alpha}
  
  elseif color == "MEDIUMBLUE"
    then return {0/255, 0/255, 205/255, alpha}
  
  elseif color == "MEDIUMORCHID"
    then return {186/255, 85/255, 211/255, alpha}
  
  elseif color == "MEDIUMPURPLE"
    then return {147/255, 112/255, 219/255, alpha}
  
  elseif color == "MEDIUMSEAGREEN"
    then return {60/255, 179/255, 113/255, alpha}
  
  elseif color == "MEDIUMSLATEBLUE"
    then return {123/255, 104/255, 238/255, alpha}
  
  elseif color == "MEDIUMSPRINGGREEN"
    then return {0/255, 250/255, 154/255, alpha}
  
  elseif color == "MEDIUMTURQUOISE"
    then return {72/255, 209/255, 204/255, alpha}
  
  elseif color == "MEDIUMVIOLETRED"
    then return {199/255, 21/255, 133/255, alpha}
  
  elseif color == "MIDNIGHTBLUE"
    then return {25/255, 25/255, 112/255, alpha}
  
  elseif color == "MINTCREAM"
    then return {245/255, 255/255, 250/255, alpha}
  
  elseif color == "MISTYROSE"
    then return {255/255, 228/255, 225/255, alpha}
  
  elseif color == "MOCCASIN"
    then return {255/255, 228/255, 181/255, alpha}
  
  elseif color == "NAVAJOWHITE"
    then return {255/255, 222/255, 173/255, alpha}
  
  elseif color == "NAVY"
    then return {0/255, 0/255, 128/255, alpha}
  
  elseif color == "OLDLACE"
    then return {253/255, 245/255, 230/255, alpha}
  
  elseif color == "OLIVE"
    then return {128/255, 128/255, 0/255, alpha}
  
  elseif color == "OLIVEDRAB"
    then return {107/255, 142/255, 35/255, alpha}
  
  elseif color == "ORANGE"
    then return {255/255, 165/255, 0/255, alpha}
  
  elseif color == "ORANGERED"
    then return {255/255, 69/255, 0/255, alpha}
  
  elseif color == "ORCHID"
    then return {218/255, 112/255, 214/255, alpha}
  
  elseif color == "PALEGOLDENROD"
    then return {238/255, 232/255, 170/255, alpha}
  
  elseif color == "PALEGREEN"
    then return {152/255, 251/255, 152/255, alpha}
  
  elseif color == "PALETURQUOISE"
    then return {175/255, 238/255, 238/255, alpha}
  
  elseif color == "PALEVIOLETRED"
    then return {219/255, 112/255, 147/255, alpha}
  
  elseif color == "PAPAYAWHIP"
    then return {255/255, 239/255, 213/255, alpha}
  
  elseif color == "PEACHPUFF"
    then return {255/255, 218/255, 185/255, alpha}
  
  elseif color == "PERU"
    then return {205/255, 133/255, 63/255, alpha}
  
  elseif color == "PINK"
    then return {255/255, 192/255, 203/255, alpha}
  
  elseif color == "PLUM"
    then return {221/255, 160/255, 221/255, alpha}
  
  elseif color == "POWDERBLUE"
    then return {176/255, 224/255, 230/255, alpha}
  
  elseif color == "PURPLE"
    then return {128/255, 0/255, 128/255, alpha}
  
  elseif color == "REBECCAPURPLE"
    then return {102/255, 51/255, 153/255, alpha}
  
  elseif color == "RED"
    then return {255/255, 0/255, 0/255, alpha}
  
  elseif color == "ROSYBROWN"
    then return {188/255, 143/255, 143/255, alpha}
  
  elseif color == "ROYALBLUE"
    then return {65/255, 105/255, 225/255, alpha}
  
  elseif color == "SADDLEBROWN"
    then return {139/255, 69/255, 19/255, alpha}
  
  elseif color == "SALMON"
    then return {250/255, 128/255, 114/255, alpha}
  
  elseif color == "SANDYBROWN"
    then return {244/255, 164/255, 96/255, alpha}
  
  elseif color == "SEAGREEN"
    then return {46/255, 139/255, 87/255, alpha}
  
  elseif color == "SEASHELL"
    then return {255/255, 245/255, 238/255, alpha}
  
  elseif color == "SIENNA"
    then return {160/255, 82/255, 45/255, alpha}
  
  elseif color == "SILVER"
    then return {192/255, 192/255, 192/255, alpha}
  
  elseif color == "SKYBLUE"
    then return {135/255, 206/255, 235/255, alpha}
  
  elseif color == "SLATEBLUE"
    then return {106/255, 90/255, 205/255, alpha}
  
  elseif color == "SLATEGRAY" or color == "SLATEGREY"
    then return {112/255, 128/255, 144/255, alpha}
  
  elseif color == "SNOW"
    then return {255/255, 250/255, 250/255, alpha}
  
  elseif color == "SPRINGGREEN"
    then return {0/255, 255/255, 127/255, alpha}
  
  elseif color == "STEELBLUE"
    then return {70/255, 130/255, 180/255, alpha}
  
  elseif color == "TAN"
    then return {210/255, 180/255, 140/255, alpha}
  
  elseif color == "TEAL"
    then return {0/255, 128/255, 128/255, alpha}
  
  elseif color == "THISTLE"
    then return {216/255, 191/255, 216/255, alpha}
  
  elseif color == "TOMATO"
    then return {255/255, 99/255, 71/255, alpha}
  
  elseif color == "TURQUOISE"
    then return {64/255, 224/255, 208/255, alpha}
  
  elseif color == "VIOLET"
    then return {238/255, 130/255, 238/255, alpha}
  
  elseif color == "WHEAT"
    then return {245/255, 222/255, 179/255, alpha}
  
  elseif color == "WHITE"
    then return {255/255, 255/255, 255/255, alpha}
  
  elseif color == "WHITESMOKE"
    then return {245/255, 245/255, 245/255, alpha}
  
  elseif color == "YELLOW"
    then return {255/255, 255/255, 0/255, alpha}
  
  elseif color == "YELLOWGREEN"
    then return {154/255, 205/255, 50/255, alpha}
  
  end
  
end

return Color