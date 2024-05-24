local MovementService = require 'src.modules.movements.movement_service'
local Module = require 'libs.cheese.module'

return Module({
    name = 'MovementModule',
    providers = {
        MovementService,
    }
})
