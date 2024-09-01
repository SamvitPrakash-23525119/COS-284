#include <stdio.h>
#include <stdlib.h>

extern float convertStringToFloat(const char *str);
extern float* extractAndConvertFloats(int *numFloats);
extern double processArray(float *arr, int size);

int main() {
    int numFloats;
    float *floats = extractAndConvertFloats(&numFloats);

    // if (floats != NULL) {
    //     printf("Converted numbers:\n");
    //     for (int i = 0; i < numFloats; i++) {
    //         printf("%f\n", floats[i]);
    //     }

    //     double sum = processArray(floats, numFloats);
    //     printf("The sum of the processed array is: %f\n", sum);

    //     free(floats);
    // }

    // Test case 1: Array of floats
    float testArray1[] = {32.133, 45.66, -21.255};
    int size1 = sizeof(testArray1) / sizeof(testArray1[0]);
    double result1 = processArray(testArray1, size1);
    printf("Test Case 1 Result: %f\n", result1);

    // Add more test cases as needed
    // Test case 2: Edge cases, empty array, etc.

    return 0;
}

/** Console input: `| 32.133 45.66 -21.255 |`'s expected output: 

Enter values separated by whitespace and enclosed in pipes (|):
| 32.133 45.66 -21.255 |
Converted numbers:
32.132999
45.660000
-21.254999
The sum of the processed array is: 475.434491

*/