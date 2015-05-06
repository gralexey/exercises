//
//  main.m
//
//
//  Created by Alexey Grabik on 26/04/15.
//  Copyright (c) 2015 123. All rights reserved.
//

#import <Foundation/Foundation.h>

int idx(i, j, n)
{
    return i * n + j;
}

void print(long *m, int n)
{
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            printf("%ld\t ", m[idx(i, j, n)]);
            if (j == n - 1)
            {
                printf("\n");
            }
        }
    }
    printf("\n");
}

int main(int argc, const char * argv[])
{
    int n = 6;
    long tmp;
    long m[] = { 1, 2, 0, 0, 7, 99,
                 13, 5, 6, 17, 0, 88,
                 0, 11, 7, 0, 2, 78,
                 1, 0, 2, 3, 4, 21,
                 18, 56, 2, 77, 76, 21,
                 8, 3, 7, 12, 9, 14 };
    
    print(m, n);
    
    for (int i = 0; i < n/2; ++i) {
        for (int j = i + 1; j < n - i; ++j) {
            int i_2 = j;
            int j_2 = (n - 1) - i;
            int i_3 = (n - 1) - i;
            int j_3 = (n - 1) - j;
            int i_4 = (n - 1) - j;
            int j_4 = i;
            tmp = m[idx(i, j, n)];
            m[idx(i, j, n)] = m[idx(i_2, j_2, n)];
            m[idx(i_2, j_2, n)] = m[idx(i_3, j_3, n)];
            m[idx(i_3, j_3, n)] = m[idx(i_4, j_4, n)];
            m[idx(i_4, j_4, n)] = tmp;
        }
    }
    
    print(m, n);
    
    return 0;
}

