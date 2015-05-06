//
//  main.m
//
//
//  Created by Alexey Grabik on 26/04/15.
//  Copyright (c) 2015 123. All rights reserved.
//

#import <Foundation/Foundation.h>

char *modifyString(char *source)
{
    char *res = malloc(strlen(source) * 2);
    unsigned long resIdx = 0;
    for (unsigned long idx = 0; idx < strlen(source); ++idx)
    {
        if (source[idx] == ' ')
        {
            strcpy(res + resIdx, "%20");
            resIdx += 3;
        }
        else
        {
            res[resIdx] = source[idx];
            ++resIdx;
        }
    }
    return res;
}

int main(int argc, const char * argv[])
{
    NSLog(@"%s", modifyString("John Smith "));
    return 0;
}

