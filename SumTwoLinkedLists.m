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

Node *sumTwoLists(Node *list1, Node *list2)
{
    Node *result = [[Node alloc] init];
    Node *r = result;
    int f = 0;
    while (list1 || list2) {
        int digitsSum = list1.data + list2.data + f;
        r.data = digitsSum % 10;
        if (digitsSum > 9) {
            f = 1;
        }
        else {
            f = 0;
        }
        list1 = list1.next;
        list2 = list2.next;
        if (list1 || list2) {
            r.next = [[Node alloc] init];
            r = r.next;
        }
        else if (f) {
            r.next = [[Node alloc] init];
            r.next.data = 1;
        }
    }
    return result;
}

Node *reverseList(Node *list)
{
    Node *n = nil;
    while (list) {
        Node *tmp = [[Node alloc] init];
        tmp.data = list.data;
        tmp.next = n;
        n = tmp;
        list = list.next;
    }
    return n;
}

int main(int argc, const char * argv[]) {
    Node *list1 = listFromArray((int []){ 7, 1, 6, 9 }, 4);
    Node *list2 = listFromArray((int []){ 5, 9, 4 }, 3);
    printList(list1);
    printList(list2);
    printList(sumTwoLists(list1, list2));
    
    Node *list1r = reverseList(list1);
    printList(list1r);
    return 0;
}

