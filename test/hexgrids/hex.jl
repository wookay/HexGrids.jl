module test_hexgrids_hex

using Test
using HexGrids

x = Hex(q=5, r=10, s=15)
y = Hex(q=1, r=3, s=3)

@test x + y == Hex(q=6, r=13, s=18)

end # module test_hexgrids_hex
