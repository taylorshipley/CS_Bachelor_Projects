#include "types.h"
#include "user.h"
#include "stat.h"

int main(int argc, char *argv[]) {
    int count;
    char *priority;

    if(argc < 3){
        printf(1, "Insufficient arguments, expected format: count <int> <priority>\n");
        exit();
    }

    count = atoi(argv[1]);
    priority = argv[2];

    for(int i=0; i<count; i++){
        printf(1, "%s, %d\n", priority, i);
        sleep(50);
    }
    exit();
}
