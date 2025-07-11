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

draw_current_page = nil




-- === 1. Create the dispatcher table === 
softkey_handlers = {
    PFD_Only = {},
    PFD = {},
    MFD = {}
}




-- === Print to console ===
function prt_console()
   -- print("*** System Status ***")
    print(
    --    "mode_fs: " .. tostring(mode_fs),
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
--prt_console()