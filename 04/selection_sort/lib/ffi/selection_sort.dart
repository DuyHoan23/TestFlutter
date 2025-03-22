import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:io';

// Load thư viện C dựa trên hệ điều hành
final DynamicLibrary nativeLib =
    Platform.isWindows
        ? DynamicLibrary.open("native/selection_sort.dll")
        : Platform.isMacOS
        ? DynamicLibrary.open("native/libselection_sort.dylib")
        : DynamicLibrary.open("native/libselection_sort.so");

// Định nghĩa kiểu dữ liệu C
typedef SelectionSortNative = Void Function(Pointer<Int32>, Int32);
typedef SelectionSortDart = void Function(Pointer<Int32>, int);

class SelectionSort {
  final SelectionSortDart selectionSort = nativeLib
      .lookupFunction<SelectionSortNative, SelectionSortDart>("selection_sort");

  void sort(List<int> list, Function(List<int>) callback) {
    final Pointer<Int32> arr = calloc<Int32>(list.length);
    for (int i = 0; i < list.length; i++) {
      arr[i] = list[i];
    }

    selectionSort(arr, list.length);

    List<int> sortedList = List.generate(list.length, (i) => arr[i]);
    calloc.free(arr);

    callback(sortedList);
  }
}
