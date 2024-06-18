#include <stdio.h>
#include <cuda.h>

#define N 30

__global__ void gpufun(int *a) {
    // ThreadIdx.x gives the unique identifier of each thread within a block
    a[threadIdx.x] = threadIdx.x * threadIdx.x;
}

int main() {

//Unified Memory: Even though Jetson Nano supports unified memory, you need to use specific CUDA functions to allocate unified memory.

    int *a;

    // Allocate unified memory that can be accessed by both the host and the device
    cudaMallocManaged(&a, N * sizeof(int));

    gpufun<<<1, N>>>(a); // Launch the kernel with one block and N threads

    // Wait for GPU to finish before accessing on host
    cudaDeviceSynchronize();

    // Access and print the results directly from the unified memory
    for(int i = 0; i < N; i++)
        printf("%d\t", a[i]);

    // Free the unified memory
    cudaFree(a);

    return 0;
}

