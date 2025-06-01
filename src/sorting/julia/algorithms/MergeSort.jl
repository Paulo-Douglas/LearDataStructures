include("../measure_times.jl")
using .MeasureTimes

function merge_sort!(v::Vector{T}, s::Int, e::Int) where T
    if s < e
        m = (s + e) ÷ 2
        merge_sort!(v, s, m)
        merge_sort!(v, m + 1, e)
        merge!(v, s, m, e)
    end
end

function merge!(v::Vector{T}, s::Int, m::Int, e::Int) where T
    p = s
    q = m + 1
    w = Vector{T}(undef, e - s + 1)

    for i in 1:(e - s + 1)
        if q > e || (p <= m && v[p] < v[q])
            w[i] = v[p]
            p += 1
        else
            w[i] = v[q]
            q += 1
        end
    end

    for i in 1:(e - s + 1)
        v[s + i - 1] = w[i]
    end
end

function merge_sort_wrapper!(v::Vector{T}) where T<:Real
    merge_sort!(v, 1, length(v))
end

measure_and_save_time(joinpath(@__DIR__, "data", "times", "times_merge_100-100-1000.txt"), f=merge_sort_wrapper!)