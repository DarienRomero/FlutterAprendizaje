import 'package:flutter/material.dart';
import 'package:freezed_test/freezed_classes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    // const user = User(name: "Darien", age: 20);
  // const user2 = User(name: "Darien", age: 20);

  // final serialized = user.toJson();
  // final deserialized = User.fromJson(serialized);
  // print(serialized);
  // print(deserialized);

    // OperationNested.add(1);
    final result = performOperation(2, OperationNested.add(2));
    print(result);
  }

  int performOperation(int operand, OperationNested operation){
    // return operation.whenOrNull(
    //   add: (value) => operand + value,
    //   subtract: (value) => operand - value,
    // ) ?? operand;
    // return operation.maybeWhen(
    //   add: (value) => operand + value,
    //   orElse: () => operand
    // ) ?? operand;
    return operation.map(
      add: (caseClass) => operand + caseClass.value,
      subtract: (caseClass) => operand - caseClass.value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}