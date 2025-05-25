#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m'

help=" ${GREEN}USO:${NC}
  ${CYAN}$0 <executions> <size-start> <size-pass> <size-end> <program-file> <name>${NC}

${YELLOW}Parâmetros:${NC}
  <executions>    - número de execuções por valor de n
  <size-start>    - tamanho inicial do problema (n)
  <size-pass>     - incremento do tamanho do problema
  <size-end>      - tamanho final do problema
  <program_file>  - arquivo do programa (.c, .py ou .jl)
  <name>          - base para os arquivos de saída

${YELLOW}Exemplo:${NC}
  $0 5 100 100 500 ./meuprograma 'teste'
"

if [ $# -ne 6 ]; then
  echo -e "$help"
  exit 1
fi

ext="${5##*.}"

if [ $ext = "c" ]; then
  gcc $5 -o prog_executavel
  if [ $? -ne 0 ]; then
    echo -e "${RED}Erro na compilação do programa C${NC}"
    exit 1
  fi
fi

for n in $(seq $2 $3 $4); do
  file=$6-$1-$n.txt
  echo -n >$file

  for i in $(seq $1); do
    case $ext in
    c)
      ./prog_executavel $n >>$file
      ;;
    py)
      python3 $5 >>$file
      ;;
    jl)
      julia $5 >>$file
      ;;
    *)
      echo -e "${RED}Extensão $ext não suportada."
      exit 1
      ;;
    esac
  done
done

if [ $ext = "c" ]; then
  rm -f prog_executavel
fi
