require('lovefx.engine')

function App:onActive()
    
    local label = Label({x = 10, text = "Hello World"})
    self.scene:addChild(label)

end

