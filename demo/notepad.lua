require('lovefx.engine')

function App:onActive()

    love.graphics.setBackgroundColor(Color("grey")) --set the background color to a nice blue


    -- frame
    local frame = VBox()
    self.canvas:addChild(frame)

    -- menubar
    local menubar = HBox()
    frame:addChild(menubar)

    local button1 = Button({text = "File"})
    menubar:addChild(button1)

    local button2 = Button({text = "Edit"})
    menubar:addChild(button2)

    local button3 = Button({text = "Help"})
    menubar:addChild(button3)    

    -- middle panes
    local textbox = InputBox({expandWidth = 1, expandHeight = 1})
    frame:addChild(textbox)
    


    -- self:addChild(Debug({graphics = true, nodes = true, color = Color.Black}))

end
