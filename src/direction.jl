# module HexGrids

const bottomCoordinateDirections = [Hex(q=0, r=1, s=-1),
                                    Hex(q=-1, r=1, s=0),
                                    Hex(q=-1, r=0, s=1),
                                    Hex(q=0, r=-1, s=1),
                                    Hex(q=1, r=-1, s=0),
                                    Hex(q=1, r=0, s=-1)]

const topCoordinateDirections = [Hex(q=0, r=-1, s=1),
                                 Hex(q=-1, r=0, s=1),
                                 Hex(q=-1, r=1, s=0),
                                 Hex(q=0, r=1, s=-1),
                                 Hex(q=1, r=0, s=-1),
                                 Hex(q=1, r=-1, s=0)]

function direction_for(hex::Hex, antiClockwisePosition::Int, coordinateSystem::CoordinateSystem)::Hex
    if 1 <= antiClockwisePosition <= 6
        coordinateSystem.toward == BottomRight && return bottomCoordinateDirections[antiClockwisePosition]
        return topCoordinateDirections[antiClockwisePosition]
    end
    hex
end

function neighbor_at(hex::Hex, antiClockwisePosition::Int, coordinateSystem::CoordinateSystem)::Hex
    return hex + direction_for(hex, antiClockwisePosition, coordinateSystem)
end

struct Direction
    index::Int
end

function Base.getproperty(T::Type{Direction}, s::Symbol)
    onetosix = (:one, :two, :three, :four, :five, :six)
    if s in onetosix
        Direction(findfirst(isequal(s), onetosix))
    else
        getfield(T, s)
    end
end

function neighbor_at(hex::Hex, direction::Direction, coordinateSystem::CoordinateSystem)::Hex
    neighbor_at(hex, direction.index, coordinateSystem)
end

module Pointed
using ..HexGrids: Direction
const northWest = Direction.one
const west      = Direction.two
const southWest = Direction.three
const southEast = Direction.four
const east      = Direction.five
const northEast = Direction.six
end # module Pointed

module Flat
using ..HexGrids: Direction
const north     = Direction.one
const northWest = Direction.two
const southWest = Direction.three
const south     = Direction.four
const southEast = Direction.five
const northEast = Direction.six
end # module Flat

struct HexagonGroup
    coordinateSystem::CoordinateSystem
end

function neighbor_in(group::HexagonGroup, direction::Direction, hex::Hex)::Hex
    return neighbor_at(hex, direction.index, group.coordinateSystem)
end

# module HexGrids
