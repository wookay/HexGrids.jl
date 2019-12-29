module Conversion # HexGrids

using ..HexGrids: Hex, HexagonGroupDataSource, Vector2

function hex_to_pixel(hex::Hex, dataSource::HexagonGroupDataSource)::Vector2
    x = (dataSource.hexagonOrientation.forward[1] * hex.q + dataSource.hexagonOrientation.forward[2] * hex.r) * dataSource.hexagonSize
    y = (dataSource.hexagonOrientation.forward[3] * hex.q + dataSource.hexagonOrientation.forward[4] * hex.r) * dataSource.hexagonSize * Int(dataSource.coordinateSystem.toward)
    return Vector2(x + dataSource.groupOrigin.x, y + dataSource.groupOrigin.y)
end

function pixel_to_hex(pixel::Vector2, dataSource::HexagonGroupDataSource)::Hex
    point = Vector2((pixel.x - dataSource.groupOrigin.x) / dataSource.hexagonSize,
                    (pixel.y - dataSource.groupOrigin.y) / dataSource.hexagonSize * Int(dataSource.coordinateSystem.toward))
    q = dataSource.hexagonOrientation.backward[1] * point.x + dataSource.hexagonOrientation.backward[2] * point.y
    r = dataSource.hexagonOrientation.backward[3] * point.x + dataSource.hexagonOrientation.backward[4] * point.y
    return Hex(q=q, r=r, s=-q - r)
end

end # module HexGrids.Conversion
