package.path = package.path .. ';' .. './libs/lua_injectable/?.lua'
require 'src.globals'

-- app
local RootModule = require 'libs.lua_injectable.root_module'

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

