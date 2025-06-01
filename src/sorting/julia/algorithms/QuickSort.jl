module QuickSort

export quick_sort!, quick_sort_wrapper!

function quick_sort!(v::Vector{T}, s::Int64, e::Int64) where T<:Real
    if s < e
        p = partition!(v,s,e)
        quick_sort!(v, s, p - 1)
        quick_sort!(v, p + 1, e)
    end
end

function partition!(v::Vector{T}, s::Int64, e::Int64) where T<:Real
    d = s - 1
    for i in s:(e-1)
        if v[i] <= v[e]
            d = d + 1
            v[d], v[i] = v[i], v[d]
        end
    end    
    v[d+1], v[e], v[e], v[d+1]
    return d+1    
end

function quick_sort_wrapper!(v::Vector{T}) where T<:Real
    quick_sort!(v, 1, length(v))
end

end # module