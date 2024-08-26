local my_utility = require("my_utility/my_utility")

local menu_elements_bone = {
    main_boolean = checkbox:new(true, get_hash(my_utility.plugin_label .. "main_boolean")),
    mode = combo_box:new(0, get_hash(my_utility.plugin_label .. "mode_melee_range")),
    dash_cooldown = slider_int:new(0, 6, 6, get_hash(my_utility.plugin_label .. "dash_cooldown")),
    main_tree = tree_node:new(0),

    separator = function(self)
        if self.main_tree.separator then
            self.main_tree:separator()
        end
    end,

    -- Ajout de la fonction create_spell_submenu
    create_spell_submenu = function(submenu_name, spell_list)
        if menu_elements_bone.main_tree:push(submenu_name) then
            for _, spell in ipairs(spell_list) do
                if spells[spell] then
                    spells[spell]:render()
                else
                    print("Warning: Spell '" .. spell .. "' not found in spells table")
                end
            end
            menu_elements_bone.main_tree:pop()
        end
    end
}

return menu_elements_bone