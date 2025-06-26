print("02_mode_buttons.lua loaded")


-- === PFD_Only Mode Button ===
button_add(
    "PFD_Only.png",  -- Image (can use same for up/down)
    "PFD_Only.png",
    540, 200,        -- x, y position (center top-left of screen)
    550, 390,        -- width, height
    function()
        mode_fs = "PFD_Only"
        set_page(PFD_Only_current_page or 1)
        update_mode_labels()
        prt_console()
    end
)

-- === PFD Mode Button ===
button_add(
    "btn_pfd.png",
    "btn_pfd.png",
    1240, 200,    -- Adjust x/y as needed for layout
    600, 390,
    function()
        mode_fs = "PFD"
        set_page(PFD_current_page or 1)
        update_mode_labels()
        prt_console()
    end
)

-- === MFD Mode Button ===
button_add(
    "btn_mfd.png",
    "btn_mfd.png",
    --1410, 200,    -- Place next to PFD button
    1850, 200,
    550, 390,
    function()
        mode_fs = "MFD"
        set_page(MFD_current_page or 1)
        update_mode_labels()
        prt_console()
    end
)

