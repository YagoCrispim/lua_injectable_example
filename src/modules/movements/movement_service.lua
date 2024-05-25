local Provider = require 'libs.lua_injectable.provider'
local New = require 'libs.lua_injectable.new'
local DatabaseService = require 'src.modules.infra.database.database_service'

---@class MovementService
local MovementService = {
    __name = 'MovementService',
    _table_name = 'movements',
    _database_service = DatabaseService
}
MovementService.__index = MovementService

---@return MovementService
function MovementService:new()
    return New(MovementService)
end

---@param id string
---@return Movement | nil
function MovementService:get_movement(id)
    return self._database_service:get_by_id(
        self._table_name,
        id
    )
end

---@return Movement[] | nil
function MovementService:get_movements()
    return self._database_service:get_all(
        self._table_name
    )
end

---@param movement Movement
function MovementService:create_movement(movement)
    return self._database_service:create(
        self._table_name,
        movement
    )
end

---@param id string
---@param movement Movement
---@return boolean
function MovementService:update_movement(id, movement)
    local result = self._database_service:create(
        self._table_name,
        movement
    )
    if result then
        return true
    else
        return false
    end
end

---@param id string
---@return boolean
function MovementService:delete_movement(id)
    return self._database_service:delete(
        self._table_name,
        id
    )
end

return Provider(MovementService)

--

---@class MovementService
---@field __name string
---@field _table_name string
---@field _database_service DatabaseService
---@field get_movement fun(self: MovementService, id: string): nil
---@field get_movements fun(self: MovementService): Movement[] | nil
---@field create_movement fun(self: MovementService, movement: Movement): string | nil
---@field update_movement fun(self: MovementService, id: string, movement: Movement): boolean
---@field delete_movement fun(self: MovementService, id: string): boolean
