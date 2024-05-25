local New = require 'libs.lua_injectable.new'
local MovementService = require 'src.modules.movements.movement_service'
local Movement = require 'src.domain.movement'

-- Example app
return function()
    ---@return Impl
    local Impl = function()
        return New({
            _movement_service = MovementService,

            get_movement = function(self, id)
                return self._movement_service:get_movement(id)
            end,

            get_movements = function(self)
                return self._movement_service:get_movements()
            end,

            create_movement = function(self, register)
                local movement = Movement:new(register)
                return self._movement_service:create_movement(movement)
            end,

            update_movement = function(self, id, register)
                return self._movement_service:update_movement(id, register)
            end,

            delete_movement = function(self, id)
                return self._movement_service:delete_movement(id)
            end
        } --[[ @as Impl ]])
    end

    local impl = Impl()
    local id = impl:create_movement({
        name = 'Movement name',
        type = 'in',
        value = 1000.00
    }) or ''

    -- create
    print('\n--- Create ---')
    local val = impl:get_movement(id) or {}
    print(id .. ' --> ' .. Pprint(val, true))

    -- update
    print('\n--- Update ---')
    val.name = 'Updated movement name'
    impl:update_movement(id, val)
    local updated_value = impl:get_movement(id)
    print(id .. ' --> ' .. Pprint(updated_value, true))

    -- delete
    print('\n--- Delete ---')
    impl:delete_movement(id)
    local deleted_value = impl:get_movement(id)
    print(id .. ' --> ' .. Pprint(deleted_value, true))
end

--

---@class Impl
---@field _movement_service MovementService
---@field get_movement fun(self: Impl, id: string): Movement | nil
---@field get_movements fun(self: Impl): Movement[] | nil
---@field create_movement fun(self: Impl, register: Movement): string | nil
---@field update_movement fun(self: Impl, id: string, register: Movement): boolean
---@field delete_movement fun(self: Impl, id: string): boolean
