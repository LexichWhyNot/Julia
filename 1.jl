function mark_wrapper(a,b,rob)
        while !isborder(rob,a)
            move!(rob,a)
            putmarker!(rob)
        end

        while ismarker(rob)
            move!(rob,b)
        end
end 

function mark_kross()
    for side in (Nord,Ost,Sud,West)
        a = side 
        b = HorizonSide(mod(Int(side) + 2,4))
        mark_wrapper(a,b,r)          
    end
end

