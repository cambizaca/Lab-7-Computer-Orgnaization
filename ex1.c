#include <stdio.h>
#include <math.h>

int AA[100];            // linearized version of A[10][10]
int BB[100];            // linearized version of B[10][10]
int CC[100];            // linearized version of C[10][10]
int m;                  // actual size of the above matrices is mxm, where m is$

int main() {
  scanf("%d", &m);
  int j = m * m;

  for(int i = 0; i < j; i++) {
    scanf("%d",&AA[i]);
  }
  for(int i = 0; i < j; i++) {
    scanf("%d",&BB[i]);
  }

  for(int i = 0; i < j; i++) {
    CC[i] = 0;
  }

  for (int i = 0; i < m; i++) {
      for (int j = 0; j < m; j++) {
          CC[m*i+j] = 0;
          for (int q = 0; q  < 4; q++) {
              CC[m*i+j] += AA[m*i+q] * BB[m*q+j];
          }
      }
  }
  for(int i = 0; i < j; i++) {
      printf("%d ", CC[i]);
    if(( i + 1 ) %  m  == 0) {
       printf("\n");
    }
  }
}


