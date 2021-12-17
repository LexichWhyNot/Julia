function main_12(r, n)
    count_y = goToBorder(r, Sud)
    count_x = goToBorder(r, West)
   x, y = 0, 0
   moveAndMark(r, x, y, n)
    while !isborder(r, Nord)
        move!(r, Nord)
        y += 1
        moveAndMark(r, x, y, n)
    end
    goToBorder(r, Sud)
    goToBorder(r, West)   
    goBack(count_x, count_y)
end
function goToBorder(r, side)
    count = 0
    while(!isborder(r, side))
        move!(r, side)
        count += 1
    end
    return count
end
function inverseSide(side)
    return HorizonSide((Int(side) + 2) % 4)
end
function moveAndMark(r, x, y, n)
    if check(x, y, n)
        putmarker!(r)
    end  
    while !isborder(r, Ost)
        x += 1
        move!(r, Ost)       
        if check(x, y, n)
            putmarker!(r)
        end
    end
    goToBorder(r, West)
    x = 0
end
function check(x, y, n)
    return (div(x, n) + div(y, n)) % 2 == 0
end
function goBack(a, b)
    for i = 1:a
        move!(r, Ost)
    end
    for j = 1:b
        move!(r, Nord)
    end
end
