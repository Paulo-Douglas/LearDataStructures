include("../measure_times.jl")
using .MeasureTimes

function distribution_sort!(v::Vector{Int})
    n = length(v)
    s = minimum(v)
    b = maximum(v)

    c = fill(0, b - s + 1)

    for i in 1:n
        c[v[i] - s + 1] += 1
    end

    m = length(c)
    for i in 2:m
        c[i] += c[i - 1]
    end

    w = similar(v)

    for i in n:-1:1
        d = v[i] - s + 1
        w[c[d]] = v[i]
        c[d] -= 1
    end

    for i in 1:n
        v[i] = w[i]
    end
end

measure_and_save_time(joinpath(@__DIR__, "data", "times", "times_distribution-100-100-1000.txt"), f=distribution_sort!)