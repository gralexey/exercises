//
//  main.m
//
//
//  Created by Alexey Grabik on 26/04/15.
//  Copyright (c) 2015 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject
@property (retain) Node *next;
@property (assign) int data;
@end
@implementation Node
@end

void printList(Node *node) {
    while (node) {
        printf("%d ", node.data);
        node = node.next;
    }
    printf("\n");
}

Node *rearrangeList(Node *head, int x)
{
    Node *pFirstGreater = nil;
    Node *pLastSmaller = nil;
    Node *pLastGreater = nil;
    Node *p = head;
    while (p) {
        if (p.data < x && !pLastSmaller) {
            pLastSmaller = p;
            head = p;
        }
        else if (p.data < x) {
            pLastSmaller.next = p;
            pLastSmaller = p;
        }
        else if (p.data >= x && !pLastGreater) {
            pLastGreater = p;
            pFirstGreater = p;
        }
        else if (p.data >= x) {
            pLastGreater.next = p;
            pLastGreater = p;
        }
        p = p.next;
    }
    pLastGreater.next = 0;
    pLastSmaller.next = pFirstGreater;
    return head;
}

Node *listFromArray(int *a, int n)
{
    Node *headNode = [[Node alloc] init];
    Node *p = headNode;
    while (n--) {
        p.data = *a;
        ++a;
        if (n) {
            p.next = [[Node alloc] init];
            p = p.next;
        }
    }
    return headNode;
}

int main(int argc, const char * argv[]) {
    Node *headNode = listFromArray((int []){ 4, 8, 2, 3, 7, 9 }, 6);
    printList(headNode);
    headNode = rearrangeList(headNode, 1);
    printList(headNode);
    return 0;
}

