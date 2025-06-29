-- === Global Label Elementses === ====================================================================
softkey_label_elements = {}  -- This holds 12 text label handles

for i = 1, 12 do
    local x = 420 + (i - 1) * 170   -- Adjust X to center over softkeys
    local y = 1580                -- Adjust Y as needed to hover just above buttons

    local label = txt_add("", "font:roboto_bold.ttf; size:45; color:white; halign:center;", x, y, 160, 40)
    table.insert(softkey_label_elements, label)
        
    --print("=== softkey_label_elements")
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
    --print("=== update_softkey_label_elements")
end


-- --[[
-- Global Label Declarations === ---------------------------------
upper_labels = {"", "", "", "", "", "", "", "", "", "", "", ""}
light = {"", "", "", "", "", "", "", "", "", "", "", ""}
upper_softkey_labels = {}  -- Independent control per label
frame_side = {"|",
              "|", 
              "|", 
              "|", 
              "|", 
              "|", 
              "|", 
              "|", 
              "|", 
              "|", 
              "|", 
              "|         |"
            }
frame_top = {"________",
             "________", 
             "________", 
             "________",
             "________",
             "________", 
             "________", 
             "________", 
             "________",  
             "________", 
             "________",  
             "________"
            }
-- ]]

softkey_label_top = {}
softkey_label_side = {}

for i = 1, 12 do
    local x = 410 + (i - 1) * 170  -- Same X as label
    local y_top = 1520             -- Slightly above the label
    local x_2 = 410 + (i - 1) * 170  -- Same X as label
    local y_top_2 = 1521             -- Slightly above the label
    local y_side = 1560            -- Same Y as the label

    -- Frame Top: underscores
    local top_label = txt_add(
        frame_top[i],
        "font:roboto_bold.ttf; size:63; color:white; halign:center;",
        x, y_top, 200, 90
    )
    table.insert(softkey_label_top, top_label)
    
    local top_label = txt_add(
        frame_top[i],
        "font:roboto_bold.ttf; size:64; color:white; halign:center;",
        x_2, y_top_2, 200, 90
    )
    table.insert(softkey_label_top, top_label)

    -- Frame Side: vertical bars (if you want left/right edges)
    local side_label = txt_add(
        frame_side[i],
        "font:roboto_bold.ttf; size:90; color:white; halign:left;",
        x, y_side, 200, 90
    )
    table.insert(softkey_label_side, side_label)
end