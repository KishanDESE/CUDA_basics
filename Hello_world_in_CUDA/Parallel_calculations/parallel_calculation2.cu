#include <stdio.h>
#include <cuda.h>


#define N 30


__global__ void gpufun(int *a){

  // ThreadIdx.x gives the unique identifier of each thread within a block
  a[threadIdx.x] = threadIdx.x * threadIdx.x;

}


int main(){
  int a[N]; // Allocate memory on host (CPU) that can be accessed by GPU

  gpufun<<<1,N>>>(a); // Launch the kernel with one block and N threads

  // Access and print the results directly from the host memory (a)
  for(int i=0;i<N;i++)
      printf("%d\t", a[i]);

  return 0;
}

