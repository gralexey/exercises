//
//  main.m
//
//
//  Created by Alexey Grabik on 26/04/15.
//  Copyright (c) 2015 123. All rights reserved.
//

#import <Foundation/Foundation.h>

char *modifyString(char *source) {
    char *res = malloc(strlen(source) * 2);
    int count = 1;
    int resIdx = 0;
    for (unsigned long idx = 0; idx < strlen(source); ++idx) {
        char c = source[idx];
        char nextChar;
        if (idx == strlen(source) - 1) {
            nextChar = 0;
        }
        else {
            nextChar = source[idx + 1];
        }
        if (c == nextChar) {
            ++count;
        }
        else {
            sprintf(res + strlen(res), "%c%d", c, count);
            count = 1;
        }
    }
    if (strlen(source) < strlen(res)) {
        return source;
    }
    return res;
}

int main(int argc, const char * argv[])
{
    NSLog(@"%s", modifyString("aabcccccaaa"));
    return 0;
}

