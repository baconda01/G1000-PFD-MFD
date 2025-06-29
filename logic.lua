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










-- === Handle view state switching based on mode_fs and page === ============================================



function set_page(page_number)
    print("=== === set_page called with page: " .. tostring(page_number))

    if mode_fs == "PFD_Only" then
        PFD_Only_current_page = page_number
        update_light_logic()
        draw_lights()        
        update_softkey_label_elements(label_pages_pfd_only[page_number])
        draw_current_page() 
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





draw_current_page = function()
    if mode_fs == "PFD_Only" then
        draw_page_PFD_Only()
    elseif mode_fs == "MFD" then
        draw_page_MFD()
    elseif mode_fs == "PFD" then
        draw_page_PFD()
    end
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



--[[

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

]]



