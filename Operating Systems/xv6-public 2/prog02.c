#include "types.h"
#include "user.h"
#include "fcntl.h"

#define MAX_BUFFER_SIZE 1024

int main(void) {
	printf(1, "My name is Taylor Shipley\n");
	int outputFile = open("bob.txt", O_WRONLY | O_CREATE);
	printf(1, "Please enter a string to save: ");
	char userInput[MAX_BUFFER_SIZE];
	int bytesRead = read(0, userInput, MAX_BUFFER_SIZE);
	if (bytesRead < 0) {
		printf(1, "Error reading input.\n");
	    exit();
	}
	int bytesWritten = write(outputFile, userInput, bytesRead);
	if (bytesWritten < 0) {
        printf(1, "Error writing to the file.\n");
        close(outputFile);
        exit();
    }
	close(outputFile);
	exit();
}
