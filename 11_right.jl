function main_11(r::Robot)
    sides = moveAndReturnDirections!(r)
    putmarkersOpposite!(r, sides)
    moveToStartplace!(r)
    moveToBeginplace!(r, sides)
end
function putmarkersOpposite!(r::Robot, sides::Vector{HorizonSide})
    arr = deepcopy(sides)
    x, y = countingCoordinate(arr)
    sides = [HorizonSide(i) for i in 3:-1:0] 
    for _ in 1:2
        for coord in (y, x)
            side = pop!(sides) 
            moves!(r, side, coord)
            putmarker!(r)
            n = movesAndCounting!(r, side)
            if coord == x
                x = n
            else
                y = n
            end
        end
    end
end
function moveAndReturnDirections!(r, direction_by_x::HorizonSide = Ost, direction_by_y::HorizonSide = Sud)::Vector{HorizonSide}
    arr_of_direction::Vector{HorizonSide} = []
    while !all(isborder(r, side) for side in (direction_by_x, direction_by_y))

        while !isborder(r, direction_by_x)
            move!(r, direction_by_x)
            push!(arr_of_direction, direction_by_x)
        end

        while !isborder(r, direction_by_y)
            move!(r, direction_by_y)
            push!(arr_of_direction, direction_by_y)
        end
    end
    return arr_of_direction
end
function countingCoordinate(sides::Vector{HorizonSide})::Tuple{Integer, Integer}
    arr = deepcopy(sides)
    x = 0
    y = 0
    while length(arr)>0
        a = pop!(arr)
        if a == Sud
            y+=1
        elseif a == Nord
            y-=1
        elseif a == Ost
            x+=1
        else
            x-=1
        end
    end
    return (x, y)
end
function moves!(r, side::HorizonSide)::Nothing
    while !isborder(r, side)
        move!(r, side)
    end
end
function moves!(r, side::HorizonSide, number::Integer)
    counter = 0
    for _ in 1:number
        if !isborder(r, side)
            move!(r, side)
            counter += 1
        else
            return number - counter
        end
    end
    return 0
end
function movesAndCounting!(r, side::HorizonSide)::Integer
    count = 0
    while !isborder(r, side)
        move!(r, side)
        count+=1
    end
    return count
end
function moveToStartplace!(r, direction_by_x::HorizonSide = Ost, direction_by_y::HorizonSide = Sud)::Nothing
    while !all(isborder(r, side) for side in (direction_by_x, direction_by_y))
        moves!(r, direction_by_x)
        moves!(r, direction_by_y)
    end
end
function moveToBeginplace!(r, stack_of_direction::Vector{HorizonSide})::Nothing
    while length(stack_of_direction) > 0
        move!(r, reversSide(pop!(stack_of_direction)))
    end
end
function reversSide(side::HorizonSide)::HorizonSide
    return HorizonSide((Int(deepcopy(side))+2)%4)
end