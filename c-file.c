
#include <stdio.h>


//extern "C" void __stdcall asmfunc(void);

#ifdef __cplusplus
extern "C" {
#endif

void __stdcall asmfunc(int* arr, int len, int* sum);

#ifdef __cplusplus
}
#endif


int main() {
    system("cls");
    int arr[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};      // declared array of integers (having even and odd values)
    int sum = 0;                                        // declare sum variable and initialize to 0.
    int len = sizeof(arr) / sizeof(arr[0]);             // calculated length of array
    printf("Array: {");
    for(int i = 0; i < len; i++){                      // for loop to print all elements of array
        printf("%d, ",arr[i]);
    }
    printf("}\nassembly proc calling from  from C! \n");
getch();

    
    asmfunc(arr, len, &sum); //assembly proc calling
   
   getch();
    
    
    printf("back to  C! \n"); // printing in c
    printf("Sum of even are: %d",sum);         // print sum of even numbers
  
    
    return 0;
}