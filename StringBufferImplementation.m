//
//  main.m
//
//
//  Created by Alexey Grabik on 26/04/15.
//  Copyright (c) 2015 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringBuffer : NSObject
{
    char *_data;
    unsigned long _length;
    unsigned long _filledLength;
}
- (void)append:(const char *)string;
- (char *)string;
@end

@implementation StringBuffer

- (id)init
{
    self = [super init];
    if (self)
    {
        _length = 1;
        _data = malloc(_length * sizeof(char));
        _filledLength = 0;
    }
    return self;
}

- (void)append:(const char *)string
{
    if (strlen(string) > _length - _filledLength)
    {
        
        unsigned long newLength = pow(2, ceil(log2(_filledLength + strlen(string) + 1)));
        _data = realloc(_data, newLength);
        if (_data)
        {
            _length = newLength;
        }
    }
    strcpy(_data + _filledLength, string);
    _filledLength += strlen(string);
}

- (char *)string
{
    return _data;
}

@end

int main(int argc, const char * argv[])
{
    StringBuffer *sb = [[StringBuffer alloc] init];
    [sb append:"abc"];
    [sb append:"1234"];
    [sb append:" jump "];
    [sb append:"olololo"];
    [sb append:" gsom"];
    NSLog(@"%s\n", [sb string]);
    return 0;
}

