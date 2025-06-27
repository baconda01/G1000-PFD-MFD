--print("11_softkeys_pfd.lua loaded")

-- === Softkey 1  PFD === ====================================================================
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

-- === Softkey 2 PFD === ====================================================================
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

-- === Softkey 3 PFD === ====================================================================
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

-- === Softkey 4 PFD === ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    912,
    1640,
    200,
    200,
    function()

        print("***Key 4***")
        prt_console()
    end
)

-- === Softkey 5 PFD === ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1082,
    1640,
    200,
    200,
    function()

        print("***Key 5***")
        prt_console()
    end
)

-- === Softkey 6 PFD === ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1252,
    1640,
    200,
    200,
    function()

        print("***Key 6***")
        prt_console()
    end
)

-- === Softkey 7 PFD === ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1422,
    1640,
    200,
    200,
    function()

        print("***Key 7***")
        prt_console()
    end
)

-- === Softkey 8 PFD === ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1592,
    1640,
    200,
    200,
    function()

        print("***Key 8***")
        prt_console()
    end
)

-- === Softkey 9 PFD === === ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1762,
    1640,
    200,
    200,
    function()

        print("***Key 9***")
        prt_console()
    end
)

-- === Softkey 10 PFD === === ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1932,
    1640,
    200,
    200,
    function()
        --highlight_softkey_flash(10) -- 🔵 This line triggers the flash

        if mode_fs == "PFD" and PFD_current_page == 7 then
            set_page(1)

        elseif mode_fs == "PFD" and PFD_current_page == 12 then
            handle_code_backspace()
  
                    end
        print("***Key 10***")
        prt_console()
    end
)

-- === Softkey 11 PFD === ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    2102,
    1640,
    200,
    200,
    function()
        -- highlight_softkey_flash(11) -- 🔵 This line triggers the flash

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

        end
        print("***Key 11***")
        prt_console()
    end
)            

-- === Softkey 12 PFD === ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    2272,
    1640,
    200,
    200,
    function()

        print("***Key 12***")
        prt_console()
    end
)