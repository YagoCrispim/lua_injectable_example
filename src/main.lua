package.path = package.path .. ';' .. './libs/cheese/?.lua'
require 'src.globals'

-- cheese
local RootModule = require 'libs.cheese.root_module'

-- modules
local MovementModule = require 'src.modules.movements.movement_module'
local DatabaseModule = require 'src.modules.infra.database.database_module'

-- app
local app = require 'src.app'

return RootModule:new({
    name = 'AppModule',
    modules = {
        MovementModule,
        DatabaseModule,
    },
}).start(app)

