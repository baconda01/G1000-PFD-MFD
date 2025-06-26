print("05_softkeys_pfd.lua loaded")

-- === Softkey 1  PFD === -----------------------------------------------------------------------
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    400,
    1640,
    200,
    200,
    function()
       -- highlight_softkey_flash(1) -- 🔵 This line triggers the flash
    
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

        end
        print("***Key 1***")
        prt_console()
    end
)

-- === Softkey 2 PFD === -------------------------------------------------------------------
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    572,
    1640,
    200,
    200,
    function()
        --highlight_softkey_flash(2) -- 🔵 This line triggers the flash

        -- Page-switch logic here

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

        end
        print("***Key 2***")
        prt_console()        
    end
)

-- === Softkey 3 PFD ===------------------------------------------------------------------------
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    742,
    1640,
    200,
    200,
    function()
        --highlight_softkey_flash(3) -- 🔵 This line triggers the flash

        -- Page-switch logic here

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
        end
        print("***Key 3***")
        prt_console()  
    end
)