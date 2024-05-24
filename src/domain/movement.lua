---@class Movement
local Movement = {}
Movement.__index = Movement

---@param values Movement
---@return Movement
function Movement:new(values)
    return setmetatable(values, Movement)
end

return Movement

--

---@class Movement
---@field type 'in' | 'out'
---@field value number
---@field name string

