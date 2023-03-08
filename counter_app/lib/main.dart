import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Counter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<int> _counters = [0, 0, 0]; // initialize with 3 counters

  void _incrementCounter() {
    setState(() {
      _counters[_currentIndex]++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Counter incremented')),
    );
  }

  void _decrementCounter() {
    setState(() {
      _counters[_currentIndex]--;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Counter decremented')),
    );
  }

  void _resetCounter() {
    setState(() {
      _counters[_currentIndex] = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _counters.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            tabs: _counters
                .asMap()
                .map((index, _) => MapEntry(
                index,
                Tab(
                  text: 'Counter ${index + 1}',
                )))
                .values
                .toList(),
          ),
        ),
        body: TabBarView(
          children: _counters
              .asMap()
              .map((index, _) => MapEntry(
              index,
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${_counters[index]}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _decrementCounter,
                          child: const Icon(Icons.remove),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: _resetCounter,
                          child: const Text('Reset'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: _incrementCounter,
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              )))
              .values
              .toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
