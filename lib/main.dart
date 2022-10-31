import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = List<String>.generate(20, (i) => 'Item ${i + 1}');
  List<Color> colors = List<Color>.generate(20, (i) => Colors.white);

  bool isBought = false;

  @override
  Widget build(BuildContext context) {
    const title = 'Coloring Items';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            final color = colors[index];
            isBought ? Colors.red : Colors.green;
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.endToStart) {
                  setState(() {
                    colors[index] = Colors.red;
                  });
                } else {
                  setState(() {
                    colors[index] = Colors.green;
                  });
                }
              },
              child: ListTile(
                title: Container(color: colors[index], child: Text(item)),
              ),
            );
          },
        ),
      ),
    );
  }
}
