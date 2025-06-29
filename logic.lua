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
        "PFD_Only Current Page: "   .. tostring(PFD_Only_current_page),

 --       "Type of rect_add: " .. tostring(type(rect_add))

        "   engine_select: "      .. tostring(engine_select),
        "   lean_select: "      .. tostring(lean_select),
        "   system_select: "      .. tostring(system_select)
    )
    
    print("----------------------")
end
prt_console()




-- Declare global button handle
--softkey_btn_1 = nil


--print("04_label_manager.lua loaded")

--update_softkey_label_elements = nil  -- forward declaration

-- === Handle view state switching based on mode_fs and page === ============================================
function set_page(page_number)
    print("=== === set_page called with page: " .. tostring(page_number))

    if mode_fs == "PFD_Only" then
        PFD_Only_current_page = page_number
        update_light_logic()
        draw_lights()        
        update_softkey_label_elements(label_pages_pfd_only[page_number])
        --draw_pfd_only_page(page_number)

    elseif mode_fs == "PFD" then
        PFD_current_page = page_number
        update_light_logic()
        draw_lights()        
        update_softkey_label_elements(label_pages_pfd[page_number])

    elseif mode_fs == "MFD" then
        MFD_current_page = page_number
        update_light_logic()
        draw_lights()
        update_softkey_label_elements(label_pages_mfd[page_number])
    end

    --print("=== set_page")
end





--  === Update label visibility based on mode_fs === ======================================================
function update_mode_labels()
    visible(label_pfd_only, mode_fs == "PFD_Only")
    visible(label_pfd, mode_fs == "PFD")
    visible(label_Mfd, mode_fs == "MFD")

    --print("=== update_mode_labels")
end



-- === Labels for the Mode Buttons === ====================================================================
label_pfd_only = txt_add(
    "PFD Only",
    "font:roboto_bold.ttf; size:60; color:white; halign:center;",
    540, 600, 550, 50
    --print("=== label_pfd_only")
    
)
label_pfd = txt_add(
    "PFD",
    "font:roboto_bold.ttf; size:60; color:white; halign:center;",
    1240, 600, 550, 50
    --print("=== label_pfd")
)
label_Mfd = txt_add(
    "MFD",
    "font:roboto_bold.ttf; size:60; color:white; halign:center;",
    1850, 600, 550, 50
    --print("=== label_Mfd")
)

-- Set initial visibility (PFD_Only is shown by default)
visible(label_pfd_only, true)
visible(label_pfd, false)
visible(label_Mfd, false)





-- === Lablel Flash === =================================================================================
function highlight_softkey_flash(index)
    if softkey_label_elements[index] == nil then return end

    -- Change label color to blue
    txt_style(softkey_label_elements[index], "font:roboto_bold.ttf; size:45; color:#33ccff; halign:center;")

    -- Cancel any previous timer
    if highlight_timer then
        timer_stop(highlight_timer)
    end

    -- Revert to white after 250ms
    highlight_timer = timer_start(250, function()
        txt_style(softkey_label_elements[index], "font:roboto_bold.ttf; size:45; color:white; halign:center;")
    end)
end





