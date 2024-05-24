local Module = require 'libs.cheese.module'
local DatabaseService = require 'src.modules.infra.database.database_service'

return Module({
    name = 'DatabaseModule',
    providers = {
        DatabaseService,
    }
})

