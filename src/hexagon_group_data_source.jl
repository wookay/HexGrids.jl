struct Orientation
    forward::Array{Float64,2}
    backward::Array{Float64,2}
    startAngle::Float64
end

function Base.getproperty(T::Type{Orientation}, s::Symbol)
    if s === :pointed
        Orientation([sqrt(3.0) 0.0; sqrt(3.0)/2.0 3.0/2.0], [sqrt(3.0)/3.0 0.0; -1.0/3.0 2.0/3.0], 1.0/2.0)
    elseif s === :flat
        Orientation([3.0/2.0 sqrt(3.0)/2.0; 0.0 sqrt(3.0)], [2.0/3.0 -1.0/3.0; 0.0 sqrt(3.0)/3.0], 0.0)
    else
        getfield(T, s)
    end
end

struct Vector2
    x::Float64
    y::Float64
end

function Base.trunc(::Type{Int}, v::Vector2)
end

function Base.trunc(v::Vector2)
    r = trunc
    Vector2(r(v.x), r(v.y))
end

struct HexagonGroupDataSource
    coordinateSystem::CoordinateSystem
    groupOrigin::Vector2
    groupShape::GroupShape
    hexagonSize::Int
    hexagonScaleFactor::Float64
    hexagonOrientation::Orientation
end
