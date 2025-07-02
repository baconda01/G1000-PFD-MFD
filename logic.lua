

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

-- === Handle view state switching based on mode_fs and page ===
function set_page(page_number)
    print("set_page called with page: " .. tostring(page_number))

    if mode_fs == "PFD_Only" then
        PFD_Only_current_page = page_number
        update_softkey_label_elements(label_pages_pfd_only[page_number])

    elseif mode_fs == "PFD" then
        PFD_current_page = page_number
        update_softkey_label_elements(label_pages_pfd[page_number])

    elseif mode_fs == "MFD" then
        MFD_current_page = page_number
        update_softkey_label_elements(label_pages_mfd[page_number])
    end
end



--  === Update label visibility based on mode_fs ===
function update_mode_labels()
    visible(label_pfd_only, mode_fs == "PFD_Only")
    visible(label_pfd, mode_fs == "PFD")
    visible(label_Mfd, mode_fs == "MFD")
end




-- === BACKGROUND ===
img_add_fullscreen("background.png")

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
        prt_console(E)
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
        prt_console(R)
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
        prt_console(T)
    end
)


-- === Labels for the Mode Buttons ===
label_pfd_only = txt_add(
    "PFD Only",
    "font:roboto_bold.ttf; size:60; color:white; halign:center;",
    540, 600, 550, 50
)
label_pfd = txt_add(
    "PFD",
    "font:roboto_bold.ttf; size:60; color:white; halign:center;",
    1240, 600, 550, 50
)
label_Mfd = txt_add(
    "MFD",
    "font:roboto_bold.ttf; size:60; color:white; halign:center;",
    1850, 600, 550, 50
)

-- Set initial visibility (PFD_Only is shown by default)
visible(label_pfd_only, false)
visible(label_pfd, false)
visible(label_Mfd, false)

-- === Step 1: Create the Global Label Elementses === ------------------------------------------------------------------------
softkey_label_elements = {}  -- This holds 12 text label handles

for i = 1, 12 do
    local x = 420 + (i - 1) * 170   -- Adjust X to center over softkeys
    local y = 1580                -- Adjust Y as needed to hover just above buttons
    local label = txt_add("", "font:roboto_bold.ttf; size:45; color:white; halign:center;", x, y, 160, 40)
    table.insert(softkey_label_elements, label)
end

-- === Step 2: Create the Label Update Function ===
function update_softkey_label_elements(label_set)
    for i = 1, 12 do
        local label_info = (label_set and label_set[i]) or {text = "", subdued = false}
        local text = label_info.text or ""
        local color = label_info.color or (label_info.subdued and "#FF333333" or "white")
        local style = "font:roboto_bold.ttf; size:45; color:" .. color .. "; halign:center;"

        txt_style(softkey_label_elements[i], style)
        txt_set(softkey_label_elements[i], text)
    end
end


-- Global Declarations... Sort of
upper_labels = {"", "", "", "", "", "", "", "", "", "", "", ""}
light = {"", "", "", "", "", "", "", "", "", "", "", ""}
upper_softkey_labels = {}  -- Independent control per label
frame_side = {"|        |",
              "         |", 
              "         |", 
              "         |", 
              "         |", 
              "         |", 
              "         |", 
              "         |", 
              "         |", 
              "         |", 
              "         |", 
              "         |"
            }
frame_top = {"______",
             "______", 
             "______", 
             "______",
             "______",
             "______", 
             "______", 
             "______", 
             "______",  
             "______", 
             "______",  
             "______"
            }

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

-- === Create Global Softkey Label Handles === --------------------------------------

-- === Softkey 1 === -----------------------------------------------------------------------
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    400,
    1640,
    200,
    200,
    function()
       -- msfs_event("H:AS1000_" .. get_sim_mode() .. "_SOFTKEYS_1")
       -- highlight_softkey_flash(1) -- 🔵 This line triggers the flash
    
       -- Page-switch logic here

--[[ PFD -----------------------------------------------------------------------
        if mode_fs == "PFD" and PFD_current_page == 2 and 
                                insert_map_select == 1 and 
                                HSI_map_select == 1 then

            set_page(3)            
            
      
        elseif mode_fs == "PFD" and PFD_current_page == 2 and 
                                    insert_map_select == 1 and 
                                    HSI_map_select == 2 and
                                    map_off_select == 1 then
            set_page(5)
       
        elseif mode_fs == "PFD" and PFD_current_page == 2 and 
                                    insert_map_select == 2 and 
                                    HSI_map_select == 1 and
                                    map_off_select == 1 then
            set_page(5)
        
        elseif mode_fs == "PFD" and PFD_current_page == 4 then
            set_page(3)
            map_off_select = 2
            insert_map_select = 1
            HSI_map_select = 1
        
        elseif mode_fs == "PFD" and PFD_current_page == 5 then
            set_page(3)
            map_off_select = 2
            insert_map_select = 1
            HSI_map_select = 1
       
        elseif mode_fs == "PFD" and PFD_current_page == 6 and 
                                    HSI_map_select == 2 then
            set_page(5)
        
        elseif mode_fs == "PFD" and PFD_current_page == 6 and 
                                    insert_map_select == 2 then
            set_page(4)
        
        elseif mode_fs == "PFD" and PFD_current_page == 7 then
            set_page(8)
        
        elseif mode_fs == "PFD" and PFD_current_page == 12 then
            handle_code_entry()
  ]]
        
--[[ MFD -----------------------------------------------------------------------------------
        -- MFD - Page 2: Engine --------------------------------
        if mode_fs == "MFD" and (MFD_current_page == 1 or
                                 MFD_current_page == 3 or    
                                 MFD_current_page == 4 or 
                                 MFD_current_page == 5 or
                                 MFD_current_page == 11) then
            engine_select = 2
              lean_select = 1
            system_select = 1
            set_page(2)

        -- MFD - Page 6: Map Opr - Traffic ----------------------
        elseif mode_fs == "MFD" and MFD_current_page == 6 and
                                      traffic_select == 1 then
            traffic_select = 2

        elseif mode_fs == "MFD" and MFD_current_page == 6 and
                                      traffic_select == 2 then
            traffic_select = 1


        

        end
]]

--  PFD_Only ------------------------------------------------------------------
        -- PFD_Only - Page 2: Engine --------------------------------
        if mode_fs == "PFD_Only" and (PFD_Only_current_page == 1 or
                                      PFD_Only_current_page == 3 or
                                      PFD_Only_current_page == 4 or 
                                      PFD_Only_current_page == 5 or
                                      PFD_Only_current_page == 11) then
            engine_select = 2
              lean_select = 1
            system_select = 1
            set_page(2)




        -- PFD_Only - Page 7: Layout - Map Off ----------------------  
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 6 then   
               map_off_select = 2
            insert_map_select = 1
               HSI_map_select = 1
            set_page(7)
            
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 7 and
                                            (insert_map_select == 2 or 
                                                HSI_map_select == 2) then   
               map_off_select = 2
            insert_map_select = 1
               HSI_map_select = 1
                     
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 10 and
                                            (insert_map_select == 2 or 
                                                HSI_map_select == 2) then
            set_page(7)        
            
        -- PFD_Only - Page 8: Code -------------------------------------
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 8 then
            handle_code_entry()   
            
        -- PFD_Only - Page 13: SVT ------------------------------------  
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 12 then
            set_page(13) 

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 1 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 1 then
            pathways_select = 2
             terrain_select = 1 
             hdg_lbl_select = 1 

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                                pathways_select == 2 and
                                                 terrain_select == 1 and
                                                 hdg_lbl_select == 1 then
            pathways_select = 1
             terrain_select = 1 
             hdg_lbl_select = 1 
            
        
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 2 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 2 then
            pathways_select = 1
             terrain_select = 1 
             hdg_lbl_select = 2 

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 1 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 2 then
            pathways_select = 2
             terrain_select = 1 
             hdg_lbl_select = 2 

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 2 and
                                                terrain_select == 2 and
                                                hdg_lbl_select == 2 then
            pathways_select = 3
             terrain_select = 2
             hdg_lbl_select = 2

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 2 and
                                                terrain_select == 2 and
                                                hdg_lbl_select == 3 then
            pathways_select = 3
             terrain_select = 2
             hdg_lbl_select = 3

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 3 and
                                                terrain_select == 2 and
                                                hdg_lbl_select == 2 then
            pathways_select = 2
             terrain_select = 2
             hdg_lbl_select = 2

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 3 and
                                                terrain_select == 2 and
                                                hdg_lbl_select == 3 then
            pathways_select = 2
             terrain_select = 2
             hdg_lbl_select = 3

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 3 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 3 then
            pathways_select = 4
             terrain_select = 1
             hdg_lbl_select = 3

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 4 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 3 then
            pathways_select = 3
             terrain_select = 1
             hdg_lbl_select = 3

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 3 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 4 then
            pathways_select = 4
             terrain_select = 1
             hdg_lbl_select = 4

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 4 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 4 then
            pathways_select = 3
             terrain_select = 1
             hdg_lbl_select = 4

             
        end
        print("***Key 1***")
        prt_console()
    end
)

-- === Softkey 2 === -------------------------------------------------------------------
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    572,
    1640,
    200,
    200,
    function()
       -- msfs_event("H:AS1000_" .. get_sim_mode() .. "_SOFTKEYS_2")
    highlight_softkey_flash(2) -- 🔵 This line triggers the flash

        -- Page-switch logic here

--[[ PFD ------------------------------------------------------------------------
        if mode_fs == "PFD" and PFD_current_page == 1 and
                               insert_map_select == 1 and 
                               HSI_map_select == 1 then
            set_page(2)
       
        elseif mode_fs == "PFD" and PFD_current_page == 1 and 
                                    (insert_map_select == 2 or 
                                    HSI_map_select == 2) then
            set_page(6)
        
        elseif mode_fs == "PFD" and PFD_current_page == 3 then
            set_page(4)
            map_off_select = 1
            insert_map_select = 2
            HSI_map_select = 1
        
        elseif mode_fs == "PFD" and PFD_current_page == 5 then
            set_page(4)
            map_off_select = 1
            insert_map_select = 2
            HSI_map_select = 1
        
        elseif mode_fs == "PFD" and PFD_current_page == 6 and 
                                    HSI_map_select == 2 then
            set_page(5)
            map_off_select = 1
            insert_map_select = 1
            HSI_map_select = 2
       
        elseif mode_fs == "PFD" and PFD_current_page == 12 then
            handle_code_entry()
  ]]         
                     
-- MFD ------------------------------------------------------------------------
        -- MFD - Page 3: Lean - Assist OFF----------------------*
            if mode_fs == "MFD" and ((MFD_current_page == 2 or
                                          MFD_current_page == 4 or
                                          MFD_current_page == 11) and
                                                  assist_select == 1) then
            engine_select = 1
              lean_select = 2
            system_select = 1
            set_page(3)

        -- MFD - Page 5: Lean - Assist ON----------------------
        elseif mode_fs == "MFD" and ((MFD_current_page == 2 or
                                          MFD_current_page == 4 or
                                          MFD_current_page == 11) and
                                                  assist_select == 2) then
            engine_select = 1
              lean_select = 2
            system_select = 1
            set_page(5)

        end
                                

--  PFD_Only ------------------------------------------------------------------
        -- PFD_Only - Page 3: Lean - Assist OFF----------------------*
            if mode_fs == "PFD_Only" and ((PFD_Only_current_page == 2 or
                                          PFD_Only_current_page == 4 or
                                          PFD_Only_current_page == 11) and
                                                  assist_select == 1) then
            engine_select = 1
              lean_select = 2
            system_select = 1
            set_page(3)
            
        
        -- PFD_Only - Page 5: Lean - Assist ON----------------------
        elseif mode_fs == "PFD_Only" and ((PFD_Only_current_page == 2 or
                                          PFD_Only_current_page == 4 or
                                          PFD_Only_current_page == 11) and
                                                  assist_select == 2) then
            engine_select = 1
              lean_select = 2
            system_select = 1
            set_page(5)

        -- PFD_Only - Page 6: MAP/HSI - Sub ----------------------*
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 1 and
                                                map_off_select == 2 and
                                             insert_map_select == 1 and
                                                HSI_map_select == 1 then
            set_page(6)            

        -- PFD_Only - Page 7: Layout - Insert Map ----------------------  
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 7 and
                                               (map_off_select == 2 or
                                                HSI_map_select == 2) then   
               map_off_select = 1
            insert_map_select = 2
               HSI_map_select = 1

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 7 and 
                                               (map_off_select == 2 or
                                                HSI_map_select == 2) then   
               map_off_select = 1
            insert_map_select = 2
               HSI_map_select = 1  

        -- PFD_Only - Page 8: Code -------------------------------------
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 8 then
            handle_code_entry()   
            
        -- PFD_Only - Page 10: MAP/HSI - On ----------------------*
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 1 and
                                                map_off_select == 1 and
                                            (insert_map_select == 2 or
                                                HSI_map_select == 2) then
            set_page(10)    

        -- PFD_Only - Page 13: SVT - Pathway  ----------------------  
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 1 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 1 then
            pathways_select = 2
             terrain_select = 2
             hdg_lbl_select = 2
            
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and 
                                               pathways_select == 2 and
                                                terrain_select == 2 and
                                                hdg_lbl_select == 2 then
            pathways_select = 1
             terrain_select = 1
             hdg_lbl_select = 1
       

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                                pathways_select == 2 and
                                                 terrain_select == 1 and
                                                 hdg_lbl_select == 2 then
            pathways_select = 2
             terrain_select = 2
             hdg_lbl_select = 2
       
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 2 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 1 then
            pathways_select = 2
             terrain_select = 2
             hdg_lbl_select = 1

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 2 and
                                                terrain_select == 2 and
                                                hdg_lbl_select == 1 then
            pathways_select = 1
             terrain_select = 1
             hdg_lbl_select = 1

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 1 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 2 then
            pathways_select = 1
             terrain_select = 2
             hdg_lbl_select = 2

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 1 and
                                                terrain_select == 2 and
                                                hdg_lbl_select == 1 then
            pathways_select = 1
             terrain_select = 1
             hdg_lbl_select = 1

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 3 and
                                                terrain_select == 2 and
                                                hdg_lbl_select == 3 then
            pathways_select = 3
             terrain_select = 1
             hdg_lbl_select = 3                                            

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 3 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 3 then
            pathways_select = 3
             terrain_select = 2
             hdg_lbl_select = 3  

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 3 and
                                                terrain_select == 2 and
                                                hdg_lbl_select == 2 then
            pathways_select = 3
             terrain_select = 1
             hdg_lbl_select = 1  
            
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 2 and
                                                terrain_select == 2 and
                                                hdg_lbl_select == 3 then
            pathways_select = 1
             terrain_select = 1
             hdg_lbl_select = 3  

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 3 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 1 then
            pathways_select = 3
             terrain_select = 2
             hdg_lbl_select = 2  
            
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 1 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 3 then
            pathways_select = 2
             terrain_select = 2
             hdg_lbl_select = 3  

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 4 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 4 then
            pathways_select = 3
             terrain_select = 2
             hdg_lbl_select = 3  

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 4 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 3 then
            pathways_select = 3
             terrain_select = 2
             hdg_lbl_select = 3  

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 3 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 4 then
            pathways_select = 3
             terrain_select = 2
             hdg_lbl_select = 3  

        -- PFD_Only - Page 14: Wind ----------------------  
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 14 and
                                                (wind_option_1 == 2 or
                                                 wind_option_2 == 2 or
                                                 wind_option_3 == 2) then
                 wind_off = 2
            wind_option_1 = 1
            wind_option_2 = 1
            wind_option_3 = 1

        -- PFD_Only - Page 10: MAP/HSI - On ----------------------  
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 10 and
                                                 detail_select == 1 then
            detail_select = 2
            
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 10 and
                                                 detail_select == 2 then
            detail_select = 3
            
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 10 and
                                                 detail_select == 3 then
            detail_select = 4

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 10 and
                                                 detail_select == 4 then
            detail_select = 1





        end

        print("***Key 2***")
        prt_console()
    end
)

-- Softkey 3 ------------------------------------------------------------------------
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    742,
    1640,
    200,
    200,
    function()
     --   msfs_event("H:AS1000_" .. get_sim_mode() .. "_SOFTKEYS_3")
        highlight_softkey_flash(3) -- 🔵 This line triggers the flash

        -- Page-switch logic here

--[[ PFD ----------------------------------------------------------------------
        if mode_fs == "PFD" and PFD_current_page == 3 or 
                                PFD_current_page == 4 then
            set_page(5)
            map_off_select = 1
            insert_map_select = 1
            HSI_map_select = 2
       
        elseif mode_fs == "PFD" and PFD_current_page == 7 then
            set_page(9)
       
        elseif mode_fs == "PFD" and PFD_current_page == 12 then
            handle_code_entry()
  ]]
        
-- MFD ----------------------------------------------------------------------
        if mode_fs == "MFD" and (MFD_current_page == 2 or
                                 MFD_current_page == 3 or
                                 MFD_current_page == 5) then 
            engine_select = 1
              lean_select = 1
            system_select = 2
            set_page(4)
        
        elseif mode_fs == "MFD" and MFD_current_page == 1 then
            set_page(6)

        end




--  PFD_Only ------------------------------------------------------------------
        -- PFD_Only - Page 4: System ----------------------    
        if mode_fs == "PFD_Only" and PFD_Only_current_page == 2 or
                                     PFD_Only_current_page == 5 or
                                     PFD_Only_current_page == 3 then
            engine_select = 1
              lean_select = 1
            system_select = 2
            set_page(4)

        -- PFD_Only - Page 7: Layout - HSI Map ----------------------  
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 7 and 
                                               (map_off_select == 2 or
                                             insert_map_select == 2) then   
               map_off_select = 1
            insert_map_select = 1
               HSI_map_select = 2

        -- PFD_Only - Page 8: Code -------------------------------------
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 8 then
            handle_code_entry()             
 
        -- PFD_Only - Page 10: MAP/HSI - On - Traffic ----------------------  
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 10 and 
                                                traffic_select == 1 then   
            traffic_select = 2

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 10 and 
                                                traffic_select == 2 then   
            traffic_select = 1

        -- PFD_Only - Page 13: SVT - HDG LBL  ----------------------  
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 1 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 1 then
            pathways_select = 1
             terrain_select = 1
             hdg_lbl_select = 2
        
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 1 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 2 then
            pathways_select = 1
             terrain_select = 1
             hdg_lbl_select = 1 

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 2 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 1 then
            pathways_select = 2
             terrain_select = 1 
             hdg_lbl_select = 2 

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 2 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 2 then
            pathways_select = 2
             terrain_select = 1 
             hdg_lbl_select = 1 

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 1 and
                                                terrain_select == 2 and
                                                hdg_lbl_select == 2 then
            pathways_select = 1
             terrain_select = 2 
             hdg_lbl_select = 1 

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 1 and
                                                terrain_select == 2 and
                                                hdg_lbl_select == 1 then
            pathways_select = 1
             terrain_select = 2 
             hdg_lbl_select = 2 

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 2 and
                                                terrain_select == 2 and
                                                hdg_lbl_select == 1 then
            pathways_select = 2
             terrain_select = 2 
             hdg_lbl_select = 2 



        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 2 and
                                                terrain_select == 2 and
                                                hdg_lbl_select == 2 then
            pathways_select = 2
             terrain_select = 2
             hdg_lbl_select = 3

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 3 and
                                                terrain_select == 2 and
                                                hdg_lbl_select == 2 then
            pathways_select = 3
             terrain_select = 2
             hdg_lbl_select = 3

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 2 and
                                                terrain_select == 2 and
                                                hdg_lbl_select == 3 then
            pathways_select = 2
             terrain_select = 2
             hdg_lbl_select = 2

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 3 and
                                                terrain_select == 2 and
                                                hdg_lbl_select == 3 then
            pathways_select = 3
             terrain_select = 2
             hdg_lbl_select = 2

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 3 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 4 then
            pathways_select = 3
             terrain_select = 1
             hdg_lbl_select = 3

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 3 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 3 then
            pathways_select = 3
             terrain_select = 1
             hdg_lbl_select = 4

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 4 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 3 then
            pathways_select = 4
             terrain_select = 1
             hdg_lbl_select = 4

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 13 and
                                               pathways_select == 4 and
                                                terrain_select == 1 and
                                                hdg_lbl_select == 4 then
            pathways_select = 4
             terrain_select = 1
             hdg_lbl_select = 3

        -- PFD_Only - Page 14: Wind ----------------------  
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 12 then   
            set_page(14)

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 14 and
                                                     (wind_off == 2 or
                                                 wind_option_2 == 2 or
                                                 wind_option_3 == 2) then
                 wind_off = 1
            wind_option_1 = 2
            wind_option_2 = 1
            wind_option_3 = 1





        -- PFD_Only - Page 16: XPDR - Standby ----------------------  
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 16 and
                                                standby_select == 1 then
            standby_select = 2
                 on_select = 1
                alt_select = 1




        end
        print("***Key 3***")
        prt_console()
    end
)

-- Softkey 4 -----------------------------------------------------------------
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    912,
    1640,
    200,
    200,
    function()
     --   msfs_event("H:AS1000_" .. get_sim_mode() .. "_SOFTKEYS_4")
        highlight_softkey_flash(4) -- 🔵 This line triggers the flash

        -- Page-switch logic here
        
--  MFD ------------------------------------------------------------------------
        -- MFD - Page 6: Map Opr - Topo ----------------------
        if mode_fs == "MFD" and MFD_current_page == 6 and
                                      topo_select == 1 then
            topo_select = 2

        elseif mode_fs == "MFD" and MFD_current_page == 6 and
                                      topo_select == 2 then
            topo_select = 1        
        end

--  PFD_Only ------------------------------------------------------------------
        -- PFD_Only - Page 8: Code -------------------------------------
            if mode_fs == "PFD_Only" and PFD_Only_current_page == 8 then
            handle_code_entry()

        -- PFD_Only - Page 10: MAP/HSI - On ----------------------------
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 10 and
                                                   topo_select == 1 then
               topo_select = 2
            rel_ter_select = 1

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 10 and
                                                   topo_select == 2 then
            topo_select = 1

        -- PFD_Only - Page 12: PFD Opt --------------------------------
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 1 then
            set_page(12)

        -- PFD_Only - Page 14: Wind ----------------------  
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 14 and
                                                     (wind_off == 2 or
                                                 wind_option_1 == 2 or
                                                 wind_option_3 == 2) then
                 wind_off = 1
            wind_option_1 = 1
            wind_option_2 = 2
            wind_option_3 = 1

        -- PFD_Only - Page 16: XPDR - ON -----------------------------
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 16 and
                                                     on_select == 1 then
            standby_select = 1
                 on_select = 2
                alt_select = 1






        end
        print("***Key 4***")
        prt_console()
    end
)

-- Softkey 5 -----------------------------------------------------------------
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1082,
    1640,
    200,
    200,
    function()
    --    msfs_event("H:AS1000_" .. get_sim_mode() .. "_SOFTKEYS_5")
        highlight_softkey_flash(5) -- 🔵 This line triggers the flash

        -- Page-switch logic here

--  PFD_Only ------------------------------------------------------------------
        -- PFD_Only - Page 8: Code ------------------------------
            if mode_fs == "PFD_Only" and PFD_Only_current_page == 8 then
            handle_code_entry() 

        -- PFD_Only - Page 10: MAP/HSI - On --------------------------------
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 10 and
                                                rel_ter_select == 1 then
            rel_ter_select = 2
               topo_select = 1 
        
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 10 and
                                                rel_ter_select == 2 then
            rel_ter_select = 1

        -- PFD_Only - Page 14: Wind ----------------------  
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 14 and
                                                     (wind_off == 2 or
                                                 wind_option_1 == 2 or
                                                 wind_option_2 == 2) then
                 wind_off = 1
            wind_option_1 = 1
            wind_option_2 = 1
            wind_option_3 = 2

        -- PFD_Only - Page 16: XPDR - ALT --------------------------------  
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 16 and
                                                    alt_select == 1 then
            standby_select = 1
                 on_select = 1
                alt_select = 2






        end
        print("***Key 5***")
        prt_console()
    end
)

-- Softkey 6 -----------------------------------------------------------------
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1252,
    1640,
    200,
    200,
    function()
    --    msfs_event("H:AS1000_" .. get_sim_mode() .. "_SOFTKEYS_6")
        highlight_softkey_flash(6) -- 🔵 This line triggers the flash


--  MFD_Only ------------------------------------------------------------------
        -- MFD_Only - Page 3: Lean - Assist ON ----------------------*    
        if mode_fs == "MFD" and MFD_current_page == 3 and 
                                   assist_select == 1 then
            assist_select = 2
            set_page(5)

        elseif mode_fs == "MFD" and MFD_current_page == 5 and 
                                       assist_select == 2 then
            assist_select = 1
            set_page(3)


        end

--  PFD_Only ------------------------------------------------------------------
        -- PFD_Only - Page 3: Lean - Assist OFF ----------------------*    
        if mode_fs == "PFD_Only" and PFD_Only_current_page == 5 and 
                                             assist_select == 2 then
            assist_select = 1
            set_page(3)

        -- PFD_Only - Page 5: Lean - Assist ON ----------------------*    
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 3 and 
                                                 assist_select == 1 then
            assist_select = 2
            set_page(5)

        -- PFD_Only - Page 8: Code ------------------------------
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 8 then
            handle_code_entry()              

        -- PFD_Only - Page 10: MAP/HSI - On - NEXRAD
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 10 and
                                                 nexrad_select == 1 then
            nexrad_select = 2

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 10 and
                                                 nexrad_select == 2 then
            nexrad_select = 1
        
        -- PFD_Only - Page 15: Alt Units
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 15 and
                                      alt_uniits_meters_select == 1 then
            alt_uniits_meters_select = 2

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 15 and
                                      alt_uniits_meters_select == 2 then
            alt_uniits_meters_select = 1               
        end
        print("***Key 6***")
        prt_console()
    end
)

-- Softkey 7 -----------------------------------------------------------------
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1422,
    1640,
    200,
    200,
    function()
    --    msfs_event("H:AS1000_" .. get_sim_mode() .. "_SOFTKEYS_7")
        highlight_softkey_flash(7) -- 🔵 This line triggers the flash

        -- Page-switch logic here

--  MFD ------------------------------------------------------------------------
-- MFD - Page 6: Map Opt - NEXRAD 
        if mode_fs == "MFD" and MFD_current_page == 6 and
                                   nexrad_select == 1 then
            nexrad_select = 2

        elseif mode_fs == "MFD" and MFD_current_page == 6 and
                                       nexrad_select == 2 then
            nexrad_select = 1
        end



--  PFD_Only ------------------------------------------------------------------
        -- PFD_Only - Page 8: Code ------------------------------
            if mode_fs == "PFD_Only" and PFD_Only_current_page == 16 then
            vfr_select = 2

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 8 then
            handle_code_entry()

        end
        print("***Key 7***")
        prt_console()
    end
)

-- Softkey 8 -----------------------------------------------------------------
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1592,
    1640,
    200,
    200,
    function()
     --   msfs_event("H:AS1000_" .. get_sim_mode() .. "_SOFTKEYS_8")
        highlight_softkey_flash(8) -- 🔵 This line triggers the flash

        -- Page-switch logic here

-- MFD ------------------------------------------------------------------------

        if mode_fs == "MFD" and MFD_current_page == 4 then
            gal_rem_select = 2
            set_page(11)
        end

--  PFD_Only ------------------------------------------------------------------
        -- PFD_Only - Page 8: Code ------------------------------
            if mode_fs == "PFD_Only" and PFD_Only_current_page == 16 then
            set_page(8)

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 8 then
            handle_code_entry()

        -- PFD_Only - Page 11: System ---------------------------    
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 4 then
            gal_rem_select = 2
            set_page(11)

        -- PFD_Only - Page 15: Alt Units ---------------------------    
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 15 and 
                                         alt_uniits_hpa_select == 2 then
            alt_uniits_in_select = 2
            alt_uniits_hpa_select = 1

        -- PFD_Only - Page 16: XPDR ---------------------------    
        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 1 then
            set_page(16)





        end
        print("***Key 8***")
        prt_console()
    end
)

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


    


-- Label overlay for PFD -----------------------------------------------------------------------------------------------------
label_pages_pfd = {
    -- PFD - Page 1: Default PFD - Sub
    [1] = {
        {text = " ",            subdued = false},
        {text = "MAP/HSI",      subdued = false},
        {text = "TFC Map",      subdued = true},
        {text = "PFD Opt",      subdued = false},
        {text = "OBS",          subdued = true},
        {text = "CDI",          subdued = false},
        {text = "ADF/DME",      subdued = false},
        {text = "XPDR",         subdued = false},
        {text = "Ident",        subdued = false},
        {text = "Tmr/Ref",      subdued = false},
        {text = "Nearest",      subdued = false},
        {text = "Alerts",       subdued = false}
    },
    -- PFD - Page 2: MAP/HSI - Sub
    [2] = {
        {text = "Layout",       subdued = false},
        {text = "Detail",       subdued = true},
        {text = "Traffic",      subdued = true},
        {text = "Topo",         subdued = true},
        {text = "Rel Ter",      subdued = true},
        {text = "NEXRAD",       subdued = true},
        {text = "METAR",        subdued = true},
        {text = "Lighting",     subdued = true},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true}
    },
    -- PFD - Page 3: Layout - Map Off
    [3] = {
        {text = "[Map Off]",    subdued = false, color = "lightgreen"},
        {text = "Insert Map",   subdued = false},
        {text = "HSI Map",      subdued = false},
        {text = "TFC Map",      subdued = true},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "WX LGND",      subdued = true},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true}
    },
    -- PFD - Page 4: Layout - Insert Map
    [4] = {
        {text = "Map Off",      subdued = false},
        {text = "[Insert Map]", subdued = false, color = "lightgreen"},
        {text = "HSI Map",      subdued = false},
        {text = "TFC Map",      subdued = true},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "WX LGND",      subdued = true},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true}
    },
    -- PFD - Page 5: Layout - HSI Map
    [5] = {
        {text = "Map Off",      subdued = false},
        {text = "Insert Map",   subdued = false},
        {text = "[HSI Map]",    subdued = false, color = "lightgreen"},
        {text = "TFC Map",      subdued = true},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "WX LGND",      subdued = true},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true}
    },
    -- PFD - Page 6: MAP/HSI - On
    [6] = {
        {text = "Layout",       subdued = false},
        {text = "Detail",       subdued = false, color = "lightblue"},
        {text = "Traffic",      subdued = false},
        {text = "Topo",         subdued = false},
        {text = "Rel Ter",      subdued = false},
        {text = "NEXRAD",       subdued = false},
        {text = "METAR",        subdued = true},
        {text = "Lighting",     subdued = true},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true}
    },
    -- PFD - Page 7: PFD Opt
    [7] = {
        {text = "SVT",          subdued = false},
        {text = "",             subdued = false},
        {text = "Wind",         subdued = false},
        {text = "DME",          subdued = false},
        {text = "Bearing 1",    subdued = false},
        {text = "",             subdued = false},
        {text = "Bearing 2",    subdued = false},
        {text = "",             subdued = false},
        {text = "ALT Units",    subdued = false},
        {text = "STD Baro",     subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true}
    },
    -- PFD - Page 8: SVT
    [8] = {
        {text = "Pathways",     subdued = false},
        {text = "Terrain",      subdued = false},
        {text = "HDG LBL",      subdued = false},
        {text = "APT Sign",     subdued = true},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true}
    },
    -- PFD - Page 9: Wind
    [9] = {
        {text = "",             subdued = false},
        {text = "Off",          subdued = false},
        {text = "Option 1",     subdued = false},
        {text = "Option 2",     subdued = false},
        {text = "Option 3",     subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true}
    },
    -- PFD - Page 10: ALT Units
    [10] = {
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Meters",       subdued = false},
        {text = "",             subdued = false},
        {text = "IN",           subdued = false},
        {text = "HPA",          subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true}
    },
    -- PFD - Page 11: XPDR
    [11] = {
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Standby",      subdued = false},
        {text = "On",           subdued = false},
        {text = "All",          subdued = false},
        {text = "",             subdued = false},
        {text = "VFR",          subdued = false},
        {text = "Code",         subdued = false},
        {text = "Ident",        subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true}
    },
    -- PFD - Page 12: Code
    [12] = {
        {text = "0",            subdued = false},
        {text = "1",            subdued = false},
        {text = "2",            subdued = false},
        {text = "3",            subdued = false},
        {text = "4",            subdued = false},
        {text = "5",            subdued = false},
        {text = "6",            subdued = false},
        {text = "7",            subdued = false},
        {text = "Ident",        subdued = true},
        {text = "BKSP",         subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true}
    }
}

-- Label overlay for PFD_Only ------------------------------------------------------------------------------------------------
label_pages_pfd_only = {
    -- PFD_Only - Page 1: PFD Only Default
    [1] = {
        {text = "Engine",       subdued = false},
        {text = "MAP/HSI",      subdued = false},
        {text = "TFC Map",      subdued = true, color = "#3A3A3A"},
        {text = "PFD Opt",      subdued = false},
        {text = "OBS",          subdued = true, color = "#3A3A3A"},
        {text = "CDI",          subdued = false},
        {text = "ADF/DME",      subdued = false},
        {text = "XPDR",         subdued = false},
        {text = "Ident",        subdued = false},
        {text = "Tmr/Ref",      subdued = false},
        {text = "Nearest",      subdued = false},
        {text = "Alerts",       subdued = false}
    },
    -- PFD_Only - Page 2: Engine
    [2] = {
        {text = "Engine",       subdued = false},
        {text = "Lean",         subdued = false},
        {text = "System",       subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "",             subdued = false}
    },
    -- PFD_Only - Page 3: Lean
    [3] = {
        {text = "Engine",       subdued = false},
        {text = "Lean",         subdued = false},
        {text = "System",       subdued = false},
        {text = "",             subdued = false},
        {text = "CYL SLCT",     subdued = false},
        {text = "Assist",       subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "",             subdued = false}
    },
    -- PFD_Only - Page 4: System
    [4] = {
        {text = "Engine",       subdued = false},
        {text = "Lean",         subdued = false},
        {text = "System",       subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "RST Fuel",     subdued = false},
        {text = "GAL REM",      subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "",             subdued = false}
    },
    -- PFD_Only - Page 5: Assist
    [5] = {
        {text = "Engine",       subdued = false},
        {text = "Lean",         subdued = false},
        {text = "System",       subdued = false},
        {text = "",             subdued = false},
        {text = "CYL SLCT",     subdued = true, color = "#3A3A3A"},
        {text = "Assist",       subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "",             subdued = false}
    },
    -- PFD_Only - Page 6: MAP/HSI - Sub
    [6] = {
        {text = "Layout",       subdued = false},
        {text = "Detail     ",  subdued = true, color = "#3A3A3A"},
        {text = "Traffic",      subdued = true, color = "#3A3A3A"},
        {text = "Topo",         subdued = true, color = "#3A3A3A"},
        {text = "Rel Ter",      subdued = true, color = "#3A3A3A"},
        {text = "NEXRAD",       subdued = true, color = "#3A3A3A"},
        {text = "METAR",        subdued = true, color = "#3A3A3A"},
        {text = "Lighting",     subdued = true, color = "#3A3A3A"},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true, color = "#3A3A3A"}
    },
      -- PFD_Only - Page 7: Layout - Maps
    [7] = {
        {text = "Map Off",      subdued = false},
        {text = "Insert Map",   subdued = false},
        {text = "HSI Map",      subdued = false},
        {text = "TFC Map",      subdued = true, color = "#3A3A3A"},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "WX LGND",      subdued = true, color = "#3A3A3A"},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true, color = "#3A3A3A"}
    },
    -- PFD_Only - Page 8: Code
    [8] = {
        {text = "0",            subdued = false},
        {text = "1",            subdued = false},
        {text = "2",            subdued = false},
        {text = "3",            subdued = false},
        {text = "4",            subdued = false},
        {text = "5",            subdued = false},
        {text = "6",            subdued = false},
        {text = "7",            subdued = false},
        {text = "Ident",        subdued = true, color = "#3A3A3A"},
        {text = "BKSP",         subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true, color = "#3A3A3A"}
    },
    -- PFD_Only - Page #: Name
    [9] = {
        {text = "",   subdued = false},
        {text = "",   subdued = false},
        {text = "",   subdued = false},
        {text = "",   subdued = false},
        {text = "",   subdued = false},
        {text = "",   subdued = false},
        {text = "",   subdued = false},
        {text = "",   subdued = false},
        {text = "",   subdued = false},
        {text = "",   subdued = false},
        {text = "",   subdued = false},
        {text = "",   subdued = false}
    },
    -- PFD_Only - Page 10: MAP/HSI - On
    [10] = {
        {text = "Layout",       subdued = false},
        {text = "Detail      ", subdued = false},
        {text = "Traffic",      subdued = false},
        {text = "Topo",         subdued = false},
        {text = "Rel Ter",      subdued = false},
        {text = "NEXRAD",       subdued = false},
        {text = "METAR",        subdued = true, color = "#3A3A3A"},
        {text = "Lighting",     subdued = true, color = "#3A3A3A"},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true, color = "#3A3A3A"}
    },
    -- PFD_Only - Page 11: System - GAL REM
    [11] = {
        {text = "Engine",       subdued = false},
        {text = "Lean",         subdued = false},
        {text = "System",       subdued = false},
        {text = "-10 GAL",      subdued = false},
        {text = "-1 GAL",       subdued = false},
        {text = "+1 GAL",       subdued = false},
        {text = "+10 GAL",      subdued = false},
        {text = "35 GAL",       subdued = false},
        {text = "53 GAL",       subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "",             subdued = false}
    },
    -- PFD_Only - Page 12: PFD Opt
    [12] = {
        {text = "SVT",          subdued = false},
        {text = "",             subdued = false},
        {text = "Wind",         subdued = false},
        {text = "DME",          subdued = false},
        {text = "Bearing 1",    subdued = false},
        {text = "",             subdued = false},
        {text = "Bearing 2",    subdued = false},
        {text = "",             subdued = false},
        {text = "ALT Units",    subdued = false},
        {text = "STD Baro",     subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true}
    },
    -- PFD_Only - Page 13: SVT
    [13] = {
        {text = "Pathways",     subdued = false},
        {text = "Terrain",      subdued = false},
        {text = "HDG LBL",      subdued = false},
        {text = "APT Sign",     subdued = true, color = "#3A3A3A"},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true, color = "#3A3A3A"}
    },
    -- PFD_Only - Page 14: Wind
    [14] = {
        {text = "",             subdued = false},
        {text = "Off",          subdued = false},
        {text = "Option 1",     subdued = false},
        {text = "Option 2",     subdued = false},
        {text = "Option 3",     subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true, color = "#3A3A3A"}
    },
    -- PFD_Only - Page 15: ALT Units
    [15] = {
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Meters",       subdued = false},
        {text = "",             subdued = false},
        {text = "IN",           subdued = false},
        {text = "HPA",          subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true, color = "#3A3A3A"}
    },
    -- PFD - Page 16: XPDR
    [16] = {
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Standby",      subdued = false},
        {text = "On",           subdued = false},
        {text = "Alt",          subdued = false},
        {text = "",             subdued = false},
        {text = "VFR",          subdued = false},
        {text = "Code",         subdued = false},
        {text = "Ident",        subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "Alerts",       subdued = true, color = "#3A3A3A"}
    },
}

-- Label overlay for MFD---------------------------------------------------------------------------------------------------
label_pages_mfd = {
-- MFD - Page 1: Default    
    [1] = {
        {text = "Engine",       subdued = false},
        {text = "",             subdued = false},
        {text = "Map Opt",      subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Detail      ",       subdued = false},
        {text = "Charts",       subdued = true, color = "#3A3A3A"},
        {text = "Checklist",    subdued = true, color = "#3A3A3A"}
    },
    -- MFD - Page 2: Engine
    [2] = {
        {text = "Engine",       subdued = false},
        {text = "Lean",         subdued = false},
        {text = "System",       subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "",             subdued = false}
    },
    -- MFD - Page 3: Lean
    [3] = {
        {text = "Engine",       subdued = false},
        {text = "Lean",         subdued = false},
        {text = "System",       subdued = false},
        {text = "",             subdued = false},
        {text = "CYL SLCT",     subdued = false},
        {text = "Assist",       subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "",             subdued = false}
    },
    -- MFD - Page 4: System
    [4] = {
        {text = "Engine",       subdued = false},
        {text = "Lean",         subdued = false},
        {text = "System",       subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "RST Fuel",     subdued = false},
        {text = "GAL REM",      subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "",             subdued = false}
    },
    -- MFD_Only - Page 5: Assist
    [5] = {
        {text = "Engine",       subdued = false},
        {text = "Lean",         subdued = false},
        {text = "System",       subdued = false},
        {text = "",             subdued = false},
        {text = "CYL SLCT",     subdued = true, color = "#3A3A3A"},
        {text = "Assist",       subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "",             subdued = false}
    },
    -- MFD - Page 6: Map Opt
    [6] = {
        {text = "Traffic",      subdued = false},
        {text = "",             subdued = false},
        {text = "Insert",       subdued = true, color = "#3A3A3A"},
        {text = "TER",          subdued = false},
        {text = "AWY Off",      subdued = true, color = "#3A3A3A"},
        {text = "",             subdued = false},
        {text = "NEXRAD",       subdued = false},
        {text = "XM LTNG",      subdued = true, color = "#3A3A3A"},
        {text = "METAR",        subdued = true, color = "#3A3A3A"},
        {text = "Legend",       subdued = false},
        {text = "Back",         subdued = false},
        {text = "",             subdued = false}
    },
    -- MFD - Page 11: System - GAL REM
    [11] = {
        {text = "Engine",       subdued = false},
        {text = "Lean",         subdued = false},
        {text = "System",       subdued = false},
        {text = "-10 GAL",      subdued = false},
        {text = "-1 GAL",       subdued = false},
        {text = "+1 GAL",       subdued = false},
        {text = "+10 GAL",      subdued = false},
        {text = "35 GAL",       subdued = false},
        {text = "53 GAL",       subdued = false},
        {text = "",             subdued = false},
        {text = "Back",         subdued = false},
        {text = "",             subdued = false}
    }
}