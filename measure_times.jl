module MeasureTimes

export measure_and_save_time

using DelimitedFiles
include("create_vector.jl") 
using .CreateVector

function measure_and_save_time(file::String; order::Symbol = :random, f::Function)
    all_averages = Float64[]

    for size in 100:100:30000
        times = Float64[]
        base_array = create_random_vector(size, order=order)
        for _ in 1:20
            array = copy(base_array)
            start_time = time()
            f(array)
            end_time = time()
            push!(times, end_time - start_time)
        end
        push!(all_averages, sum(times) / length(times))
    end

    writedlm(file, all_averages)
end

end # module