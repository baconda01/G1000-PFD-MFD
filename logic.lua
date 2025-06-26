--[[###############################################################################################################################
#
#
# Modules are loaded in lib/ folder in alphabetical order:
# 01_background -> 02_mode_buttons -> etc.
# Do not rename without adjusting the order if dependencies exist.
#
#
#
#
##################################################################################################################################]]








-- === GLOBAL VARIABLES ===
mode_fs = "PFD_Only"        -- Current mode (PFD, MFD, or PFD_Only)
PFD_Only_current_page = 1   -- Tracks which PFD_Only subpage is active
PFD_current_page = 1
MFD_current_page = 1
-- Globals
assist_select = 1
CODE_NUM = 1
alt_select = 1
alt_uniits_meters_select = 1
alt_uniits_in_select = 2
alt_uniits_hpa_select = 1
engine_select = 1
gal_rem_select = 1
hdg_lbl_select = 1
highlighted_softkey = nil
highlight_timer = nil
HSI_map_select = 1
insert_map_select = 1
lean_select = 1
legend_select = 1
map_off_select = 2
nexrad_select = 1
on_select = 1
pathways_select = 1
rel_ter_select = 1
standby_select = 1
system_select = 1
terrain_select = 1
topo_select = 1
traffic_select = 1
vfr_select = 2
wind_off = 2
wind_option_1 = 1
wind_option_2 = 1
wind_option_3 = 1
detail_select = 1
pfd_only = 2
mfd = 1

-- === Print to console ===
function prt_console()
   -- print("*** System Status ***")
    print(
        "mode_fs: " .. tostring(mode_fs),
        "PFD Current Page: "      .. tostring(PFD_current_page),
        "MFD Current Page: "      .. tostring(MFD_current_page), 
        "PFD_Only Current Page: "   .. tostring(PFD_Only_current_page)
        --"   update_display_mode_label: "      .. tostring(update_display_mode_label)
    )
    print("----------------------")
end
prt_console()




-- Configure softkey label LIGHTS ------------------------------------------------------------------
function draw_softkeys()

    -- Label Light 1 ------------------------------------------------------------------------------
    if (engine_select == 2 and (PFD_Only_current_page == 2 or                                       -- PFD_Only - Page 2: Engine  - Engine   - LIGHT
                                     MFD_current_page == 2)) or                                     -- MFD      - Page 2: Engine  - Engine   - LIGHT
       (map_off_select == 2 and PFD_Only_current_page == 7) or                                      -- PFD_Only - Page 7: Layout  - Map Off  - LIGHT
       ((pathways_select == 2 or pathways_select == 4) and PFD_Only_current_page == 13) or          -- PFD_Only - Page 13: SVT    - Pathways - LIGHT
       (traffic_select == 2 and MFD_current_page == 6) then                                         -- MFD      - Page 6: MAP/HSI - Traffic  - LIGHT
        light[1] = "______"
    else
        light[1] = ""
    end

    -- Label Light 2 ------------------------------------------------------------------------------
    if (lean_select == 2 and (PFD_Only_current_page == 3 or                                         -- PFD_Only - Page 3: Engine - Lean        - LIGHT
                              PFD_Only_current_page == 5 or                                         -- PFD_Only - Page 5: Engine - Assist      - LIGHT
                                   MFD_current_page == 5 or                                         -- PFD_Only - Page 5: Engine - Assist      - LIGHT
                                   MFD_current_page == 3)) or                                       -- MFD      - Page 3: Engine - Lean        - LIGHT
        (insert_map_select == 2 and PFD_Only_current_page == 7) or                                  -- PFD_Only - Page 7: Layout - Insert Maps - LIGHT
        (terrain_select == 2 and PFD_Only_current_page == 13) or                                    -- PFD_Only - Page 13: SVT   - Terrain     - LIGHT
        (wind_off == 2 and PFD_Only_current_page == 14) then                                        -- PFD_Only - Page 14: Wind  - Off         - LIGHT
        light[2] = "______"
    else
        light[2] = ""
    end

    -- Label Light 3 ------------------------------------------------------------------------------
    if (system_select == 2 and (PFD_Only_current_page == 4 or                                       -- PFD_Only - Page 4: Engine   - System   - LIGHT
                                PFD_Only_current_page == 11 or                                      -- PFD_Only - Page 11: System  - System   - LIGHT
                                     MFD_current_page == 4 or                                       -- MFD      - Page 4: Engine   - System   - LIGHT 
                                     MFD_current_page == 11)) or                                    -- MFD      - Page 11: System  - GAL REM  - LIGHT                                           
        (HSI_map_select == 2 and PFD_Only_current_page == 7) or                                     -- PFD_Only - Page 7: Layout   - HSI Map  - LIGHT    
        (traffic_select == 2 and PFD_Only_current_page == 10) or                                    -- PFD_Only - Page 10: MAP/HSI - Traffic  - LIGHT
        ((hdg_lbl_select == 2 or hdg_lbl_select == 4) and PFD_Only_current_page == 13) or           -- PFD_Only - Page 13: SVT     - HDG LBL  - LIGHT
        (standby_select == 2 and PFD_Only_current_page == 16) or                                    -- PFD_Only - Page 16: XPDR    - Standby  - LIGHT
        (wind_option_1 == 2 and PFD_Only_current_page == 14) then                                   -- PFD_Only - Page 14: Wind    - Option 2 - LIGHT
        light[3] = "______"
    else
        light[3] = ""
    end
    
    -- Label Light 4 ------------------------------------------------------------------------------  
    if (topo_select == 2 and PFD_Only_current_page == 10) or                                        -- PFD_Only - Page 10: MAP/HSI - Topo - LIGHT    
        (on_select == 2 and PFD_Only_current_page == 16) or                                         -- PFD_Only - Page 16: XPDR    - On   - LIGHT
        (wind_option_2 == 2 and PFD_Only_current_page == 14) or                                     -- PFD_Only - Page 14: Wind    - Off  - LIGHT
        (topo_select == 2 and MFD_current_page == 6) then                                           -- MFD      - Page 6: MAP/HSI  - Topo - LIGHT
        light[4] = "______"
    else
        light[4] = ""
    end

    -- Label Light 5 ------------------------------------------------------------------------------
    if (rel_ter_select == 2 and PFD_Only_current_page == 10) or                                     -- PFD_Only - Page 10: MAP/HSI - Rel Ter  - LIGHT  
        (alt_select == 2 and PFD_Only_current_page == 16) or                                        -- PFD_Only - Page 16: XPDR    - Alt      - LIGHT
        (wind_option_3 == 2 and PFD_Only_current_page == 14) then                                   -- PFD_Only - Page 14: Wind    - Option 1 - LIGHT
        light[5] = "______"
    else
        light[5] = ""
    end

    -- Label Light 6 ------------------------------------------------------------------------------
    if (assist_select == 2 and (PFD_Only_current_page == 5 or                                        -- PFD_Only - Page 5:  Lean       - Assist - LIGHT
                                     MFD_current_page == 3 or
                                     MFD_current_page == 5)) or                                      -- MFD      - Page 3:  Lean       - Assist - LIGHTS                                      
        (nexrad_select == 2 and PFD_Only_current_page == 10) or                                      -- PFD_Only - Page 10: MAP/HSI On - NEXRAD - LIGHT
        (alt_uniits_meters_select == 2 and PFD_Only_current_page == 15) then                         -- PFD_Only - Page 15: Alt Units  - Meters - LIGHT
        light[6] = "______"
    else
        light[6] = ""
    end

    -- Label Light 7 ------------------------------------------------------------------------------
    if (vfr_select == 2 and PFD_Only_current_page == 16) or                                       -- PFD_Only - Page 16: XPDR   - VFR    - LIGHT
        (nexrad_select == 2 and MFD_current_page == 6) then                                         -- MFD      - Page 6: MAP/HSI - NEXRAD - LIGHT
        light[7] = "______"
    else
        light[7] = ""
    end
    
    -- Label Light 8 ------------------------------------------------------------------------------
    if (alt_uniits_in_select == 2 and PFD_Only_current_page == 15) then                             -- PFD_Only - Page 15: Alt Units - In - LIGHT
        light[8] = "______"
    else
        light[8] = ""
    end

    -- Label Light 9 ------------------------------------------------------------------------------
    if (alt_uniits_hpa_select == 2 and PFD_Only_current_page == 15) then                            -- PFD_Only - Page 15: Alt Units - HPA - LIGHT
        light[9] = "______"
    else
        light[9] = ""
    end

    -- Label Light 10 ------------------------------------------------------------------------------
    if (legend_select == 2 and MFD_current_page == 6) then                                          -- MFD      - Page 6: MAP/HSI - Legend - LIGHT
        light[10] = "______"
    else
        light[10] = ""
    end
end




    














-- Softkey 9 -----------------------------------------------------------------
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1762,
    1640,
    200,
    200,
    function()
     --   msfs_event("H:AS1000_" .. get_sim_mode() .. "_SOFTKEYS_9")
        highlight_softkey_flash(9) -- 🔵 This line triggers the flash

        -- Page-switch logic here


--  PFD_Only ------------------------------------------------------------------
        -- PFD_Only - Page 1: PFD Only Default ----------------------
            if mode_fs == "PFD_Only" and PFD_Only_current_page == 16 then
            set_page(1)

        -- PFD_Only - Page 15: Alt Units ----------------------    
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 12 then
            set_page(15)
  
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 15 and 
                                         alt_uniits_in_select == 2 then
            alt_uniits_in_select = 1
            alt_uniits_hpa_select = 2    

        end
        print("***Key 9***")
        prt_console()
    end
)

-- Softkey 10
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1932,
    1640,
    200,
    200,
    function()
    --    msfs_event("H:AS1000_" .. get_sim_mode() .. "_SOFTKEYS_10")
        highlight_softkey_flash(10) -- 🔵 This line triggers the flash

        -- Page-switch logic here
--[[ PFD ----------------------------------------------------------------------
        if mode_fs == "PFD" and PFD_current_page == 7 then
            set_page(1)

        elseif mode_fs == "PFD" and PFD_current_page == 12 then
            handle_code_backspace()
  ]]
-- MFD ----------------------------------------------------------------------
        -- MFD - Page 6: Map Opr - Legend ----------------------
        if mode_fs == "MFD" and MFD_current_page == 6 and
                                   legend_select == 1 then
            legend_select = 2

        -- MFD - Page 1: Default MFD - Detail All, 3, 2, 1 ----------------------
        elseif mode_fs == "MFD" and MFD_current_page == 6 and
                                       legend_select == 2 then
            legend_select = 1   
            
        elseif mode_fs == "MFD" and MFD_current_page == 1 and
                                                 detail_select == 1 then
            detail_select = 2
            
        elseif mode_fs == "MFD" and MFD_current_page == 1 and
                                                 detail_select == 2 then
            detail_select = 3
            
        elseif mode_fs == "MFD" and MFD_current_page == 1 and
                                                 detail_select == 3 then
            detail_select = 4

        elseif mode_fs == "MFD" and MFD_current_page == 1 and
                                                 detail_select == 4 then
            detail_select = 1            



        end
        
--  PFD_Only ------------------------------------------------------------------
    -- PFD_Only - Page 1: PFD Only Default  ----------------------    
        if mode_fs == "PFD_Only" and PFD_Only_current_page == 12 then           
            set_page(1)  
        end
        print("***Key 10***")
        prt_console()
    end
)

-- Softkey 11
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    2102,
    1640,
    200,
    200,
    function()
    --    msfs_event("H:AS1000_" .. get_sim_mode() .. "_SOFTKEYS_11")
        highlight_softkey_flash(11) -- 🔵 This line triggers the flash

        -- Page-switch logic here

--[[ PFD ----------------------------------------------------------------------
        if mode_fs == "PFD" and PFD_current_page == 2 or 
                                PFD_current_page == 6 then
            set_page(1)
        
        elseif mode_fs == "PFD" and PFD_current_page == 3 then
            set_page(2)
        
        elseif mode_fs == "PFD" and PFD_current_page == 4 or 
                                    PFD_current_page == 5 then
            set_page(6)
        
        elseif mode_fs == "PFD" and PFD_current_page == 7 then
            set_page(1)
       
       elseif mode_fs == "PFD" and PFD_current_page == 8 then
            set_page(7)
       
       elseif mode_fs == "PFD" and PFD_current_page == 9 then
            set_page(7)
       
       elseif mode_fs == "PFD" and PFD_current_page == 10 then
            set_page(7)
       
       elseif mode_fs == "PFD" and PFD_current_page == 11 then
            set_page(1)
       
       elseif mode_fs == "PFD" and PFD_current_page == 12 then
            set_page(11)
            CODE_NUM = 1
  ]]
        
-- MFD ----------------------------------------------------------------------
        if mode_fs == "MFD" and ((MFD_current_page == 2 and gal_rem_select == 1) or
                                 (MFD_current_page == 3 and gal_rem_select == 1) or 
                                  MFD_current_page == 4 or
                                  MFD_current_page == 6) then 
            set_page(1)

        -- MFD - Page 4: System -----------------------------------    
        elseif mode_fs == "MFD" and  (MFD_current_page == 11 or
                                     (MFD_current_page == 2 and gal_rem_select == 2) or
                                     (MFD_current_page == 3 and gal_rem_select == 2)) then           
             system_select = 2
            gal_rem_select = 1
            set_page(4) 

 


        end 


--  PFD_Only ------------------------------------------------------------------
        -- PFD_Only - Back - Page 1: PFD Only Default ----------------------    
            if mode_fs == "PFD_Only" and  ((PFD_Only_current_page == 2 and gal_rem_select == 1) or
                                           (PFD_Only_current_page == 3 and gal_rem_select == 1) or
                                            PFD_Only_current_page == 4 or
                                            PFD_Only_current_page == 5 or 
                                            PFD_Only_current_page == 6 or
                                            PFD_Only_current_page == 10 or
                                            PFD_Only_current_page == 12 or
                                            PFD_Only_current_page == 16) then
            set_page(1)
            
        -- PFD_Only - Page 4: System -----------------------------------    
        elseif mode_fs == "PFD_Only" and  (PFD_Only_current_page == 11 or
                                          (PFD_Only_current_page == 2 and gal_rem_select == 2) or  
                                          (PFD_Only_current_page == 3 and gal_rem_select == 2)) then           
             system_select = 2
            gal_rem_select = 1
            set_page(4) 

        -- PFD_Only - Back - Page 6: MAP/HSI - Sub ----------------------    
        elseif mode_fs == "PFD_Only" and  PFD_Only_current_page == 7 and
                                                map_off_select == 2 then           
            set_page(6)    
            
        -- PFD_Only - Page 10: MAP/HSI - On -----------------------------    
        elseif mode_fs == "PFD_Only" and  PFD_Only_current_page == 7 and
                                             (insert_map_select == 2 or 
                                                 HSI_map_select == 2) then       
            set_page(10)              

        -- PFD_Only - Page 12: PFD Opt --------------------------------    
        elseif mode_fs == "PFD_Only" and  PFD_Only_current_page == 13 or
                                         PFD_Only_current_page == 14 or
                                         PFD_Only_current_page == 15 then           
            set_page(12)  

        -- PFD_Only - Page 16: XPDR ----------------------------------    
        elseif mode_fs == "PFD_Only" and  PFD_Only_current_page == 8 then                                      
            set_page(16)  








            
        end
        print("***Key 11***")
        prt_console()
    end
)

-- Softkey 12
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    2272,
    1640,
    200,
    200,
    function()
    --    msfs_event("H:AS1000_" .. get_sim_mode() .. "_SOFTKEYS_12")
        highlight_softkey_flash(12) -- 🔵 This line triggers the flash

        -- Page-switch logic here

        print("***Key 12***")
        prt_console()
    end
)

-- Auto Pilot -----------------------------------------------------------------------------------------
-- Softkey AP
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

-- Softkey HDG
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

-- Softkey NAV
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

-- Softkey APR
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

-- Softkey VS
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

-- Softkey FLC
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

-- Softkey FD
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

-- Softkey ALT
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

-- Softkey VNV
button_vnv =
    button_add(
    "btn_vnv.png",
    "btn_vnv_pressed.png",
    171,
    1029,
    200,
    150,
    function()
    --    msfs_event("H:AS1000_VNAV_TOGGLE")
    end
)

-- Softkey BC
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

-- Softkey NOSEUP
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

-- Softkey NOSEDN
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

-- Group buttons for autopilot visibility ------------------------------------------------------------------------
-- Autopilot visibility
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
visible(group_btn_ap, user_prop_get(prop_ap))

-- Softkey DIRECT TO
button_add(
    "btn_direct.png",
    "btn_direct_pressed.png",
    2513,
    1171,
    200,
    150,
    function()
    --    msfs_event("H:AS1000_" .. get_sim_mode() .. "_DIRECTTO")
    end
)

-- Softkey MENU
button_add(
    "btn_menu.png",
    "btn_menu_pressed.png",
    2691,
    1171,
    200,
    150,
    function()
    --    msfs_event("H:AS1000_" .. get_sim_mode() .. "_MENU_Push")
    end
)

-- Softkey FPL
button_add(
    "btn_fpl.png",
    "btn_fpl_pressed.png",
    2513,
    1313,
    200,
    150,
    function()
    --    msfs_event("H:AS1000_" .. get_sim_mode() .. "_FPL_Push")
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
    --    msfs_event("H:AS1000_" .. get_sim_mode() .. "_PROC_Push")
    end
)

-- Softkey CLR
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
            --    msfs_event("H:AS1000_" .. get_sim_mode() .. "_CLR_Long")
            end
        )
    end,
    function()
        if timer_running(timer_fs2020_clear) then
            timer_stop(timer_fs2020_clear)
        --    msfs_event("H:AS1000_" .. get_sim_mode() .. "_CLR")
        end
    end
)

-- Softkey ENT
button_add(
    "btn_ent.png",
    "btn_ent_pressed.png",
    2691,
    1455,
    200,
    150,
    function()
       -- msfs_event("H:AS1000_" .. get_sim_mode() .. "_ENT_Push")

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


    


