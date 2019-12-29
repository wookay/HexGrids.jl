# module HexGrids

@enum CoordinateSystemIncreaseToward begin
    TopRight = -1
    BottomRight = 1
end

struct CoordinateSystem
    toward::CoordinateSystemIncreaseToward
end

# module HexGrids
