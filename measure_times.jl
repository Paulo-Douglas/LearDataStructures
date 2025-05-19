module MeasureTimes

export measure_and_save_time

using DelimitedFiles

function measure_and_save_time(file::String, arr::Vector{T}, f::Function) where T<:Real
    all_averages = Float64[]

    for i in 100:100:10000
        times = Float64[]
        for _ in 1:20
            start_time = time()
            f(arr)
            end_time = time()
            elapsed = end_time - start_time
            push!(times, elapsed)
        end
        average = sum(times) / length(times)
        push!(all_averages, average)
    end
    
    writedlm(file, all_averages)
end

end #module