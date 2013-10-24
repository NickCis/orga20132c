#ifndef __BUBBLESORT_H__
#define __BUBBLESORT_H__

#include <stdio.h>

typedef int (*TCompareFunction)(void*, void*);

void bubblesort(void** array, size_t size, TCompareFunction cmp);

#endif
