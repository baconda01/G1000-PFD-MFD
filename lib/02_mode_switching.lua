--print("02_mode_buttons.lua loaded")

-- === Handle view state switching based on mode_fs and page === ============================================



function set_page(page_number)
    print("Switching to page: ".. page_number  .. "    |    mode_fs: " .. mode_fs)
    prt_console()


    
    if mode_fs == "PFD_Only" then
        PFD_Only_current_page = page_number
        print("PFD_Only_current_page set to: " .. PFD_Only_current_page)
        prt_console()
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


-- === Labels for the Mode Buttons === ====================================================================
label_pfd_only = txt_add("PFD Only", "font:roboto_bold.ttf; size:60; color:white; halign:center;", 540, 600, 550, 50)
label_pfd = txt_add("PFD", "font:roboto_bold.ttf; size:60; color:white; halign:center;", 1240, 600, 550, 50)
label_Mfd = txt_add("MFD", "font:roboto_bold.ttf; size:60; color:white; halign:center;", 1850, 600, 550, 50)


--  === Update label visibility based on mode_fs === ======================================================

-- Set initial visibility (PFD_Only is shown by default)
visible(label_pfd_only, true)
visible(label_pfd, false)
visible(label_Mfd, false)

function update_mode_labels()
    visible(label_pfd_only, mode_fs == "PFD_Only")
    visible(label_pfd, mode_fs == "PFD")
    visible(label_Mfd, mode_fs == "MFD")
end


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
        --prt_console()
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
        --prt_console()
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
        --prt_console()
    end
)

