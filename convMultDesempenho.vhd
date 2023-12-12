#include <stdio.h>
#include "system.h"
#include "altera_avalon_performance_counter.h"

int main() {
    // Inicializa os dados de entrada para conv_module
    // ...

    PERF_RESET(PERFORMANCE_COUNTER_0_BASE);
    PERF_START_MEASURING(PERFORMANCE_COUNTER_0_BASE);
    PERF_BEGIN(PERFORMANCE_COUNTER_0_BASE, 1);

    // Aciona o módulo conv_module
    // ...

    PERF_END(PERFORMANCE_COUNTER_0_BASE, 1);
    PERF_STOP_MEASURING(PERFORMANCE_COUNTER_0_BASE);

    perf_print_formatted_report((void*) PERFORMANCE_COUNTER_0_BASE, 
                                ALT_CPU_FREQ, // Frequência do processador
                                1, "Convolution");

    return 0;
}

/*

1- Integre o Módulo VHDL em um Sistema NIOS II: No Qsys, 
adicione seu módulo conv_module como um componente personalizado ao seu sistema NIOS II.

2- Utilize o Performance Counter do NIOS II: Escreva um programa em C que roda no NIOS II, 
aciona o módulo conv_module, e utiliza o contador de desempenho para medir o tempo que leva para 
executar a operação de convolução.


Observações:

Ambientes de Execução: O ambiente de execução do código C é geralmente um PC ou um ambiente de simulação, 
enquanto o código VHDL com o acelerador é executado em um FPGA como parte de um sistema integrado.

Precisão da Medição: A precisão da medição de desempenho pode variar significativamente entre o ambiente de 
software e de hardware. No hardware, o desempenho é frequentemente afetado por fatores como a frequência do clock, 
latência do barramento e sincronização com outros componentes do sistema.

Configuração do Sistema: Para o código VHDL, a medição do desempenho só faz sentido quando o módulo conv_module está 
corretamente integrado e configurado dentro de um sistema maior, como um sistema NIOS II no Quartus II.

