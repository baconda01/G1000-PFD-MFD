--print("04_label_manager.lua loaded")

-- === Handle view state switching based on mode_fs and page === ============================================
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



--  === Update label visibility based on mode_fs === ======================================================
function update_mode_labels()
    visible(label_pfd_only, mode_fs == "PFD_Only")
    visible(label_pfd, mode_fs == "PFD")
    visible(label_Mfd, mode_fs == "MFD")
end



-- === Labels for the Mode Buttons === ====================================================================
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

-- === Global Label Elementses === ====================================================================
softkey_label_elements = {}  -- This holds 12 text label handles

for i = 1, 12 do
    local x = 420 + (i - 1) * 170   -- Adjust X to center over softkeys
    local y = 1580                -- Adjust Y as needed to hover just above buttons
    local label = txt_add("", "font:roboto_bold.ttf; size:45; color:white; halign:center;", x, y, 160, 40)
    table.insert(softkey_label_elements, label)
end

-- === Label Update Function === -----------------------------------
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


-- Global Label Declarations === ---------------------------------
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