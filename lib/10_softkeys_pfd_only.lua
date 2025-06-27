--print("10_softkeys_pfd_only.lua loaded")


-- === Softkey 1 PFD_Only === ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    400,
    1640,
    200,
    200,
    function()
        highlight_softkey_flash(1) -- 🔵 This line triggers the flash


        -- PFD_Only - Page 2: Engine --------------------------------
        if mode_fs == "PFD_Only" and (PFD_Only_current_page == 1 or
                                      PFD_Only_current_page == 3 or
                                      PFD_Only_current_page == 4 or 
                                      PFD_Only_current_page == 5 or
                                      PFD_Only_current_page == 11) then
            engine_select = 2
              lean_select = 1
            system_select = 1
            set_page(label_pages_pfd_only[2])




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

-- === Softkey 2 === ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    572,
    1640,
    200,
    200,
    function()
        --highlight_softkey_flash(2) -- 🔵 This line triggers the flash


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

-- === Softkey 3 PFD_Only === ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    742,
    1640,
    200,
    200,
    function()

       -- highlight_softkey_flash(3) -- 🔵 This line triggers the flash

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

-- === Softkey 4 PFD_Only ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    912,
    1640,
    200,
    200,
    function()
        --highlight_softkey_flash(4) -- 🔵 This line triggers the flash
       
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

-- === Softkey 5 PFD_Only === ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1082,
    1640,
    200,
    200,
    function()
        --highlight_softkey_flash(5) -- 🔵 This line triggers the flash

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

-- === Softkey 6 PFD_Only === ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1252,
    1640,
    200,
    200,
    function()
        --highlight_softkey_flash(6) -- 🔵 This line triggers the flash

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

-- === Softkey 7 PFD_Only === ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1422,
    1640,
    200,
    200,
    function()
        --highlight_softkey_flash(7) -- 🔵 This line triggers the flash

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

-- === Softkey 8 PFD_Only === ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1592,
    1640,
    200,
    200,
    function()
        --highlight_softkey_flash(8) -- 🔵 This line triggers the flash

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

-- === Softkey 9 PFD_Only === ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1762,
    1640,
    200,
    200,
    function()
        --highlight_softkey_flash(9) -- 🔵 This line triggers the flash

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

-- === Softkey 10 PFD_Only === ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    1932,
    1640,
    200,
    200,
    function()
        --highlight_softkey_flash(10) -- 🔵 This line triggers the flash

    -- PFD_Only - Page 1: PFD Only Default  ----------------------    
        if mode_fs == "PFD_Only" and PFD_Only_current_page == 12 then           
            set_page(1)  

        end
        print("***Key 10***")
        prt_console()
    end
)

-- === Softkey 11 PFD_Only=== ====================================================================
button_add(
    "btn_arrow.png",
    "btn_arrow_pressed.png",
    2102,
    1640,
    200,
    200,
    function()
        -- highlight_softkey_flash(11) -- 🔵 This line triggers the flash
 
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

-- === Softkey 12 PFD_Only === ====================================================================
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