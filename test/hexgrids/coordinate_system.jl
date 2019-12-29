module test_hexgrids_coordinate_system

using Test
using HexGrids

coordinateSystem = CoordinateSystem(BottomRight)
@test Int(coordinateSystem.toward) == 1

end # module test_hexgrids_coordinate_system
