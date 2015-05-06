//
//  main.m
//
//
//  Created by Alexey Grabik on 26/04/15.
//  Copyright (c) 2015 123. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef int Object;
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
};

class MyQueue {
    Stack *inStack;
    Stack *outStack;
    bool inStackWorks;
public:
    MyQueue() {
        inStack = new Stack();
        outStack = new Stack();
        inStackWorks = true;
    }
    ~MyQueue() {
        delete inStack;
        delete outStack;
    }
    void exchangeStack(Stack *source, Stack *target) {
        while (Object data = source->pop()) {
            target->push(data);
        }
    }
    void enqueue(Object data) {
        if (!inStackWorks) {
            exchangeStack(outStack, inStack);
            inStackWorks = true;
        }
        inStack->push(data);
    }
    Object dequeue() {
        if (inStackWorks) {
            exchangeStack(inStack, outStack);
            inStackWorks = false;
        }
        return outStack->pop();
    }
};

void printList(Node *node) {
    while (node) {
        printf("%d ", node.data);
        node = node.next;
    }
    printf("\n");
}

int main(int argc, const char * argv[]) {
    
    MyQueue myQueue;
    myQueue.enqueue(1);
    myQueue.enqueue(2);
    myQueue.enqueue(3);
    printf("%d\n", myQueue.dequeue());
    printf("%d\n", myQueue.dequeue());
    myQueue.enqueue(4);
    printf("%d\n", myQueue.dequeue());
    printf("%d\n", myQueue.dequeue());
    return EXIT_SUCCESS;
}

