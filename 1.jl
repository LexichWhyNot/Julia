using HorizonSideRobots
# a=0
# while !isborder(r,Sud)
# move!(r,Sud)
# end
# while !isborder(r,Ost)
#     move!(r,Ost)
# end
# while !isborder(r,Nord)
#     while !isborder(r,West)
#         putmarker!(r)
#         move!(r,West)
#        global a=a+1
#     end
#     putmarker!(r)
#     move!(r, Nord)
#     for i in 1:a
#         putmarker!(r)
#         move!(r,Ost)
#     end
#     move!(r,West)
#     global a=0
#     if !isborder(r,Nord)
#         move!(r,Nord)
#     end
#     if !isborder(r,West)
#         move!(r,West)
#     end
# end
# while !isborder(r,West)
#     putmarker!(r)
#     move!(r, West)
# end
# putmarker!(r)
y=0
x=0
xr=0
yr=0
while (!isborder(r,Nord) || !isborder(r,West))
    while !isborder(r,Nord) 
        move!(r,Nord)
        global y=y+1
    end
    while !isborder(r,West) 
        move!(r,West)
        global x=x+1
    end
end
function perimetr(side) 
    while !isborder(r,side)
    move!(r,side)
    end
end
putmarker!(r)
perimetr(Ost)
putmarker!(r)
perimetr(Sud)
putmarker!(r)
perimetr(West)
putmarker!(r)
perimetr(Nord)
while (xr!=x ||  yr!=y)
    while (yr!=y && !isborder(r,Sud))
        move!(r,Sud)
        global yr=yr+1
    end
    while (xr!=x && !isborder(r,Ost))
        move!(r,Ost)
        global xr=xr+1
    end
    while (yr!=y && !isborder(r,Nord))
        move!(r,Nord)
        global yr=yr-1
    end  
end





           