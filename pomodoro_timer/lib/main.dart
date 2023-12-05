import 'dart:html';
import 'dart:async';

import 'package:flutter/material.dart';

/// Flutter code sample for [CircularProgressIndicator].

void main() => runApp(const ProgressIndicatorApp());

class ProgressIndicatorApp extends StatelessWidget {
  const ProgressIndicatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProgressIndicatorExample(),
    );
  }
}

class ProgressIndicatorExample extends StatefulWidget {
  const ProgressIndicatorExample({super.key});

  @override
  State<ProgressIndicatorExample> createState() =>
      _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample>
    with TickerProviderStateMixin {
  late AnimationController controller;
  int _counter = 0;
  int duration = 10;
  int reverseduration = 15;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    double repeatCount = 0;
    int maxRepeatCount = _counter;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
      reverseDuration: const Duration(seconds: 15),
      value: 1,
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (repeatCount < maxRepeatCount) {
            controller.reverse();
          }
        } else if (status == AnimationStatus.dismissed) {
          if (repeatCount < maxRepeatCount) {
            controller.forward();
          }
          repeatCount++;
        }
      })
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(85, 24, 24, 0.965),
        title: Center(child: Text('Temporizador Pomodoro')),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox(
                height: 200,
                width: 200,
                child: Transform.scale(
                  scale: 3,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromRGBO(3, 1, 31, 0.965)),
                    value: controller.value,
                    semanticsLabel: 'Circular progress indicator',
                  ),
                )),
            Column(
              children: [
                SizedBox(height: 100),
                AnimatedBuilder(
                  animation: controller,
                  builder: (BuildContext context, Widget? child) {
                    return Text(
                      controller.status == AnimationStatus.forward
                          ? 'Hora de Descansar'
                          : 'Hora de Estudar',
                      style: const TextStyle(
                          fontSize: 40,
                          color: Color.fromRGBO(
                              94, 6, 6, 0.965)), // Estilo do texto
                    );
                  },
                ),
                AnimatedBuilder(
                    animation: controller,
                    builder: (BuildContext context, Widget? child) {
                      return Text(controller.status == AnimationStatus.completed
                          ? 'Defina quantos ciclos serão feitos e aperte Iniciar'
                          : '');
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: _incrementCounter,
                  icon: const Icon(Icons.add),
                  label: Text('$_counter'),
                ),
                SizedBox(width: 10),
                ElevatedButton(onPressed: initState, child: Text('Iniciar')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
