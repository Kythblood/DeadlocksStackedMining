-- safely get the value of a setting 
local function getSettingValue(optionName)
    if settings["startup"] and settings["startup"][optionName] and settings["startup"][optionName].value then
		return settings["startup"][optionName].value
    end
    return false
end

-- get the stack size from Deadlock's Stacking settings or from this mod if the option is enabled
local stackSize
if getSettingValue("kyth-overwrite-deadlock-stack-size") == "disabled" then
    stackSize =  tonumber(getSettingValue("deadlock-stack-size"))
else 
    stackSize = tonumber(getSettingValue("kyth-overwrite-deadlock-stack-size"))
end

---------------------------------------------------------------------------------------------------

-- check if the stacked version of the item with the given name exists and in case it does not, create it
    -- returns true when an item was created or if it already exists, otherwise false
local function createStackedVersion(name)
    if data.raw["item"][name] then 
        if data.raw["item"]["deadlock-stack-" .. name] then
            return true
        else
            deadlock.add_stack(name)
            log("Created stacked version of the item " .. name .. ", because it was missing. It is advised to install a mod that adds support for the mod that this item is from in case you did not already")
            return true
        end
    else
        log("Error in createStackedVersion(): the item " .. name .. " does not exist")
        return false
    end
end

-- create a stacked version of the ResourceEntity with the given oreName
local function createStackedOre(oreName)

    local stackedName = "stacked-" .. oreName
    local ore = table.deepcopy(data.raw["resource"][oreName])

    -- generate a dynamic localized name for the stacked version of the ore
    ore.localised_name = {"entity-name.stacked-ore",{"entity-name." .. oreName}}
    
    -- replace every result of minable with their stacked version
    if ore.minable.results then
        local tempResults = {}
        for _, result in pairs(ore.minable.results) do
            if result.name then
                if createStackedVersion(result.name) then
                    result.name = "deadlock-stack-" .. result.name
                    table.insert(tempResults, result)
                else
                    log("Error in createStackedOre() for " .. result.name)
                end
            elseif result[1] then
                if createStackedVersion(result[1]) then
                    result[1] = "deadlock-stack-" .. result[1]
                    table.insert(tempResults, result)
                else
                    log("Error in createStackedOre() for " .. result[1] .. " with [1]")
                end
            else
                log("Something went wrong during the replacing of minable.results")
                break   -- probably not necessary?
            end
        end
        ore.minable.results = tempResults
    elseif ore.minable.result then        
        if createStackedVersion(ore.minable.result) then
            ore.minable.results = 
            {{
                amount_max = ore.minable.count or 1,
                amount_min = ore.minable.count or 1,
                name = "deadlock-stack-" .. ore.minable.result,
                probability = 1,
                type = "item"
            }}
            ore.minable.result=nil
            ore.minable.count=nil
        else 
            log("Error in createStackedOre() for " .. result.name)
        end
    end

    ore.name = stackedName

    -- adjust the amount of fluid required for mining (to keep it the same overall)
    if ore.minable.required_fluid and ore.minable.fluid_amount and ore.minable.fluid_amount > 0 then
        ore.minable.fluid_amount = ore.minable.fluid_amount * stackSize
    end
    -- same for mining time
    ore.minable.mining_time = ore.minable.mining_time * stackSize

    -- the ore should never occur naturally
    ore.autoplace = nil
    
    -- if the ore is infinite, increase the infinite_depletion_amount accordingly
    if ore.infinite then 
        ore.infinite_depletion_amount = (ore.infinite_depletion_amount or 1) * stackSize
    end

	return ore
end

---------------------------------------------------------------------------------------------------

-- try to create stacked versions for all resources in the resource table
local resourceTable = {}
for _, resource in pairs(data.raw["resource"]) do
    if resource.category == nil or resource.category == "basic-solid" or resource.category == "kr-quarry" then   
        -- check if nil because in that case at the end of the data stage the value would be set to the default, which is "basic-solid"
        table.insert(resourceTable, createStackedOre(resource.name))
        log("Sucessfully created the ResourceEntity for the stacked ore version of " .. resource.name)
    elseif resource.category == "basic-fluid" then
        -- to-do: Support for Pressurized fluids for resource of the category basic-fluid like oil etc.
        log("The resource " .. resource.name .. " is of the category basic-fluid and therefore skipped. Support for Pressurized fluids is planned (hopefully coming soon)")
    else 
        log("Skipping the resource " .. resource.name .. " because it is neither basic-solid, kr-quarry nor basic-fluid. Feel free to contact the mod author if you feel like the resource " .. resource.name .. " should be supported")
    end
end

for _,resource in pairs(resourceTable) do
    data:extend({resource})
end