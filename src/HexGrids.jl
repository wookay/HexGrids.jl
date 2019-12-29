module HexGrids

export Hex, distance
include("hex.jl")

export CoordinateSystem, TopRight, BottomRight
include("coordinate_system.jl")

export GroupShape
include("group_shape.jl")

export HexagonGroup, Pointed, Flat, direction_for, neighbor_at, neighbor_in
include("direction.jl")

end # module HexGrids
