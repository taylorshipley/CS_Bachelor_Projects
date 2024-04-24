/* file: prog1.c
 * This is the main driver porgram to test the functionality of the 
 * queue implemented as a linked list.  
 * 
 * Structure of the program:
 * 1. Declare needed variables 
 *    array of queue pointers, initialized to NULL
 *    a variable of type person to hold return values and to send as a parameter
 * 2. Test isemptyq with NULL queue
 * 3. Test dequeue with NULL queue and empty queue
 * 4. Test freeq with NULL queue and empty queuue
 * 5. Test createq, put pointers in array
 * 6. Add three elements to first queue and dequeue only first element
 * 7. Check for isemptyq for first queue
 * 8. Add two elements to second queue 
 * 9. Add two elements to third queue
 * 10. Check call to freeq for non-empty queue
 * 11. Use a loop to dequeue the two elements of queue 1, print values, free 1
 * 12. Empty and free queues 2 & 3
*/

#include <stdio.h>
#include <string.h>
#include "queue.h"


int main(int argc, char *argv[]) {
	
	// 1. Declare needed variables
	queue *theqs[3] = { NULL };
	person a = {"Albus Dumbledore", 77},
		   b = {"Harry Potter", 11},
		   c = {"Ronald Weasley", 11},
		   d = {"James Tiberius Kirk", 35},
		   e = {"Spock", 33},
		   f = {"John Sheridan", 37},
		   g = {"Delen", 39},
		   retval;
	char formattedout[30];
	int i; // used for formatted output
		   
	// 2. Test isemptyq with NULL queue
	printf("%-23s","Testing: isemptyqueue");
	printf("%-35s", "with NULL pointer ");
	if (!isemptyqueue(theqs[0])) {
		printf("FAILED\n");
	} else {
		printf("--- passed\n");
	}
	
	// 3. Test dequeue with NULL queue and empty queue
	printf("\n%-23s","Testing: dequeue");
	printf("%-35s", "with NULL pointer.  ");
	retval = dequeue(theqs[0]);
	if (strlen(retval.name) > 0 || retval.age != 0) {
		printf("FAILED\n");
	} else {
		printf("--- passed\n");
	}
	
	// Now create the first queue for the next test of dequeue
	printf("\n%-23s","Testing: createq");
	printf("%-35s", "create new queue");
	if ((theqs[0] = createq()) == NULL ) {
		printf("FAILED - returned NULL pointer\n");
	} else { 
		printf("--- passed\n");
	}
	// Now dequeue with an empty queue
	printf("\n%-23s","Testing: dequeue");
	printf("%-35s", "empty queue returns empty struct");
	retval = dequeue(theqs[0]);
	if (strlen(retval.name) > 0 || retval.age != 0) {
		printf("FAILED\n");
	} else {
		printf("--- passed\n");
	}
	
	// 4. Test freeq with NULL queue and empty queuue
	printf("\n%-23s","Testing: freeq");
	printf("%-35s", "with NULL pointer.  ");
	if (freeq(theqs[1])) {
		printf("--- passed\n");
	} else {
		printf("FAILED\n");
	}
	
	printf("\n%-23s","Testing: freeq");
	printf("%-35s", "with empty queue.  ");
	if (freeq(theqs[0])) { // remember theqs[0] was created, now free it
		printf("--- passed\n");
	} else {
		printf("FAILED  \n");
	}
	
	// 5. Test createq, put pointers in array
	for (int i=0; i < 3; i++) {
		printf("\n%-23s","Testing: createq");
		sprintf(formattedout, "create queue - %d", i);
		printf("%-35s", formattedout);
		if ((theqs[i] = createq()) == NULL) {
			printf("FAILED\n");
		} else {
			printf("--- passed\n");
		}
	}
	
	//6. Add three elements to first queue and dequeue only first element
	printf("\n%-23s","Testing: enqueue");
	printf("Add %-20s - queue 0 ", a.name);
	if (enqueue(theqs[0], a)) {
		printf("--- passed \n");
	} else {
		printf("FAILED \n");
	}
	printf("\n%-23s","Testing: enqueue");
	printf("Add %-20s - queue 0 ", b.name);
	if (enqueue(theqs[0], b)) {
		printf("--- passed \n");
	} else {
		printf("FAILED \n");
	}
	printf("\n%-23s","Testing: enqueue");
	printf("Add %-20s - queue 0 ", c.name);
	if (enqueue(theqs[0], c)) {
		printf("--- passed \n");
	} else {
		printf("FAILED \n");
	}
	
	// Now dequeuing the first name
	printf("\n%-23s","Testing: dequeue");
	sprintf(formattedout, "dequeue %20s   ", a.name);
	printf("%-35s", formattedout);
	retval = dequeue(theqs[0]);
	if (strncmp(retval.name, a.name, strlen(a.name)) != 0) {
		printf(" FAILED \n");
	} else {
		printf("--- passed\n");
	}
	
	// 7. Check for isemptyqueue for first queue
	printf("\n%-23s","Testing: isemptyqueue");
	printf("%-35s", "with non-empty queue");
	if (isemptyqueue(theqs[0])) {
		printf("FAILED\n");
	} else {
		printf("--- passed\n");
	}
	
	// 8. Add two elements to second queue
	printf("\n%-23s","Testing: enqueue");
	printf("Add %-20s - queue 1 ", d.name);
	if (enqueue(theqs[1], d)) {
		printf("--- passed\n");
	} else {
		printf("FAILED\n");
	}
	printf("\n%-23s","Testing: enqueue");
	printf("Add %-20s - queue 1 ", e.name);
	if (enqueue(theqs[1], e)) {
		printf("--- passed\n");
	} else {
		printf("FAILED\n");
	}
	
	// 9. Add two elements to third queue
	printf("\n%-23s","Testing: enqueue");
	printf("Add %-20s - queue 2 ", f.name);
	if (enqueue(theqs[2], f)) {
		printf("--- passed\n");
	} else {
		printf("FAILED\n");
	}
	printf("\n%-23s","Testing: enqueue");
	printf("Add %-20s - queue 2 ", g.name);
	if (enqueue(theqs[2], g)) {
		printf("--- passed\n");
	} else {
		printf("FAILED\n");
	}
	
	//10. Check call to freeq for non-empty queue
	printf("\n%-23s","Testing: freeq");
	printf("%-35s", "with non-empty queue");
	if (freeq(theqs[0])) { 
		printf("FAILED\n");
	} else {
		printf("--- passed\n");
	}
	
	//11. Use a loop to dequeue the two elements of queue 0, print values, free it
	i = 1;
	while(!isemptyqueue(theqs[0])) {
		printf("\n%-23s","Testing dequeue");
		if (i) {
			sprintf(formattedout, "dequeue %s", b.name);
			i--; // next time through the loop do the else part
		} else {
			sprintf(formattedout, "dequeue %s", c.name);			
		}
		printf("%-35s", formattedout);
		printf("dequeue returned ");
		retval = dequeue(theqs[0]);
		printf("%-20s", retval.name);
	}
	printf("\n");
	
	printf("\n%-23s","Testing: freeq");
	sprintf(formattedout, "queue %d, an empty queue", 0);
	printf("%-35s", formattedout);
	if (freeq(theqs[0])) {
		printf("--- passed\n");
	} else {
		printf("FAILED\n");
	}

	
	// 12. Empty and free queues 2 & 3
	for (int i = 1; i < 3; i++) { // empty the two remaining queues
		printf("\n%-23s","Testing: emptyq");
		sprintf(formattedout, "queue %d", i);
		printf("%-35s", formattedout);
		if (emptyq(theqs[i])) {
			printf("--- passed\n");
		} else {
			printf("FAILED\n");
		}
		printf("\n%-23s","Testing: freeq");
		//sprintf(formattedout, "queue %d", i);
		printf("%-35s", formattedout);

		if (freeq(theqs[i])) {
			printf("--- passed\n");
		} else {
			printf("FAILED  queue\n");
		}
	}
	
}
