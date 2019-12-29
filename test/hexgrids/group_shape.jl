module test_hexgrids_group_shape

using Test
using HexGrids

@test GroupShape.single == GroupShape(:single, ())
@test GroupShape.hexagon(radius=15) == GroupShape(:hexagon, (15,))
@test GroupShape.parallelogram(width=1, height=1) == GroupShape(:parallelogram, (1, 1))

end # module test_hexgrids_group_shape
