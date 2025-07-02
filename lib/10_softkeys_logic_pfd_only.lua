--print("10_softkeys_pfd_only.lua loaded")

for i = 1, 12 do
    msfs_event("H:AS1000_PFD_Only_SOFTKEYS_" .. i, function()
        print("🛰️ Event received from MSFS 2024: SOFTKEY " .. i)
        if mode_fs == "PFD_Only" and softkey_handlers.PFD_Only[i] then
            softkey_handlers.PFD_Only[i]()
        else
            print("⚠️ No handler for softkey " .. i .. " in mode " .. mode_fs)
        end
    end)
end

softkey_handlers.PFD_Only = {}

-- === Softkey 1 ===
softkey_handlers.PFD_Only[1] = function()
    print("🟦 Softkey 1 → Page 2")
    engine_select = 2
    lean_select = 1
    system_select = 1
    set_page(2)
end

-- === Softkey 2 ===
softkey_handlers.PFD_Only[2] = function()
    print("🟩 Softkey 2 → Page 3")
    engine_select = 1
    lean_select = 2
    system_select = 1
    set_page(3)
end

-- === Softkey 3 ===
softkey_handlers.PFD_Only[3] = function()
    print("🟥 Softkey 3 → Page 4")
    engine_select = 1
    lean_select = 1
    system_select = 2
    set_page(4)
end

-- === Softkey 4 ===
softkey_handlers.PFD_Only[4] = function()
    print("🟨 Softkey 4 → Page 12")
    set_page(12)
end

-- === Softkey 5 ===
softkey_handlers.PFD_Only[5] = function()
    print("🟪 Softkey 5 → Page 14")
    wind_off = 1
    wind_option_1 = 1
    wind_option_2 = 1
    wind_option_3 = 2
    set_page(14)
end

-- === Softkey 6 ===
softkey_handlers.PFD_Only[6] = function()
    print("🟫 Softkey 6 → Page 5")
    assist_select = 2
    set_page(5)
end

-- === Softkey 7 ===
softkey_handlers.PFD_Only[7] = function()
    print("⬛ Softkey 7 → Page 13")
    pathways_select = 1
    terrain_select = 1
    hdg_lbl_select = 1
    set_page(13)
end

-- === Softkey 8 ===
softkey_handlers.PFD_Only[8] = function()
    print("⬜ Softkey 8 → Page 16")
    set_page(16)
end

-- === Softkey 9 ===
softkey_handlers.PFD_Only[9] = function()
    print("🔵 Softkey 9 → Page 1")
    set_page(1)
end

-- === Softkey 10 ===
softkey_handlers.PFD_Only[10] = function()
    print("🟠 Softkey 10 → Page 15")
    set_page(15)
end

-- === Softkey 11 ===
softkey_handlers.PFD_Only[11] = function()
    print("🔴 Softkey 11 → Page 11")
    set_page(11)
end

-- === Softkey 12 ===
softkey_handlers.PFD_Only[12] = function()
    print("🟣 Softkey 12 → Page 8")
    set_page(8)
end



--[[
softkey_handlers.PFD_Only = {
    [1] = {
        [1]  = function() 
            engine_select = 2
            lean_select = 1
            system_select = 1
            set_page(2) end,
      --  [3]  = function() set_page(2) end,
      --  [4]  = function() set_page(2) end,
        [2]  = function()
            if lean_select == 2 then
                engine_select = 2
                lean_select = 1
                system_select = 1
            end
        end
    },

    [2] = {
        [2] = function() 
            if engine_select == 2 then
                engine_select = 1
                lean_select = 2
                system_select = 1
            end
        end
    }
}
]]



-- === Softkey 1 PFD_Only === ====================================================================


--[[
-- === Softkey 1 handler for PFD_Only mode ===
softkey_handlers.PFD_Only[1] = function(index)
    if PFD_Only_current_page == 1 or
       PFD_Only_current_page == 3 or
       PFD_Only_current_page == 4 or
       PFD_Only_current_page == 5 or
       PFD_Only_current_page == 11 then

        engine_select = 2
          lean_select = 1
        system_select = 1
        set_page(2)
    else
        print("Softkey 1 pressed, but page not valid. Option 1")
    end
    print("***Key 1***")
    prt_console()
end


softkey_handlers.PFD_Only[1] = function()
    if PFD_Only_current_page == 2 and
                 lean_select == 2 then

        engine_select = 2
        lean_select = 1
        system_select = 1

    else
        print("Softkey 1 pressed, but page not valid. Option 2")
    end
    print("***Key 1***")
    prt_console()
end
]]



--[[        
    -- PFD_Only - Page 7: Layout - Map Off ----------------------  
    if mode_fs == "PFD_Only" and PFD_Only_current_page == 6 then   
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

]]

--[[
-- === Softkey 2 === ====================================================================

softkey_handlers.PFD_Only[2] = function(index)
    if PFD_Only_current_page == 2 and
              (engine_select == 2 or
               system_select == 2) then

        engine_select = 1
          lean_select = 2
        system_select = 1

    else
        print("Softkey 2 pressed, but page not valid. Option 3")
    end
    print("***Key 1***")
    prt_console()
end
]]

--[[
function handle_softkey_2_pfd_only()

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
 
]]

-- === Softkey 3 PFD_Only === ====================================================================
function handle_softkey_3_pfd_only()

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


-- === Softkey 4 PFD_Only ====================================================================
function handle_softkey_4_pfd_only()

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


-- === Softkey 5 PFD_Only === ====================================================================
function handle_softkey_5_pfd_only()

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


-- === Softkey 6 PFD_Only === ====================================================================
function handle_softkey_6_pfd_only()

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


-- === Softkey 7 PFD_Only === ====================================================================
function handle_softkey_7_pfd_only()

        -- PFD_Only - Page 8: Code ------------------------------
            if mode_fs == "PFD_Only" and PFD_Only_current_page == 16 then
            vfr_select = 2

        elseif mode_fs == "PFD_Only" and PFD_Only_current_page == 8 then
            handle_code_entry()

        end
        print("***Key 7***")
        prt_console()
    end


-- === Softkey 8 PFD_Only === ====================================================================
function handle_softkey_8_pfd_only()

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


-- === Softkey 9 PFD_Only === ====================================================================
function handle_softkey_9_pfd_only()

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


-- === Softkey 10 PFD_Only === ====================================================================
function handle_softkey_10_pfd_only()

    -- PFD_Only - Page 1: PFD Only Default  ----------------------    
        if mode_fs == "PFD_Only" and PFD_Only_current_page == 12 then           
            set_page(1)  

        end
        print("***Key 10***")
        prt_console()
    end


-- === Softkey 11 PFD_Only=== ====================================================================
function handle_softkey_11_pfd_only()

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


-- === Softkey 12 PFD_Only === ====================================================================
function handle_softkey_12_pfd_only()

        print("***Key 12***")
        prt_console()
    end



