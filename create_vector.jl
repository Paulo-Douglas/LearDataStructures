using Random

function create_random_vector(n::Int; max::Int=100, order::Symbol=:random, invert::Bool=false)
    vec = rand(1:max, n)

    if order == :ordered
        sort!(vec)
    end

    if invert
        sort!(vec, rev=true)
    end

    return vec
end