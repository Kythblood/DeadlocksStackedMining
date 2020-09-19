-- todo: fix old ore icons showing in Mining Depot for the recipes even if a mod like Deadlock Stacking for Vanilla is installed

-- todo: make sure that, should custom stacked icons exist, they are also used for items in case the support mod only adds the stacking support in data-final-fixes

-- todo: option to keep the sprites the same even for lower ore counts
    -- which variation of an animation is used for a resource depends on the amount of a resourceEntity
    -- because this mod loweres the amount when converting an ore to a stacked ore other variations get used
    -- this option would modify stage_counts to keep the variation of the animation the same


-- fix to make sure that the fluid_amount for angels infinite resources was correctly modified
    -- seems like no longer needed, because the issue is fixed by adding a dependency
--[[
if mods["angelsinfiniteores"] then

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

    for _, resource in pairs(data.raw["resource"]) do
        if string.find(resource.name, "stacked-infinite") then
            if resource.minable.required_fluid and resource.minable.fluid_amount and resource.minable.fluid_amount > 0 then
                resource.minable.fluid_amount = resource.minable.fluid_amount * stackSize
                log("Modify fluid_amount in data-final-fixes for " .. resource.name)
            end
        end
    end
end
]]--
