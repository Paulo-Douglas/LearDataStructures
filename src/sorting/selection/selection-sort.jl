module selection_sort

export selection_sort!

function selection_sort!(arr::Vector{T}) where T<:Real
    n = length(arr)
    for i in 1:n-1
        min_index = i
        for j in i+1:n
            if arr[j] < arr[min_index]
                min_index = j
            end
        end
        arr[i], arr[min_index] = arr[min_index], arr[i]
    end
end

end