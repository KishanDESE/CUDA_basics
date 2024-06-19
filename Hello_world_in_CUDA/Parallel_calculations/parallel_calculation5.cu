/*

Limits on the Jetson Nano


The specific limits for the Jetson Nano are determined by its CUDA capability. The Jetson Nano has a Maxwell GPU with CUDA Compute Capability 5.3. Here are the typical limits:

Threads per Block: Up to 1024 threads per block.
Block Dimensions:
In each dimension, a block can have a maximum size of 1024 threads (x, y, z).
Typical configurations are up to (1024, 1, 1) for 1D, (32, 32, 1) for 2D, and (16, 16, 4) for 3D blocks.
Grid Dimensions:
The maximum size of a grid dimension can be up to 2^31-1 (2147483647) in each dimension, but practical limits are based on the available GPU resources and memory.
*/

#include <stdio.h>
#include <cuda.h>

__global__ void dkernel(){
if(	threadIdx.x==0&&blockIdx.x==0&&
	threadIdx.y==0&&blockIdx.y==0&&
	threadIdx.z==0&&blockIdx.z==0){
		printf("gridDim.x : %d,gridDim.y : %d,gridDim.z %d\nblockDim.x : %d,blockDim.y : %d,blockDim.z : %d\n",
gridDim.x,gridDim.y,gridDim.z,
blockDim.x,blockDim.y,blockDim.z);
}
}
int main(){
	dim3 grid(2,3,4);	//2*3*4 blocks
	dim3 block(1,5,3);	//1*5*3 threads

	dkernel<<<grid,block>>>();
	cudaDeviceSynchronize();
	

return 0;
}
