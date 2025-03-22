import 'package:flutter/material.dart';
import 'dart:async';
import 'ffi/selection_sort.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SelectionSort selectionSort = SelectionSort();
  List<int> numbers = [50, 40, 30, 20, 10, 5, 2, 1];
  int step = 0;

  @override
  void initState() {
    super.initState();
    sortNumbers();
  }

  void sortNumbers() async {
    selectionSort.sort(numbers, (List<int> newList) {
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          numbers = newList;
          step++;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Selection Sort Animation")),
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    numbers
                        .map(
                          (num) => AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: 40,
                            height: num * 5.0,
                            color: Colors.blue,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                          ),
                        )
                        .toList(),
              ),
            ),
            Text("Step: $step", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
