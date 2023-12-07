import 'package:flutter/material.dart';

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
  bool isAnimatingForward = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  void initState() {
    double repeatCount = 0;
    int maxRepeatCount = _counter;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      reverseDuration: const Duration(seconds: 5),
      value: 1,
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (repeatCount < maxRepeatCount) {
            controller.reverse();
            isAnimatingForward = false;
          }
        } else if (status == AnimationStatus.dismissed) {
          if (repeatCount < maxRepeatCount) {
            controller.forward();
            isAnimatingForward = true;
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
        backgroundColor: Color.fromRGBO(49, 19, 19, 0.965),
        title: Center(child: Text('Temporizador Pomodoro')),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
              'C:/Códigos VSCODE/Dart-Hub/pomodoro_timer/lib/assets/146302-blue-gradient.jpg'),
          fit: BoxFit.cover,
        )),
        child: Center(
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
                                13, 6, 94, 50)), // Estilo do texto
                      );
                    },
                  ),
                  AnimatedBuilder(
                      animation: controller,
                      builder: (BuildContext context, Widget? child) {
                        return Text(controller.status ==
                                AnimationStatus.completed
                            ? 'Defina quantos ciclos serão feitos e aperte Iniciar'
                            : '');
                      }),
                  Text(
                    'Tempo : ${(controller.duration!.inSeconds * controller.value).round()} segundos',
                    style: const TextStyle(fontSize: 20),
                  ),
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
                  SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: () {
                        if (controller.isAnimating) {
                          controller.stop();
                        } else {
                          if (isAnimatingForward) {
                            controller.forward();
                          } else {
                            controller.reverse();
                          }
                        }
                      },
                      child: Text(controller.isAnimating ? 'Pause' : '')),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: _decrementCounter,
                    icon: const Icon(Icons.remove),
                    label: Text('$_counter'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
