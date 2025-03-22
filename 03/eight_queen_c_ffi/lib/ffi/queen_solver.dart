import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

typedef GetSolutionsNative = Pointer<Int32> Function(Pointer<Int32>);
typedef GetSolutionsDart = Pointer<Int32> Function(Pointer<Int32>);

class QueenSolver {
  late DynamicLibrary _lib;
  late GetSolutionsDart _getSolutions;

  QueenSolver() {
    if (Platform.isAndroid || Platform.isLinux) {
      _lib = DynamicLibrary.open("libqueen_solver.so");
    } else if (Platform.isWindows) {
      _lib = DynamicLibrary.open("queen_solver.dll");
    } else if (Platform.isMacOS) {
      _lib = DynamicLibrary.open("libqueen_solver.dylib");
    }

    _getSolutions = _lib.lookupFunction<GetSolutionsNative, GetSolutionsDart>(
      'get_solutions',
    );
  }

  List<List<int>> solve() {
    Pointer<Int32> countPtr = calloc<Int32>();
    Pointer<Int32> solutionsPtr = _getSolutions(countPtr);
    int count = countPtr.value;
    calloc.free(countPtr);

    List<List<int>> solutions = [];
    for (int i = 0; i < count; i++) {
      List<int> solution = [];
      for (int j = 0; j < 8; j++) {
        solution.add(solutionsPtr.elementAt(i * 8 + j).value);
      }
      solutions.add(solution);
    }

    return solutions;
  }
}
