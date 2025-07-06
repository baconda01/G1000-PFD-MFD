--print("12_softkeys_mfd.lua loaded")


-- === Softkey 1 MFD === ====================================================================
function handle_softkey_1_mfd()

    print("=== Softkey 1 MFD REALLY!")
    --highlight_softkey_flash(1) -- 🔵 This line triggers the flash

    -- MFD - Page 2: Engine --------------------------------
    if mode_fs == "MFD" and MFD_current_page == 1 or
                                MFD_current_page == 3 or    
                                MFD_current_page == 4 or 
                                MFD_current_page == 5 or
                                MFD_current_page == 11 then
        engine_select = 2
            lean_select = 1
        system_select = 1
        set_page(2)

    -- MFD - Page 6: Map Opr - Traffic ----------------------
    elseif mode_fs == "MFD" and MFD_current_page == 6 and
                                    traffic_select == 1 then
        traffic_select = 2

    elseif mode_fs == "MFD" and MFD_current_page == 6 and
                                    traffic_select == 2 then
        traffic_select = 1
    end
    print("***Key 1 ***")
    prt_console()
end


-- === Softkey 2 === ====================================================================
function handle_softkey_2_mfd()
    --highlight_softkey_flash(2) -- 🔵 This line triggers the flash

    -- MFD - Page 3: Lean - Assist OFF----------------------*
        if mode_fs == "MFD" and ((MFD_current_page == 2 or
                                        MFD_current_page == 4 or
                                        MFD_current_page == 11) and
                                                assist_select == 1) then
        engine_select = 1
            lean_select = 2
        system_select = 1
        set_page(3)

    -- MFD - Page 5: Lean - Assist ON----------------------
    elseif mode_fs == "MFD" and ((MFD_current_page == 2 or
                                        MFD_current_page == 4 or
                                        MFD_current_page == 11) and
                                                assist_select == 2) then
        engine_select = 1
            lean_select = 2
        system_select = 1
        set_page(5)

    end
    print("***Key 2***")
    prt_console()
end


-- === Softkey 3 MFD === ====================================================================
function handle_softkey_3_mfd()

    -- highlight_softkey_flash(3) -- 🔵 This line triggers the flash
    
    if mode_fs == "MFD" and (MFD_current_page == 2 or
                                MFD_current_page == 3 or
                                MFD_current_page == 5) then 
        engine_select = 1
            lean_select = 1
        system_select = 2
        set_page(4)
    
    elseif mode_fs == "MFD" and MFD_current_page == 1 then
        set_page(6)

    end
    print("***Key 3***")
    prt_console()
end


-- === Softkey 4 MFD === ====================================================================
function handle_softkey_4_mfd()
        --highlight_softkey_flash(4) -- 🔵 This line triggers the flash
       
        -- MFD - Page 6: Map Opr - Topo ----------------------
        if mode_fs == "MFD" and MFD_current_page == 6 and
                                      topo_select == 1 then
            topo_select = 2

        elseif mode_fs == "MFD" and MFD_current_page == 6 and
                                      topo_select == 2 then
            topo_select = 1     
            
        end
        print("***Key 4***")
        prt_console()
    end


-- === Softkey 5 MFD ====================================================================
function handle_softkey_5_mfd()

        print("***Key 5***")
        prt_console()
    end


-- === Softkey 6 MFD === ====================================================================
function handle_softkey_6_mfd()
        --highlight_softkey_flash(6) -- 🔵 This line triggers the flash

        -- MFD_Only - Page 3: Lean - Assist ON ----------------------*    
        if mode_fs == "MFD" and MFD_current_page == 3 and 
                                   assist_select == 1 then
            assist_select = 2
            set_page(5)

        elseif mode_fs == "MFD" and MFD_current_page == 5 and 
                                       assist_select == 2 then
            assist_select = 1
            set_page(3)

        end
        print("***Key 6***")
        prt_console()
    end


-- === Softkey 7 MFD === ====================================================================
function handle_softkey_7_mfd()
        --highlight_softkey_flash(7) -- 🔵 This line triggers the flash

-- MFD - Page 6: Map Opt - NEXRAD 
        if mode_fs == "MFD" and MFD_current_page == 6 and
                                   nexrad_select == 1 then
            nexrad_select = 2

        elseif mode_fs == "MFD" and MFD_current_page == 6 and
                                       nexrad_select == 2 then
            nexrad_select = 1

        end
        print("***Key 7***")
        prt_console()
    end


-- === Softkey 8 MFD === ====================================================================
function handle_softkey_8_mfd()
        --highlight_softkey_flash(8) -- 🔵 This line triggers the flash

        if mode_fs == "MFD" and MFD_current_page == 4 then
            gal_rem_select = 2
            set_page(11)
        end
        print("***Key 8***")
        prt_console()
    end


-- === Softkey 9 MFD === ====================================================================
function handle_softkey_9_mfd()

        print("***Key 9***")
        prt_console()
    end


-- === Softkey 10 MFD === ====================================================================
function handle_softkey_10_mfd()
        --highlight_softkey_flash(10) -- 🔵 This line triggers the flash

        -- MFD - Page 6: Map Opr - Legend ----------------------
        if mode_fs == "MFD" and MFD_current_page == 6 and
                                   legend_select == 1 then
            legend_select = 2

        -- MFD - Page 1: Default MFD - Detail All, 3, 2, 1 ----------------------
        elseif mode_fs == "MFD" and MFD_current_page == 6 and
                                       legend_select == 2 then
            legend_select = 1   
            
        elseif mode_fs == "MFD" and MFD_current_page == 1 and
                                                 detail_select == 1 then
            detail_select = 2
            
        elseif mode_fs == "MFD" and MFD_current_page == 1 and
                                                 detail_select == 2 then
            detail_select = 3
            
        elseif mode_fs == "MFD" and MFD_current_page == 1 and
                                                 detail_select == 3 then
            detail_select = 4

        elseif mode_fs == "MFD" and MFD_current_page == 1 and
                                                 detail_select == 4 then
            detail_select = 1            

  
        end
        print("***Key 10***")
        prt_console()
    end


-- === Softkey 11 MFD=== ====================================================================
function handle_softkey_11_mfd()
        -- highlight_softkey_flash(11) -- 🔵 This line triggers the flash
 
        if mode_fs == "MFD" and ((MFD_current_page == 2 and gal_rem_select == 1) or
                                 (MFD_current_page == 3 and gal_rem_select == 1) or 
                                  MFD_current_page == 4 or
                                  MFD_current_page == 6) then 
            set_page(1)

        -- MFD - Page 4: System -----------------------------------    
        elseif mode_fs == "MFD" and  (MFD_current_page == 11 or
                                     (MFD_current_page == 2 and gal_rem_select == 2) or
                                     (MFD_current_page == 3 and gal_rem_select == 2)) then           
             system_select = 2
            gal_rem_select = 1
            set_page(4) 

        end
        print("***Key 11***")
        prt_console()
    end


-- === Softkey 12 MFD === ====================================================================
function handle_softkey_12_mfd()

        print("***Key 12***")
        prt_console()
    end



