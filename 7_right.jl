function main_7(r)
    to_Sud=moves!(r,Sud)
    to_West=moves!(r,West)
    chess_parametr=to_Sud + to_West    
    if iseven(chess_parametr)==true 
        putmarker!(r)
    end
    side = Ost
    putmarkers!(r,side)
    while isborder(r,Nord)==false
       if ismarker(r)==false 
        move!(r,Nord)
        putmarker!(r)
       else
        move!(r,Nord)
       end 
        side=HorizonSide(mod(Int(side)+2, 4))
        putmarkers!(r,side)
    end
    back(r,Sud)
    back(r,West)
    moves!(r,Nord,to_Sud)
    moves!(r,Ost,to_West)
end    
function moves!(r::Robot, side::HorizonSide)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end
function putmarkers!(r::Robot, side::HorizonSide) 
    while isborder(r,side)==false
        check_of_marker(r,side)
    end
end
function check_of_marker(r::Robot,side::HorizonSide)
    if ismarker(r)==true
       move!(r,side)
    else
       move!(r,side)
       putmarker!(r)
    end   
end    
function back(r::Robot,side::HorizonSide) 
    while isborder(r,side)==false
        move!(r,side)
    end
end  
function moves!(r::Robot, side::HorizonSide, num_steps::Int) 
    for _ in 1:num_steps
        move!(r,side)
    end
end