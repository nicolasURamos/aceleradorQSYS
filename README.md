# Atividade 4 - PSE

Organização: Individual ou em duplas.

Objetivo: Implementar e integrar ao processador NIOS um acelerador (composto de parte
operativa e parte de controle) para a função conv(x) descrita no código da Figura 1. Utilize
como apoio ao projeto o IP do multiplicador sequencial (multiciclo), cujo código fonte (VHDL)
está disponível sob o mesmo tópico desta especificação (obs.: não é permitido usar outros
multiplicadores, apenas o fornecido). Avaliar o desempenho da função executada com
suporte do acelerador em relação ao desempenho da mesma função executada puramente
em software sobre o processador NIOS.

Figura 1
int conv(int pixel[][]){ //pixel é uma matriz 3x3
int mask[3][3];
mask[0][0] = 1; mask[0][1] = 2; mask[0][2] = 1;
mask[1][0] = 0; mask[1][1] = 0; mask[1][2] = 0;
mask[2][0] = -1; mask[2][1] = -2; mask[2][2] = -1;
int i = 1; int j = 1;
int temp = (pixel[i-1][j-1] * mask[0][0]) + (pixel[i-1][j] * mask[0][1]) +
(pixel[i-1][j+1] * mask[0][2]) + (pixel[i][j-1] * mask[1][0]) +
( pixel[i][j] * mask[1][1]) + (pixel[i][j+1] * mask[1][2]) +
(pixel[i+1][j-1] * mask[2][0]) + (pixel[i+1][j] * mask[2][1]) +
(pixel[i+1][j+1] * mask[2][2]);
Return temp;
}

Apresentação: gravação de um vídeo (máx. 10 minutos de duração) abordando:
1. RTL da implementação, detalhando a implementação interna do acelerador, bem
como sua interface para comunicação com o processador.
2. Apresentação do código do acelerador (fiel ao RTL).
3. Simulação Modelsim do acelerador.
4. Apresentação do projeto Quartus completo (incluindo a parte feita no Qsys já
integrada ao acelerador).
5. Apresentação do código C demonstrando o correto funcionamento da interface
hardware-software.
6. Apresentação do percentual de adicional em área decorrente da integração do
acelerador ao restante do hardware.
7. Apresentação do percentual de aceleração (redução do tempo de execução)
decorrente do uso do acelerador.
8. Apresentação do percentual de aceleração (redução do tempo de execução)
decorrente do uso do acelerador como módulo de convolução na aplicação de
referência a ser disponibilizada (filtro de detecção de bordas de Sobel).
Peso e carga horária: 9,0 pontos na composição da nota referente ao item ASP descrito no
plano de ensino + vinte e quatro (24) horas relativas aos créditos EaD do componente
curricular.
Critérios para avaliação:
1. 20%: Desenvolvimento e apresentação do RTL da implementação, detalhando a
implementação interna do acelerador, bem como sua interface para comunicação
com o processador.
2. 20%: Apresentação do código do acelerador (fiel ao RTL).
3. 5%: Simulação Modelsim do acelerador.
4. 5%: Apresentação do projeto Quartus completo (incluindo a parte feita no Qsys já
integrada ao acelerador).
5. 20%: Apresentação do código C demonstrando o correto funcionamento da interface
hardware-software.
6. 30%: Apresentação da avaliação:
a. 5%: do percentual de adicional em área decorrente da integração do
acelerador ao restante do hardware.
b. 5%: Apresentação do percentual de aceleração (redução do tempo de
execução) decorrente do uso do acelerador.
c. 20%: Apresentação do percentual de aceleração (redução do tempo de
execução) decorrente do uso do acelerador na aplicação de referência a ser
disponibilizada (filtro de detecção de bordas de Sobel).
