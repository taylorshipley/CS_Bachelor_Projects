#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "queue.h"

// createq is a function that creates a new queue using malloc
// if the queue is not created a value of NULL is returned
queue* createq()
{
    queue* newqueue = (queue*)malloc(sizeof(queue));
    if (newqueue == NULL) {
        return NULL;
    }

    newqueue->head = NULL;
    newqueue->tail = NULL;

    return newqueue;
}
// enqueue is a function that adds an element to the queue, it requires
// a pointer to the queue and a person type as parameters, it returns a
// bool type (true on success and false on failure)
bool enqueue(queue* myQueue, person newPerson) {
    if (myQueue == NULL) {
        // Queue isn't initialized
        printf("Error: The Queue pointer is NULL\n");
        return false;
    } 
    else 
    {
        // Queue is initialized
        node* newNode = (node*)malloc(sizeof(node));
        if (newNode == NULL) {
            // New node wasn't created
            printf("Error: Cannot create new node\n");
            return false;
        } else {
            // Node was created
            strcpy(newNode->value.name, newPerson.name);
            newNode->value.age = newPerson.age;
        }

        if (myQueue->head == NULL){
            // Queue is empty
            myQueue->head = newNode;
        } else {
            // Queue is not empty
            myQueue->tail->next = newNode;
        }
        newNode->next = NULL;
        myQueue->tail = newNode;
        return true;
    }
}

// dequeue is a function that removes a node from a given queue and 
// returns the record stored there.
person dequeue(queue* myQueue) {
    if (myQueue == NULL) {
        printf("Error: The Queue pointer is NULL\n");
        person emptyPerson = { "", 0 };
        return emptyPerson;
    }
    
    if (myQueue->head == NULL) {
        printf("Error: The Queue is empty\n");
        person emptyPerson = { "", 0 };
        return emptyPerson;
    }
    
    person dequeuedPerson = myQueue->head->value;
    node* temp = myQueue->head;
    
    if (myQueue->head == myQueue->tail) {
        myQueue->head = NULL;
        myQueue->tail = NULL;
    } else {
        myQueue->head = myQueue->head->next;
    }
    
    free(temp);
    
    return dequeuedPerson;
}


// isemptyq returns true if the queue is NULL or empty, false if there 
// are nodes in the queue
bool isemptyqueue(queue* myQueue) {
    if (myQueue == NULL) {
        printf("Error: The Queue pointer is NULL.\n");
        return true;
    }
    
    if (myQueue->head == NULL) {
        printf("Error: The Queue is empty\n");
        return true;  // Queue is empty
    } else {
        return false;  // Queue is not empty
    }
}




// empytyq is a function that removes all nodes in the queue
// since this is a heap we need to manage it, return false if queue is NULL
bool emptyq(queue* myQueue){
    if (isemptyqueue(myQueue)){
        return false;
    }
    do {
        person temp = dequeue(myQueue);
    } while(!isemptyqueue(myQueue));
    return true;
}      


// freeq is a function that will free the memory for the queue if the 
// queue is empty.  It returns false if queue is not empty, true if freed
bool freeq(queue* myQueue) {
    if (myQueue == NULL) {
        return true;
    }
    if (myQueue->head == NULL) {
    free(myQueue);
    return true;
    } else {
        return false;
    }
}