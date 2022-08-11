import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstPage(),
        '/second': (context) => SecondPage(
              data: List.generate(300, (i) => "Ini data ke $i"),
            ),
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        leading: const Icon(
          Icons.favorite,
          color: Colors.pink,
          size: 24.0,
          semanticLabel: 'Text to announce in accessibility modes',
        ),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the `FirstScreen` widget
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/second');
          },
          child: const Text('List Data Pages'),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.data}) : super(key: key);
  final List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List View")),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.ad_units),
              title: Text("${data[index]}"),
            );
          }),
    );
  }
}
