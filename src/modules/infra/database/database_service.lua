local New = require 'libs.cheese.new'
local Provider = require 'libs.cheese.provider'
local database = require 'src.modules.infra.database.database'

---@class DatabaseService
local DatabaseService = {
    __name = 'DatabaseService',
    _database = database,
}
DatabaseService.__index = DatabaseService

---@return DatabaseService
function DatabaseService:new()
    return New(DatabaseService)
end

---@param table_name string
---@param id string
---@return Movement | nil
function DatabaseService:get_by_id(table_name, id)
    ---@type Movement | nil
    local result = nil

    if not self._database[table_name] then
        return nil
    end

    for k, v in pairs(self._database[table_name]) do
        if k == id then
            result = v
            break
        end
    end

    return result
end

---@param table_name string
---@return Movement | nil
function DatabaseService:get_all(table_name)
    if not self._database[table_name] then
        return nil
    end
    return self._database[table_name]
end

---@generic T
---@param table_name string
---@param register T
---@return string | nil
function DatabaseService:create(table_name, register)
    if not self._database[table_name] then
        return nil
    end

    local id = tostring(math.random(1, 1000000))
    self._database[table_name][id] = register
    return id
end

---@param table_name string
---@param id string
---@return boolean
function DatabaseService:delete(table_name, id)
    local result = false

    if not self._database[table_name] then
        return result
    end

    for k, v in pairs(self._database[table_name]) do
        if k == id then
            result = true
            self._database[table_name][k] = nil
            break
        end
    end

    return result
end

return Provider(DatabaseService)
