-- done: fix old ore icons showing in Mining Depot for the recipes even if a mod like Deadlock Stacking for Vanilla is installed

-- todo: make sure that, should custom stacked icons exist, they are also used for items even in case the support mod only adds the stacking support in data-final-fixes

-- todo: option to keep the sprites the same even for lower ore counts
    -- which variation of an animation is used for a resource depends on the amount of a resourceEntity
    -- because this mod loweres the amount when converting an ore to a stacked ore other variations get used
    -- this option would modify stage_counts to keep the variation of the animation the same

-- done: option to add an high pressure offshore pump + option to change 



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

-- Changes for Mining Drones
if mods["Mining_Drones"] then
    -- Fixed that outdated ore icons are used for the mining recipes of stacked ores in Mining Depots, even if a mod like Deadlock Stacking for Vanilla is installed (highly recommended)
    for _, name in pairs({"iron-ore", "copper-ore", "coal", "stone", "uranium-ore-with-sulfuric-acid"}) do
        if data.raw.recipe["mine-deadlock-stack-" .. name] and data.raw.item["deadlock-stack-" .. name] then
            data.raw.recipe["mine-deadlock-stack-" .. name].icon = data.raw.item["deadlock-stack-" .. name].dark_background_icon or data.raw.item["deadlock-stack-" .. name].icon
            data.raw.recipe["mine-deadlock-stack-" .. name].icons = data.raw.item["deadlock-stack-" .. name].dark_background_icons or data.raw.item["deadlock-stack-" .. name].icons
        end
    end

    if data.raw.recipe["mine-deadlock-stack-uranium-ore-with-sulfuric-acid"] and data.raw.item["deadlock-stack-uranium-ore"] then 
        data.raw.recipe["mine-deadlock-stack-uranium-ore-with-sulfuric-acid"].icon = data.raw.item["deadlock-stack-uranium-ore"].dark_background_icon or data.raw.item["deadlock-stack-uranium-ore"].icon
        data.raw.recipe["mine-deadlock-stack-uranium-ore-with-sulfuric-acid"].icons = data.raw.item["deadlock-stack-uranium-ore"].dark_background_icons or data.raw.item["deadlock-stack-uranium-ore"].icons
    end

    -- Recipes for mining stacked ores in Mining Depots are now sorted into their own subgroup
    data:extend(
    {
        {
            type = "item-subgroup",
            name = "mining-depot-stacked-mining",
            group = "production",
            order = "e"
        },
        {
            type = "item-subgroup",
            name = "mining-depot-stacked-mining-with-fluid",
            group = "production",
            order = "f"
        }
    })

    for _, recipe in pairs(data.raw["recipe"]) do
        if recipe.category == "mining-depot" and recipe.order and string.sub(recipe.order, 1, string.len("stacked-")) == "stacked-" and recipe.subgroup then
            if recipe.subgroup == "extraction-machine" then
                recipe.subgroup = "mining-depot-stacked-mining"
            elseif recipe.subgroup == "smelting-machine" then
                recipe.subgroup = "mining-depot-stacked-mining-with-fluid"
            end
        end
    end

end

