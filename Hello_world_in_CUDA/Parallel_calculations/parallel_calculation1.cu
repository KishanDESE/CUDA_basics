#include <stdio.h>
#include <cuda.h>


#define N 30




void normal_cpu_fun(int *a){
	for(int i =0; i < N; i++)
		a[i] = i*i;

}


__global__ void gpufun(int *a){

	a[threadIdx.x] = threadIdx.x * threadIdx.x;

}


int main(){
	int a[N]; //Can not pass directly array in CPU memory to GPU memory

	int * da; //Pointer on CPU pointing memory on GPU

	cudaMalloc(&da,N*sizeof(int));
	
	gpufun<<<1,N>>>(da); //da passed by value

	cudaMemcpy(a,da,N*sizeof(int),cudaMemcpyDeviceToHost); //Transfer data cpu to gpu or gpu to cpu

	for(int i=0;i<N;i++)
		printf("%d\t",a[i]); //done on cpu

//No cudaDeviceSynchronize
//Because cudaMemcpy will will block CPU proccess to get GPU data.
//cudaMemcpy is dependent on PCIe express bus


return 0;
}

