
function main_2(r::Robot)
num_hor = moves!(r, Ost)
perimetr(r);
moves_back!(r, West,num_hor)
end
function perimetr(r::Robot);
for i in [0, 1, 2, 3, 4]
    while !isborder(r, HorizonSide(mod(i, 4))) 
        move!(r, HorizonSide(mod(i, 4)))
        if ismarker(r)
            break
        end
        putmarker!(r)
    end 
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
function moves_back!(r::Robot, side::HorizonSide, num_steps::Int)
    for _ in 1:num_steps
        move!(r, side)
    end
end
