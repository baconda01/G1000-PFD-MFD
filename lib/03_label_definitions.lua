

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