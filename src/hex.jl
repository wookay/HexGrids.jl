# module HexGrids

struct Hex{T}
    q::T
    r::T
    s::T
    function Hex(; q, r, s)
        (q1, r1, s1) = promote(q, r, s)
        new{eltype(q1)}(q1, r1, s1)
    end
    function Hex{T}(; q::T, r::T, s::T) where T
        new{T}(q, r, s)
    end
end

function Base.length(hex::Hex)
    round(Int, sum(abs.((hex.q, hex.r, hex.s))) / 2)
end

function Base.zero(::Type{Hex})::Hex
    Hex(q=0, r=0, s=0)
end

function distance(a::Hex, b::Hex)
    length(a - b)
end

for op in (:+, :-, :*, :/)
    @eval begin
        function (Base.$op)(a::Hex, b::Hex)
            Hex(q=$op(a.q, b.q), r=$op(a.r, b.r), s=$op(a.s, b.s))
        end
    end
end

function Base.:(==)(a::Hex, b::Hex)::Bool
    a.q == b.q && a.r == b.r && a.s == b.s
end

# module HexGrids
