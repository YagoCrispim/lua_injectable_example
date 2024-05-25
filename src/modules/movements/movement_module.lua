local MovementService = require 'src.modules.movements.movement_service'
local Module = require 'libs.lua_injectable.module'

return Module({
    name = 'MovementModule',
    providers = {
        MovementService,
    }
})
