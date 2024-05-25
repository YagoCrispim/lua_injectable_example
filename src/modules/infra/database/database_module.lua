local Module = require 'libs.lua_injectable.module'
local DatabaseService = require 'src.modules.infra.database.database_service'

return Module({
    name = 'DatabaseModule',
    providers = {
        DatabaseService,
    }
})

