#include <stdio.h>
#include <cuda.h>

__global__ void dkernel(){ //__global__ indicate it is not normal kernel function but for GPU
printf("Hello world \n");
}


int main (){
dkernel <<<1,1>>>();

//<<<no. of blocks,no. of threads in in block>>>


cudaDeviceSynchronize(); //Tells GPU to do all work than synchronize GPU buffer with CPU.

return 0;

}
