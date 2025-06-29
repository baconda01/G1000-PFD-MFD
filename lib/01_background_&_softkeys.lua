--print("01_background.lua loaded")



-- === G1000 Background ===
img_add_fullscreen("background.png")


-- === Display Softkeys ===
softkey_buttons = {}

for i = 1, 12 do
    local x = 400 + (i - 1) * 170  -- Customize to fit your layout
    local y = 1640

    softkey_buttons[i] = button_add(
        "btn_arrow.png", "btn_arrow_pressed.png",
        x, y, 200, 200,
        
    function()
        highlight_softkey_flash(i)  -- Flash first for immediate feedback
        if softkey_handlers[mode_fs] and softkey_handlers[mode_fs][i] then
            softkey_handlers[mode_fs][i]()  -- Then run logic
        end
    end
    )
end
















