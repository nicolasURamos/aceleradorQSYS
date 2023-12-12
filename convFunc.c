#include <stdio.h>
#include <time.h>

int conv(int pixel[3][3]) {
    int mask[3][3] = {{1, 2, 1}, {0, 0, 0}, {-1, -2, -1}};
    int i = 1, j = 1;
    int temp = 0;

    for (int di = -1; di <= 1; di++) {
        for (int dj = -1; dj <= 1; dj++) {
            temp += pixel[i+di][j+dj] * mask[di+1][dj+1];
        }
    }

    return temp;
}

int main() {
    int pixel[3][3] = {{255, 255, 255}, {255, 255, 255}, {255, 255, 255}};
    
    clock_t start, end;
    double cpu_time_used;
    int result = 0;

    start = clock();

    for (int n = 0; n < 10000000; n++) { // Execute a função 10.000.000 de vezes
        pixel[1][1] = n % 255;
        result = conv(pixel);
    }

    end = clock();

    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;

    printf("Resultado da convolucao: %d\n", result);
    printf("Tempo de execucao: %f segundos\n", cpu_time_used);

    return 0;
}
