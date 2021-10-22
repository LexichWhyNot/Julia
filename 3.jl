function corner(r::Robot)
    while !isborder(r, Sud)
        move!(r,Sud)
    end
    while !isborder(r, West)
        move!(r,West)
    end
end

function inverse(side::HorizonSide)
    return HorizonSide(mod(Int(side)+2, 4))
end
corner(r)
function All(r::Robot, side::HorizonSide)
    while !isborder(r,Nord)
        while !isborder(r,side)
            putmarker!(r)
            move!(r,side)
        end
        inverse(side)
    end
end

All(r,Ost)
