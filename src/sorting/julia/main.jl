include("measure_times.jl")
using .MeasureTimes

# inclui os algoritmos de ordenação
include("algorithms/DistributionSort.jl")
include("algorithms/InsertionSort.jl")
include("algorithms/MergeSort.jl")
include("algorithms/QuickSort.jl")
include("algorithms/SelectionSort.jl")
using .DistributionSort
using .InsertionSort
using .MergeSort
using .QuickSort
using .SelectionSort

const GREEN = "\e[32m"
const CYAN  = "\e[36m"
const YELLOW = "\e[33m"
const NC = "\e[0m"  # reset color

const algorithms = Dict(
    "DistributionSort" => distribution_sort!,
    "InsertionSort" => insertion_sort!,
    "MergeSort" => merge_sort_wrapper!,
    "QuickSort" => quick_sort_wrapper!,
    "SelectionSort" => selection_sort!
)

function help_message()
    return """
        \n
        $(GREEN)USO:$(NC)
        $(CYAN)julia main.jl <file> <order> <invert> <step> <max-size> <repetitions> <function> $(NC)

        $(YELLOW)Parâmetros:$(NC)
        <file>          - nome do arquivo de saída
        <order>         - tipo de ordenação do vetor base (:random ou :ordered)
        <invert>        - ordena o vetor base e inverte ele (true ou false)
        <step>          - tamanho inicial do problema (n) e incremento do tamanho do problema
        <max-size>      - tamanho final do problema
        <repetitions>   - número de execuções por valor de n
        <function>      - nome da função que irá utilizar

        $(YELLOW)Exemplo:$(NC)
        julia main.jl data/times/times_distribution-100-100-1000.txt :ordered false 100 1000 10000 DistributionSort
        """
end

if length(Base.ARGS) < 7
    println(help_message())
    exit(1)
end

file = Base.ARGS[1]
order = Symbol(Base.ARGS[2])
invert = Base.ARGS[3] == "true"
step = parse(Int, Base.ARGS[4])
max_size = parse(Int, Base.ARGS[5])
repetitions = parse(Int, Base.ARGS[6])
algorithm_name = Base.ARGS[7]

if haskey(algorithms, algorithm_name)
    algorithm_fn = algorithms[algorithm_name]
else
    error("Algoritmo '$algorithm_name' não reconhecido")
end

measure_and_save_time(file;
                        order=order,
                        invert=invert,
                        step=step,
                        max_size=max_size,
                        repetitions=repetitions,
                        f=algorithm_fn)