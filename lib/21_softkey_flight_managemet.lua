--print("21_softkey_flight_managemet.lua loaded")

-- === Flight Managdment Key === ====================================================================

-- Globals ------------------------------------
group_btn_ap =
    group_add(
    button_ap,
    button_hdg,
    button_nav,
    button_apr,
    button_vs,
    button_flc,
    button_fd,
    button_alt,
    button_vnv,
    button_bc,
    button_nosup,
    button_nosdn
)
--visible(group_btn_ap, user_prop_get(prop_ap))


-- === Left Column === ===================================================
-- Softkey DIRECT TO --------------------------------
button_add(
    "btn_direct.png",
    "btn_direct_pressed.png",
    2513,
    1171,
    200,
    150,
    function()
    end
)

-- Softkey FPL ------------------------------------
button_add(
    "btn_fpl.png",
    "btn_fpl_pressed.png",
    2513,
    1313,
    200,
    150,
    function()
    end
)

-- Softkey CLR ------------------------------------
button_add(
    "btn_clr.png",
    "btn_clr_pressed.png",
    2513,
    1455,
    200,
    150,
    function()
        timer_fs2020_clear =
            timer_start(
            2000,
            function()
            end
        )
    end,
    function()
        if timer_running(timer_fs2020_clear) then
            timer_stop(timer_fs2020_clear)
        end
    end
)

-- === Right Column === ===================================================
-- Softkey MENU ------------------------------------
button_add(
    "btn_menu.png",
    "btn_menu_pressed.png",
    2691,
    1171,
    200,
    150,
    function()
    end
)

-- Softkey PROC
button_add(
    "btn_proc.png",
    "btn_proc_pressed.png",
    2691,
    1313,
    200,
    150,
    function()
    end
)

-- Softkey ENT ------------------------------------
button_add(
    "btn_ent.png",
    "btn_ent_pressed.png",
    2691,
    1455,
    200,
    150,
    function()

        if mode_fs == "MFD" and MFD_current_page == 14 then
            print("*** ENT Pressed on BLANK page — Switching to MFD Default ***")
            MFD_current_page = 1
            PFD_current_page = 1
            set_page(1)
        end
        print("***ENT Key***")
        prt_console()
    end
)