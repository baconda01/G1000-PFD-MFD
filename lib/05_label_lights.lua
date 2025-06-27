--print("05_label_lights.lua loaded")

-- === Label LIGHTS === ====================================================================

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
