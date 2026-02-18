import 'package:flutter/material.dart';
import 'color_service.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Home()),
    ),
  );
}

enum CardType {
  red(Colors.red),
  yellow(Colors.yellow),
  green(Colors.green),
  blue(Colors.blue);

  const CardType(this.color);
  final Color color;
}

// global instance of ColorService
final ColorService colorService = ColorService();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0 ? ColorTapsScreen() : StatisticsScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.tap_and_play),
            label: 'Taps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: [
          ColorTap(type: CardType.red),
          ColorTap(type: CardType.yellow),
          ColorTap(type: CardType.green),
          ColorTap(type: CardType.blue),
        ],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;

  const ColorTap({super.key, required this.type});

  Color get backgroundColor => type.color;

  int get tapCount => type == CardType.red
      ? colorService.redTapCount
      : type == CardType.blue
      ? colorService.blueTapCount
      : type == CardType.green
      ? colorService.greenTapCount
      : colorService.yellowTapCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: type == CardType.red
          ? colorService.incrementRedTapCount
          : type == CardType.blue
          ? colorService.incrementBlueTapCount
          : type == CardType.green
          ? colorService.incrementGreenTapCount
          : colorService.incrementYellowTapCount,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: ListenableBuilder(
            listenable: colorService,
            builder: (context, child) {
              return Text(
                'Taps: $tapCount',
                style: TextStyle(fontSize: 24, color: Colors.white),
              );
            },
          ),
        ),
      ),  
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Red Taps: ${colorService.redTapCount}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Yellow Taps: ${colorService.yellowTapCount}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Green Taps: ${colorService.greenTapCount}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Blue Taps: ${colorService.blueTapCount}',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
