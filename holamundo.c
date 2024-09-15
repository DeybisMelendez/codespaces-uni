// Para ejecutar puede escribir en la terminal:
// sh runc.sh holamundo
// O bien hacerlo manualmente con make:
// make holamundo && ./holamundo && rm -f holamundo
// Ejecutando con clang:
// clang holamundo.c && ./a.out && rm -f a.out
// Ejecutando con gcc:
// gcc holamundo.c && ./a.out && rm -f a.out

#include <stdio.h>

int main(void) {
    printf("Hola mundo\n");
    return 0;
}