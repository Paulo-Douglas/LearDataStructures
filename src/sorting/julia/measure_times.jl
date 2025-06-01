module MeasureTimes

export measure_and_save_time

include("create_vector.jl") 
using .CreateVector

using DelimitedFiles    

function measure_and_save_time(file::String;
                                order::Symbol = :random,
                                f::Function,
                                invert::Bool=false,
                                step::Int=100,
                                max_size::Int=1000,
                                repetitions::Int=1000)

    all_averages = Float64[]

    for size in step:step:max_size
        times = Float64[]
        base_array = create_random_vector(size, order=order, invert=invert)
        for _ in 1:repetitions
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
