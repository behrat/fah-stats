#define __USE_XOPEN
#include <time.h>
#include <sys/time.h>
char * parseDate(char* buffer, struct tm * time) {
	return strptime(buffer, "%A%t%B %d %T PST %Y\n", time);
}
