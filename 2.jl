function move2top(rob)
    while !isborder(rob,Nord)
        move!(rob,Nord)
        global noth=north+1;
    end
    while !isborder(rob,Ost)
        move!(rob,Ost)   
        global east=east+1;    
    end
end
move2top(r)
function border(a,rob)
    while !isborder(rob,a)
        move!(rob,a)
        putmarker!(rob)
    end
end
function back(rob, north, east)
    for i in north
    move!(rob,Nord)
    for i in east
    move!(rob,Ost)
end

for side in (Sud,West,Nord,Ost)
    border(side,r)
    back(r, north, east)
end 