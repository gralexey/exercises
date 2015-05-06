//
//  main.m
//
//
//  Created by Alexey Grabik on 26/04/15.
//  Copyright (c) 2015 123. All rights reserved.
//

#import <Foundation/Foundation.h>

NSArray *getShuffle(NSString *str)
{
    if (str.length > 1)
    {
        NSString *lastChar = [str substringFromIndex:(str.length - 1)];
        NSArray *arrayForStrPrefix = getShuffle([str substringToIndex:(str.length - 1)]);
        NSMutableArray *ret = [NSMutableArray array];
        for (NSString *chunk in arrayForStrPrefix)
        {
            for (int idx = 0; idx < chunk.length + 1; ++idx)
            {
                NSMutableString *mChunk = [chunk mutableCopy];
                [mChunk insertString:lastChar atIndex:idx];
                [ret addObject:mChunk];
            }
        }
        return ret;
    }
    return @[str];
}

int main(int argc, const char * argv[]) {
    
    NSString *source = @"abcd";
    NSArray *result = getShuffle(source);
    return 0;
}

