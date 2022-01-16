require('lovefx.engine')

function App:onActive()

    local vbox = VBox()
    self.canvas:addChild(vbox)

        local header = Panel({color = Color("steelblue"), expandHeight = 2})
        vbox:addChild(header)

        local hbox = HBox({expandHeight = 8})
        vbox:addChild(hbox)

            hbox:addChild(Panel({color = Color("green")}))

            local vbox2 = VBox({expandWidth = 3})
            hbox:addChild(vbox2)

                vbox2:addChild(Panel({color = Color("brown")}))    
                vbox2:addChild(Panel({color = Color("red")}))    
                vbox2:addChild(Panel({color = Color("yellow")}))    
                vbox2:addChild(Panel({color = Color("chocolate")}))
                vbox2:addChild(Panel({color = Color("lime")}))

            hbox:addChild(Panel({color = Color("orange")}))

        local footer = HBox()
        vbox:addChild(footer)

            footer:addChild(Panel({color = Color("peru")}))
            footer:addChild(Panel({color = Color("tan")}))
            footer:addChild(Panel({color = Color("teal")}))
            footer:addChild(Panel({color = Color("violet")}))
            footer:addChild(Panel({color = Color("thistle")}))
            footer:addChild(Panel({color = Color("peru")}))
            footer:addChild(Panel({color = Color("indigo")}))
            footer:addChild(Panel({color = Color("teal")}))
            footer:addChild(Panel({color = Color("Gold")}))
            footer:addChild(Panel({color = Color("thistle")}))


end