#include <stdio.h>


extern int pow2(int b);
extern int sum(int a, int b);
extern int mypow(int a, int b);

extern int f1(int*);
extern int f2(int*);
extern int f3(int*);
extern int f4(int*);
extern int f5(int*);
extern int f6(int*);


extern int sum2(int a, int b,int c, int d, int e, int f, int g);


void dump(char* msg, int* a) {
  for (; *a; ++a) {
    printf("%s%d", msg, *a);
    msg = ", ";
  }
  printf("\n");
}

int runTestF(int (*f)(int*)){
  
  int t1[] = { 5, 3, 6, 8, 2, 10, 11, 9, 1, 4, 7, 0 };
  dump("Array: ", t1);
  printf("Result: %d\n", f(t1));


  int t2[] = { 45, 23, 66, 18, 21, 10, 31, 75, 0 };
  dump("Array: ", t2);
  printf("Result: %d\n", f(t2));


  int t3[] = { -45, 23, -21, 10, 75, -90, 0 };
  dump("Array: ", t3);
  printf("Result: %d\n", f(t3));


}

int main() {
  int i;
  int b = 1;
  int (*fs[6]) (int * x) = {f1,f2,f3,f4,f5,f6};


  for(i=0;i<10;i++)
    printf("pow2(%d) => %d : Expected: %d\n",i,pow2(i), 1<<i);

  for(i=0;i<5;i++)
    printf("mypow(2,%d) => %d : Expected: %d\n",i,mypow(2,i), 1<<i);
  

  for(i=0;i<5;i++,b*=10){
    printf("mypow(10,%d) => %d : Expected: %d\n",i,mypow(10,i), b);
  }

  i = 5;
  printf("sum(8,231) => %d : Expected %d\n",sum(8,231),8+231);
  printf("sum2(... %d ...) => %d : Expected %d\n",i,sum2(i+1,i+2,i+3,i+4,i+5,i+6,i+7),i*7 + (7*8)/2 );

  
  for(i=0;i<6;i++){
    printf("\nRunning f%d\n",i+1);
    runTestF(fs[i]);
  }
  
  printf("\n");
  return 0;
}
