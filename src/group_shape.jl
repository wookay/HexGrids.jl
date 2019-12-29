# module HexGrids

struct GroupShape
    name::Symbol
    args::Tuple
end

function Base.getproperty(T::Type{GroupShape}, s::Symbol)
    if s === :single
        GroupShape(s, ())
    elseif s === :hexagon
        (; radius::Int) -> GroupShape(s, (radius,))
    elseif s === :parallelogram
        (; width::Int, height::Int) -> GroupShape(s, (width, height))
    else
        getfield(T, s)
    end
end

# module HexGrids
