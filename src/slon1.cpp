#include <stdio.h>
#include "slon.h"
#include "slonPrint.h"

#ifdef __cplusplus
	extern "C" {
#endif
	#include "slonC.h"
#ifdef __cplusplus
	}
#endif

int main()
{
    slonPrint("Hello, world\n");
    printf("SLONSON = %d, slonC1 = %d, slonC2 = %d\n",SLONSON,slonC1(),slonC2());
    return 0;
}



