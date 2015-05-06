//
//  main.m
//
//
//  Created by Alexey Grabik on 26/04/15.
//  Copyright (c) 2015 123. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef int Object;
#define MAX_DATA_VALUE 255
@interface Node : NSObject
@property (retain) Node *next;
@property (assign) Object data;
@end
@implementation Node
- (id)initWithData:(Object)object
{
    self = [super init];
    if (self) {
        _data = object;
    }
    return self;
}
@end

void printList(Node *node) {
    while (node) {
        printf("%d ", node.data);
        node = node.next;
    }
    printf("\n");
}

class Stack {
    Node *top;
public:
    Stack() {}
    void push(Object data) {
        Node *node = [[Node alloc] initWithData:data];
        node.next = top;
        top = node;
    }
    
    Object pop() {
        if (top) {
            Node *node = top;
            top = top.next;
            return node.data;
        }
        return NULL;
    }
    Object peek() {
        return top.data;
    }
    bool isEmpty() {
        return !top;
    }
    void print() {
        Node *n = top;
        while (n) {
            printf("%d ", n.data);
            n = n.next;
        }
        printf("\n");
    }
    
    void sortStack() {
        Stack *stack = this;
        Stack *supportingStack = new Stack;
        int num = 0;
        int curMin1 = MAX_DATA_VALUE;
        int curMin2 = MAX_DATA_VALUE;
        int curOrderedNum = 0;
        
        while (Object data = stack->pop()) {    // -->
            if (data < curMin2) {
                curMin2 = data;
            }
            ++num;
            supportingStack->push(data);
        }
        
        stack->push(curMin2);
        ++curOrderedNum;
        
        while (curOrderedNum < num) {
            curMin1 = MAX_DATA_VALUE;
            bool noDoubleFlag = false;
            while (!supportingStack->isEmpty()) {  // <--
                Object data = supportingStack->pop();
                if ((curMin2 < data || noDoubleFlag) && data < curMin1) {
                    curMin1 = data;
                }
                if (data != curMin2 || noDoubleFlag) {
                    stack->push(data);
                }
                if (data == curMin2) {
                    noDoubleFlag = true;
                }
            }
            int passes = num - curOrderedNum;
            curMin2 = MAX_DATA_VALUE;
            noDoubleFlag = false;
            while (passes--) {  // -->
                Object data = stack->pop();
                if ((curMin1 < data || noDoubleFlag) && data < curMin2) {
                    curMin2 = data;
                }
                if (data != curMin1 || noDoubleFlag) {
                    supportingStack->push(data);
                }
                if (data == curMin1) {
                    noDoubleFlag = true;
                }
            }
            if (curMin1 != MAX_DATA_VALUE) {
                stack->push(curMin1);
                ++curOrderedNum;
            }
            if (curMin2 != MAX_DATA_VALUE) {
                stack->push(curMin2);
                ++curOrderedNum;
            }
        }
    }
};

int main(int argc, const char * argv[]) {
    Stack *stack = new Stack;
    stack->push(7);
    stack->push(6);
    stack->push(9);
    stack->push(-1);
    stack->push(2);
    stack->push(1);
    stack->push(3);
    stack->push(7);
    stack->push(9);
    stack->print();
    stack->sortStack();
    stack->print();
    return EXIT_SUCCESS;
}

