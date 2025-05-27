using DelimitedFiles
include("create_vector.jl")
include("SelectionSort.jl")
using .CreateVector
using .SelectionSort

function main()
  if length(ARGS) != 1
    return
  end

  n = parse(Int64, ARGS[1])
  array = create_random_vector(n)
  start_time = time()
  selection_sort!(array)
  end_time = time()
  println(end_time - start_time)
end  

main()
