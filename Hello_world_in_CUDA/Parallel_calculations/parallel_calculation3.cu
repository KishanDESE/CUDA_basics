#include <stdio.h>
#include <cuda.h>


#define N 30


__global__ void gpufun(int *a){

  a[threadIdx.x] = threadIdx.x * threadIdx.x;

}


int main(){
  int * da; 

	cudaMalloc(&da,N*sizeof(int));//lets allocate memory in GPU


  gpufun<<<1,N>>>(da); 

	
  for(int i=0;i<N;i++)
      printf("%d\t", da[i]);

  return 0;
}

