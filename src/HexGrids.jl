module HexGrids

export Hex, distance
include("hex.jl")

export CoordinateSystem, TopRight, BottomRight
include("coordinate_system.jl")

export GroupShape
include("group_shape.jl")

export HexagonGroup, Pointed, Flat, direction_for, neighbor_at, neighbor_in
include("direction.jl")

export HexagonGroupDataSource, Orientation, Vector2
include("hexagon_group_data_source.jl")

export Conversion
include("Conversion.jl")

end # module HexGrids
