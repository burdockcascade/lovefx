local Node = require('lovefx.node')
local AudioPlayer = Node:extend()


function AudioPlayer:new(options)
    self.source = options.source
    AudioPlayer.super.new(self, options)
end

function AudioPlayer:play()

    if self.source == nil then
        error("sound file not provided")
    end
    
	love.audio.play(self.source)
	
end

return AudioPlayer