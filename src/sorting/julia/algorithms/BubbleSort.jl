module BubbleSort

export bubble_sort!

function bubble_sort!(v::Vector{T}) where T<:Real
    n = length(v)
    for i in 1:n-1
        trocou = false
        for j in 1:n-i
            if v[j] > v[j + 1]
                v[j], v[j + 1] = v[j + 1], v[j]
                trocou = true
            end
        end

        if !trocou
            break
        end
    end
end

end