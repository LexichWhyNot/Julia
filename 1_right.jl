function main_1(r::Robot)
    for side in (Nord, West, Sud, Ost)
        putMarker(r, side)
        returnBack(r, inverse(side))
    end
    putmarker!(r)
end
function inverse(Side::HorizonSide)
    return HorizonSide((mod(Int(Side)+2, 4)))
end
function putMarker(r, side)
    while !isborder(r, side)
        move!(r, side)
        putmarker!(r)
    end
end
function returnBack(r, side)
    while ismarker(r)
        move!(r, side)
    end
end
