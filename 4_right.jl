function main_4(r::Robot)
    num_vert = moves!(r, Sud)
    num_hor = moves!(r, West)
    shirina=dlina(r)
    pokraska(r,shirina)
    moves_back!(r, Nord, num_vert)
    moves_back!(r, Ost, num_hor)
end
function moves_back!(r::Robot, side::HorizonSide, num_steps::Int)
    for _ in 1:num_steps
        move!(r, side)
    end
end
function moves!(r::Robot,side::HorizonSide)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end
function dlina(r)
    numSteps = 0
    while !isborder(r, Ost)
        putmarker!(r)
        move!(r, Ost)
        
        numSteps += 1
        
    end
    putmarker!(r)
    return numSteps
end
function pokraska(r::Robot, numSteps::Int)
    while !isborder(r, Nord)
        move!(r, Nord)
        West!(r)
        paint!(r, numSteps)
        numSteps -= 1
    end
    for side in (Sud, West)
        while !isborder(r, side)
            move!(r, side)
         end 
    end
end   
function West!(r::Robot)
    while !isborder(r, West)
        move!(r, West)
    end
end
    
function paint!(r::Robot, numSteps)
    num = numSteps
    while num != 0 
        putmarker!(r)
        num -= 1
        move!(r, Ost)
    end
end
