--print("01_background.lua loaded")



-- === G1000 Background ===
img_add_fullscreen("background.png")


-- === Display Softkeys ===
softkey_buttons = {}

for i = 1, 12 do
    local x = 400 + (i - 1) * 170  -- Customize to fit your layout
    local y = 1640

    -- Create a local copy of `i` to preserve its value
    local function make_handler(index)
        return function()
            highlight_softkey_flash(index)

            local mode_table = softkey_handlers[mode_fs]
            if mode_table then
                local handler = mode_table[index]
                if handler and type(handler) == "function" then
                    print("🔘 Softkey " .. index .. " pressed in mode: " .. mode_fs)
                    handler(index)
                else
                    print("No handler for softkey: " .. index .. " in mode: " .. mode_fs)
                end
            else
                print("No mode handler for: " .. mode_fs)
            end
        end
    end

    softkey_buttons[i] = button_add(
        "btn_arrow.png", "btn_arrow_pressed.png",
        x, y, 200, 200,
        make_handler(i)
    )
end

