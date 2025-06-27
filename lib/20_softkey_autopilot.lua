--print("20_softkey_autopilot.lua loaded")

-- === Auto Pilot === ====================================================================

-- === Left Column === ===================================================
-- Softkey AP ------------------------------------
button_ap =
    button_add(
    "btn_ap.png",
    "btn_ap_pressed.png",
    0,
    745,
    200,
    150,
    function()
        msfs_event("AP_MASTER")
    end
)

-- Softkey HDG ------------------------------------
button_hdg =
    button_add(
    "btn_hdg.png",
    "btn_hdg_pressed.png",
    0,
    887,
    200,
    150,
    function()
        msfs_event("AP_PANEL_HEADING_HOLD")
    end
)

-- Softkey NAV ------------------------------------
button_nav =
    button_add(
    "btn_nav.png",
    "btn_nav_pressed.png",
    0,
    1029,
    200,
    150,
    function()
        msfs_event("AP_NAV1_HOLD")
    end
)

-- Softkey APR ------------------------------------
button_apr =
    button_add(
    "btn_apr.png",
    "btn_apr_pressed.png",
    0,
    1171,
    200,
    150,
    function()
        msfs_event("AP_APR_HOLD")
    end
)

-- Softkey VS ------------------------------------
button_vs =
    button_add(
    "btn_vs.png",
    "btn_vs_pressed.png",
    0,
    1313,
    200,
    150,
    function()
        msfs_event("AP_PANEL_VS_HOLD")
    end
)

-- Softkey FLC ------------------------------------
button_flc =
    button_add(
    "btn_flc.png",
    "btn_flc_pressed.png",
    0,
    1455,
    200,
    150,
    function()
        if gbl_flc_mode then
            msfs_event("FLIGHT_LEVEL_CHANGE_OFF")
        else
            msfs_event("FLIGHT_LEVEL_CHANGE_ON")
            msfs_event("AP_SPD_VAR_SET", gbl_ias)
        end
    end
)


-- === Right Column === ===================================================
-- Softkey FD ------------------------------------
button_fd =
    button_add(
    "btn_fd.png",
    "btn_fd_pressed.png",
    171,
    745,
    200,
    150,
    function()
        msfs_event("TOGGLE_FLIGHT_DIRECTOR")
    end
)

-- Softkey ALT ------------------------------------
button_alt =
    button_add(
    "btn_alt.png",
    "btn_alt_pressed.png",
    171,
    887,
    200,
    150,
    function()
        msfs_event("AP_PANEL_ALTITUDE_HOLD")
    end
)

-- Softkey VNV ------------------------------------
button_vnv =
    button_add(
    "btn_vnv.png",
    "btn_vnv_pressed.png",
    171,
    1029,
    200,
    150,
    function()
    end
)

-- Softkey BC ------------------------------------
button_bc =
    button_add(
    "btn_bc.png",
    "btn_bc_pressed.png",
    171,
    1171,
    200,
    150,
    function()
        msfs_event("AP_BC_HOLD")
    end
)

-- Softkey NOSEUP ------------------------------------
button_nosup =
    button_add(
    "btn_nose_up.png",
    "btn_nose_up_pressed.png",
    171,
    1313,
    200,
    150,
    function()
        if gbl_vs_mode then
            msfs_event("AP_VS_VAR_INC")
        elseif gbl_flc_mode then
            msfs_event("AP_SPD_VAR_DEC")
        else
            msfs_event("AP_PITCH_REF_INC_UP")
        end
    end
)

-- Softkey NOSEDN ------------------------------------
button_nosdn =
    button_add(
    "btn_nose_dn.png",
    "btn_nose_dn_pressed.png",
    171,
    1455,
    200,
    150,
    function()
        if gbl_vs_mode then
            msfs_event("AP_VS_VAR_DEC")
        elseif gbl_flc_mode then
            msfs_event("AP_SPD_VAR_INC")
        else
            msfs_event("AP_PITCH_REF_INC_DN")
        end
    end
)