--print("01_background.lua loaded")



-- === G1000 Background ===
img_add_fullscreen("background.png")

-- === Softkey 1 ===
softkey_btn_1 = button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    400, 1640, 200, 200,
    function()
        if mode_fs == "PFD_Only" then
            handle_softkey_1_pfd_only()
        elseif mode_fs == "PFD" then
            handle_softkey_1_pfd()
        elseif mode_fs == "MFD" then
            handle_softkey_1_mfd()
        end
    end
)
-- === Softkey 2 ===
softkey_btn_2 = button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    572, 1640, 200, 200,
    function()
        if mode_fs == "PFD_Only" then
            handle_softkey_2_pfd_only()
        elseif mode_fs == "PFD" then
            handle_softkey_2_pfd()
        elseif mode_fs == "MFD" then
            handle_softkey_2_mfd()
        end
    end
)
-- === Softkey 3 ===
softkey_btn_3 = button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    742, 1640, 200, 200,
    function()
        if mode_fs == "PFD_Only" then
            handle_softkey_3_pfd_only()
        elseif mode_fs == "PFD" then
            handle_softkey_3_pfd()
        elseif mode_fs == "MFD" then
            handle_softkey_3_mfd()
        end
    end
)
-- === Softkey 4 ===
softkey_btn_4 = button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    912, 1640, 200, 200,
    function()
        if mode_fs == "PFD_Only" then
            handle_softkey_4_pfd_only()
        elseif mode_fs == "PFD" then
            handle_softkey_4_pfd()
        elseif mode_fs == "MFD" then
            handle_softkey_4_mfd()
        end
    end
)
-- === Softkey 5 ===
softkey_btn_5 = button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1082, 1640, 200, 200,
    function()
        if mode_fs == "PFD_Only" then
            handle_softkey_5_pfd_only()
        elseif mode_fs == "PFD" then
            handle_softkey_5_pfd()
        elseif mode_fs == "MFD" then
            handle_softkey_5_mfd()
        end
    end
)
-- === Softkey 6 ===
softkey_btn_6 = button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1252, 1640, 200, 200,
    function()
        if mode_fs == "PFD_Only" then
            handle_softkey_6_pfd_only()
        elseif mode_fs == "PFD" then
            handle_softkey_6_pfd()
        elseif mode_fs == "MFD" then
            handle_softkey_6_mfd()
        end
    end
)
-- === Softkey 7 ===
softkey_btn_7 = button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1422, 1640, 200, 200,
    function()
        if mode_fs == "PFD_Only" then
            handle_softkey_7_pfd_only()
        elseif mode_fs == "PFD" then
            handle_softkey_7_pfd()
        elseif mode_fs == "MFD" then
            handle_softkey_7_mfd()
        end
    end
)
-- === Softkey 8 ===
softkey_btn_8 = button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1592, 1640, 200, 200,
    function()
        if mode_fs == "PFD_Only" then
            handle_softkey_8_pfd_only()
        elseif mode_fs == "PFD" then
            handle_softkey_8_pfd()
        elseif mode_fs == "MFD" then
            handle_softkey_8_mfd()
        end
    end
)
-- === Softkey 9 ===
softkey_btn_9 = button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1762, 1640, 200, 200,
    function()
        if mode_fs == "PFD_Only" then
            handle_softkey_9_pfd_only()
        elseif mode_fs == "PFD" then
            handle_softkey_9_pfd()
        elseif mode_fs == "MFD" then
            handle_softkey_9_mfd()
        end
    end
)
-- === Softkey 10 ===
softkey_btn_10 = button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1932, 1640, 200, 200,
    function()
        if mode_fs == "PFD_Only" then
            handle_softkey_10_pfd_only()
        elseif mode_fs == "PFD" then
            handle_softkey_10_pfd()
        elseif mode_fs == "MFD" then
            handle_softkey_10_mfd()
        end
    end
)
-- === Softkey 11 ===
softkey_btn_11 = button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
        2102, 1640, 200, 200,
    function()
        if mode_fs == "PFD_Only" then
            handle_softkey_11_pfd_only()
        elseif mode_fs == "PFD" then
            handle_softkey_11_pfd()
        elseif mode_fs == "MFD" then
            handle_softkey_11_mfd()
        end
    end
)
-- === Softkey 12 ===
softkey_btn_12 = button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
        2272, 1640, 200, 200,
    function()
        if mode_fs == "PFD_Only" then
            handle_softkey_12_pfd_only()
        elseif mode_fs == "PFD" then
            handle_softkey_12_pfd()
        elseif mode_fs == "MFD" then
            handle_softkey_12_mfd()
        end
    end
)














