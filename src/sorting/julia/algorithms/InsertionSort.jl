include("measure_times.jl")
using .MeasureTimes

function insertion_sort!(arr)
    n = length(arr)
    for i in 2:n
        key = arr[i]
        j = i - 1
        while j >= 1 && arr[j] > key
            arr[j + 1] = arr[j]
            j -= 1
        end
        arr[j + 1] = key
    end
    return arr
end

measure_and_save_time(joinpath(@__DIR__, "data", "times", "times_insertion-100-100-1000-10000-W.txt"); f=insertion_sort!, invert=true)