#include "stdio.h"
#include "time.h"

int main() {
   struct tm t;
   time_t t_of_day;
   t.tm_year=1970-1900;
   t.tm_mon=-1;//mon为实际的mon-1
   t.tm_mday=0;
   t.tm_hour=0;
   t.tm_min=0;
   t.tm_sec=0;
   t.tm_isdst=0;
   t_of_day=mktime(&t);
   printf("%s",ctime(&t_of_day));
   return 0;
}