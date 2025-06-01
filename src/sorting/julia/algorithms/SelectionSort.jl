include("measure_times.jl")
using .MeasureTimes

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

measure_and_save_time(joinpath(@__DIR__, "data", "times_selection-100-100-1000.txt"); f=selection_sort!)