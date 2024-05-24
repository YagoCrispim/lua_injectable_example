package.path = package.path .. ';' .. './libs/cheese/?.lua'

function Pprint(o, get_string)
    local result

    local function innerPprint(table)
        if type(table) == 'table' then
            local s = '{ '
            for k, v in pairs(table) do
                if type(k) ~= 'number' then k = '"' .. k .. '"' end
                s = s .. '[' .. k .. '] = ' .. innerPprint(v) .. ','
            end
            return s .. '} '
        else
            return tostring(table)
        end
    end

    result = innerPprint(o)
    if get_string then
        return result
    end
    print(result)
end
