#include <stdio.h>
#include <cuda.h>

__global__ void dkernel(){ //__global__ indicate it is not normal kernel function but for GPU
printf("Hello world on GPU \n");
}


int main (){
	dkernel <<<1,1>>>(); //<<<no. of blocks,no. of threads in block>>>
	dkernel <<<1,1>>>(); //Kernels (by default) are executed one after another. CPU launches them and move ahead.
	

	dkernel<<<1,32>>>(); //1 block 32 threads





		printf("Hello world 1 on CPU \n"); //CPU is not waiting for syncing GPU buffer. So anywhere possible. But mostly CPU operate faster kernel so print is before.

	cudaDeviceSynchronize(); //Tells GPU to do all work than synchronize GPU buffer with CPU.


		printf("Hello world 2 on CPU \n"); //After sync it will first executed GPU part than next lines of main code. 

return 0;

}
