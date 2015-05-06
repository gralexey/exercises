//
//  main.m
//
//
//  Created by Alexey Grabik on 26/04/15.
//  Copyright (c) 2015 123. All rights reserved.
//

#import <Foundation/Foundation.h>

void print(int *array, int n) {
    while (n--) {
        printf("%d ", *array++);
    }
    printf("\n");
}

int *mergeSort(int *array, int start, int end) {
    int count = end - start + 1;
    if (count == 1) {
        int *a = (int *)malloc(sizeof(int));
        *a = array[start];
        return a;
    }
    int *left = mergeSort(array, start, start + count / 2 - 1);
    int *leftSaved = left;
    int *right = mergeSort(array, start + count / 2, start + count - 1);
    int *rightSaved = right;
    int *res = (int *)calloc(count, sizeof(int));
    int *p = res;
    int flag = 0;   // 1/2 left/right overrun
    int c = count;
    while (c--) {
        if ((flag != 1 && *left < *right) || flag == 2) {
            *p++ = *left++;
            if (left == leftSaved + count / 2) {
                flag = 1;
            }
        }
        else {
            *p++ = *right++;
            if (right == rightSaved + (int)ceil(count / 2.)) {
                flag = 2;
            }
        }
    }
    free(leftSaved);
    free(rightSaved);
    return res;
}

int main(int argc, const char * argv[]) {
    int array[] = { 10, 3, 2, 7, 1, 9, 4 };
    print(array, 7);
    int *array2 = mergeSort(array, 0, 6);
    print(array2, 7);
    free(array2);
    return EXIT_SUCCESS;
}

