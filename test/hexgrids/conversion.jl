module test_hexgrids_conversion

using Test
using HexGrids

function StubDataSource(hexagonOrientation=Orientation.flat)::HexagonGroupDataSource
    coordinateSystem = CoordinateSystem(BottomRight)
    groupOrigin = Vector2(0, 0)
    groupShape = GroupShape.hexagon(radius=15)
    hexagonSize = 5
    hexagonScaleFactor = 1
    HexagonGroupDataSource(coordinateSystem, groupOrigin, groupShape, hexagonSize, hexagonScaleFactor, hexagonOrientation)
end

forward = Orientation.pointed.forward
@test forward[1] == sqrt(3.0)
@test forward[2] == sqrt(3.0)/2.0
@test forward[3] == 0.0
@test forward[4] == 3.0/2.0

backward = Orientation.pointed.backward
@test backward[1] == sqrt(3.0)/3.0
@test backward[2] == -1.0/3.0
@test backward[3] == 0.0
@test backward[4] == 2.0/3.0

forward = Orientation.flat.forward
@test forward[1] == 3.0/2.0
@test forward[2] == 0.0
@test forward[3] == sqrt(3.0)/2.0
@test forward[4] == sqrt(3.0)

backward = Orientation.flat.backward
@test backward[1] == 2.0/3.0
@test backward[2] == 0.0
@test backward[3] == -1.0/3.0
@test backward[4] == sqrt(3.0)/3.0

hex = Hex(q=0, r=0, s=0)
pixel = Conversion.hex_to_pixel(hex, StubDataSource())
@test pixel == Vector2(0, 0)

hex = Hex(q=1, r=-1, s=0)
pixel = Conversion.hex_to_pixel(hex, StubDataSource())
@test trunc(pixel) == Vector2(7, -4)

pixel = Conversion.hex_to_pixel(hex, StubDataSource(Orientation.pointed))
@test trunc(pixel) == Vector2(4, -7)

touchPosition = Vector2(0, 0)
hex = Conversion.pixel_to_hex(touchPosition, StubDataSource(Orientation.pointed))
@test hex == Hex(q=0.0, r=0.0, s=0.0)

touchPosition = Vector2(3.56, -42.081)
hex = Conversion.pixel_to_hex(touchPosition, StubDataSource(Orientation.pointed))
@test hex == Hex(q=3.2164733916630133, r=-5.610799999999999, s=2.394326608336986)

end # module test_hexgrids_conversion
