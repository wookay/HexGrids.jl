module test_hexgrids_direction

using Test
using HexGrids

const expectedDirectionOrder = [Hex(q=0, r=1, s=-1),
                                Hex(q=1, r=0, s=-1),
                                Hex(q=1, r=-1, s=0),
                                Hex(q=0, r=-1, s=1),
                                Hex(q=-1, r=0, s=1),
                                Hex(q=-1, r=1, s=0)]

group = HexagonGroup(CoordinateSystem(BottomRight))
hex = zero(Hex)

@test neighbor_in(group, Pointed.northWest, hex) == expectedDirectionOrder[1]
@test neighbor_in(group, Pointed.northEast, hex) == expectedDirectionOrder[2]
@test neighbor_in(group, Pointed.east, hex)      == expectedDirectionOrder[3]
@test neighbor_in(group, Pointed.southEast, hex) == expectedDirectionOrder[4]
@test neighbor_in(group, Pointed.southWest, hex) == expectedDirectionOrder[5]
@test neighbor_in(group, Pointed.west, hex)      == expectedDirectionOrder[6]

@test neighbor_in(group, Flat.north, hex)        == expectedDirectionOrder[1]
@test neighbor_in(group, Flat.northEast, hex)    == expectedDirectionOrder[2]
@test neighbor_in(group, Flat.southEast, hex)    == expectedDirectionOrder[3]
@test neighbor_in(group, Flat.south, hex)        == expectedDirectionOrder[4]
@test neighbor_in(group, Flat.southWest, hex)    == expectedDirectionOrder[5]
@test neighbor_in(group, Flat.northWest, hex)    == expectedDirectionOrder[6]

end # module test_hexgrids_direction
