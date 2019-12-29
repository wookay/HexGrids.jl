module test_hexgrids_relational

using Test
using HexGrids

x = Hex(q=2, r=4, s=6)
@test length(x) == 6

x = Hex(q=0, r=0, s=0)
y = Hex(q=0, r=0, s=0)
@test distance(x, y) == 0

x = Hex(q=2, r=-8, s=2)
y = Hex(q=-2, r=3, s=1)
@test distance(x, y) == 8

origin = Hex(q=1, r=2, s=3)
coordinateSystem = CoordinateSystem(BottomRight)

negative = direction_for(origin, -1, coordinateSystem)
@test negative == origin
large = direction_for(origin, 10, coordinateSystem)
@test large == origin

origin = Hex(q=1, r=-3, s=2)
@test neighbor_at(origin, 1, coordinateSystem) == Hex(q=1, r=-2, s=1)
@test neighbor_at(origin, 2, coordinateSystem) == Hex(q=0, r=-2, s=2)
@test neighbor_at(origin, 3, coordinateSystem) == Hex(q=0, r=-3, s=3)
@test neighbor_at(origin, 4, coordinateSystem) == Hex(q=1, r=-4, s=3)
@test neighbor_at(origin, 5, coordinateSystem) == Hex(q=2, r=-4, s=2)
@test neighbor_at(origin, 6, coordinateSystem) == Hex(q=2, r=-3, s=1)

end # module test_hexgrids_relational
