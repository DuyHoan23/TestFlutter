#include <stdio.h>
#include <stdlib.h>

void selection_sort(int *arr, int n, void (*callback)(int *, int))
{
    for (int i = 0; i < n - 1; i++)
    {
        int min_idx = i;
        for (int j = i + 1; j < n; j++)
        {
            if (arr[j] < arr[min_idx])
            {
                min_idx = j;
            }
        }
        // Hoán đổi giá trị
        int temp = arr[i];
        arr[i] = arr[min_idx];
        arr[min_idx] = temp;

        // Gọi callback để cập nhật animation
        callback(arr, n);
    }
}
