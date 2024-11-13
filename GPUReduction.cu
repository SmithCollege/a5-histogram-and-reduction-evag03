#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/time.h>

#define SIZE 100

__global__ void Reduction(int* input, int* output, int operation) {
  // Stride is distance to the next value being
  // accumulated into the threads mapped position
  // in the partialSum[] aray
  /*
  for (unsigned int stride = 1; stride <= blockDim.x; stride *= 2) {
    __syncthreads();
    
    if (t % stride == 0) {
      partialSum[2*t]+= partialSum[2*t+stride]; 
    }
  } 
  */

  // Sum Operation
  if (operation == 0) {
    for (unsigned int stride = 1; stride <= SIZE; stride *= 2) {
      if (SIZE % stride == 0) {
        // output[st output[2*SIZE] = input[2*SIZE] + input[2*SIZE*stride];
      }
    // printf("Output: %d", output[stride]);
    }
  }
  printf ("Sum: %d", output[SIZE]);
}
												
int main(){
  // allocate memory
  int* input = (int*) malloc(sizeof(int) * SIZE);
  int* output = (int*) malloc(sizeof(int) * SIZE);

  // initialize inputs
  for (int i = 0; i < SIZE; i++) {
    input[i] = 1; 
  }

  //Reduction(input, output, 0);
  Reduction<<<1, SIZE>>>(input, output, 0);
  //printf("Output: %d", Reduction(input, output, 0));
  
  /*
  // check results
  for (int i = 0; i < SIZE; i++) {
    printf("%d ", output[i]);
  }
  printf("\n");
  */

  cudaFree(input);
  cudaFree(output);
  
  return 0;

}