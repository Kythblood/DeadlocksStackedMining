# Deadlock's Stacked Mining
Don't you find it annoying that you have to mine ores, transport them with countless belts to Stacking Beltboxes and compress them down to their stacked version. Why not mine stacks of them directly, without the intermediate steps?

# Features
*   This mod adds a Stacked mining planner that allows you to mark ores to be mined directly as their stacked version.
*   To unlock Stacked mining planner, research the technology "Stacked Ore Mining Technology".  
![alt text](https://i.imgur.com/9Bt85QG.jpg "Stacked Ore Mining Technology")
*   The research unlocks a new shortcut in your shortcut bar (default controls: ALT + M).  
![alt text](https://i.imgur.com/B5571GF.jpg "Stacked Mining Shortcut")
*   Use the Stacked mining planner like a deconstruction planner and drag it over the ores you want to mark. 
*   The ores marked for stacked mining will have an increased mining time and decreased amount depending on your settings in the mod Deadlock's Stacking Beltboxes & Compact Loaders.  
![alt text](https://i.imgur.com/gy2D8WZ.jpg "Stacked Ore")
*   The total yield and (unstacked) items / second of an ore patch remain unchanged.
*   To reverse the marking of an ore patch, use the Stacked mining planner + SHIFT (like a deconstruction planner).
*   To destroy the Stacked mining planner item in your inventory, drop it on the ground and it will disappear.
*   Increases the fluid capacity of miners if required depending on the selected stack size in the settings to (see changelog).

# UPS
*   The second reason besides convenience why I created this mod is that it saves you UPS, meaning your game can run faster.
*   Setup: 30000 Miners with speed modules and Mining Productivity 50
*   Test 1: 140 UPS   Normal mining, direct insertion with beltboxes  
![alt text](https://i.imgur.com/xSNJSVT.jpg "140 UPS with 30000 miners total with this setup")
*   Test 2: 155 UPS   Normal mining, direct insertion without beltboxes  
![alt text](https://i.imgur.com/AALtl9E.jpg "155 UPS with 30000 miners total with this setup")
*   Test 3: 280 UPS   Exact same setup as test 2 but with Stacked Mining
*   If belts are used to transport the ore to the beltboxes (like you would in most cases during normal game-play) then the UPS improvement can be over 400% and more with high stack size settings, depending on the distance of the belts, because you reduce the number of entities you need to get the same output of stacked ore drastically.
*   Another advantage of mining stacked ore is that in factorio the items / second is capped at 60 (max 1 craft per tick). With high levels of mining productivity research you would eventually reach a cap (especially if you play with modded miners/modules). With stacked ore mining it takes a LOT longer to reach this cap.

# Known Issues
*   Once you have researched the Stacked mining planner for the first time, it stacks unlocked. That is because the unlock status of shortcuts is stored in player-data.json, and is thus persistent across all save-games.
*   If you notice some debug code in your factorio-current.log, just ignore it. It has no influence on the game. It will be removed as soon as I am sure that the mod runs without any bugs.
# Mod support & Compatibility
*   Compatible with Mining Drones and should work with all other mods that add higher tier / different miners 
*   Support for all modded ores (resources of the category "basic-solid") and Imersite from Krastorio 2.
*   Tested for Krastorio 2, Bob's Ores and Angel's Refining. Let me know if you come across any bugs/issues.
*   A stacked version of all mining results of the modded ores is created even if no add-on is installed that adds support for these ores, meaning this mod can be used without any other add-on that adds stacking support for the respective mods.
They work perfectly fine. However, this mod uses a function from [Deadlock's Stacking Beltboxes & Compact Loaders](https://mods.factorio.com/mod/deadlock-beltboxes-loaders) to generate the icons and does not include any stacked icons, because the graphics of some mods might be protected by a license. Use other add-ons that add support including graphics for the respective mods to improve performance.
![alt text](https://i.imgur.com/tuBhn4I.jpg "Krastorio 2 Rare Metals & Bobs Ores, with electric mining drill 2 and 3")


# Credits
This mod is an add-on for [Deadlock's Stacking Beltboxes & Compact Loaders](https://mods.factorio.com/mod/deadlock-beltboxes-loaders) by [shanemadden](https://mods.factorio.com/user/shanemadden) and [Deadlock](https://mods.factorio.com/user/deadlock989). It is not related to Deadlock in any other way.
The code was created by me and graphics are based on vanilla icons and edited by me.
Thank you [billbo99](https://mods.factorio.com/user/billbo99) for the advice.
The thumbnail contains a beltbox icon by [Deadlock](https://mods.factorio.com/user/deadlock989) and stacked ore icons from [Deadlock Stacking for Vanilla](https://mods.factorio.com/mod/deadlock-beltboxes-loaders) by [billbo99](https://mods.factorio.com/user/billbo99).
As you might have noticed, English is not my first language, nor is it my second. If you notice any big mistakes, let me know. 
