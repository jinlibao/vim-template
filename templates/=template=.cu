/**
 * %FFILE% - %FDATE%
 *
 * Copyright © %YEAR% %USER% <%MAIL%>
 * Distributed under terms of the %LICENSE% license.
 */

#include <assert.h>
#include <complex.h>
#include <ctype.h>
#include <errno.h>
#include <fenv.h>
#include <float.h>
#include <inttypes.h>
#include <iso646.h>
#include <limits.h>
#include <locale.h>
#include <math.h>
#include <setjmp.h>
#include <signal.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <tgmath.h>
#include <time.h>
#include <wchar.h>
#include <wctype.h>

__global__ void %FILE%(void) {}

int main(int argc, char* argv[]) {
    %FILE%<<<1, 1>>>();
    %HERE%

    return 0;
}
