import 'package:flutter/material.dart';
import 'package:simple_home_page_app/dialoguebox.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeSection(),
    const Text('Search Page', style: TextStyle(fontSize: 24)),
    const Text('Profile Page', style: TextStyle(fontSize: 24)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 158, 200, 235),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  final List<String> items =
      List<String>.generate(20, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            leading: Icon(Icons.label),
            title: Text(items[index]),
            subtitle: Text("Subtitle $index"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Handle item tap
              DialogueBox.showMyDialog(
                context,
                "Item clicked",
                "You clicked on ${items[index]}",
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped on ${items[index]}')),
              );
            },
          ),
        );
      },
    );
  }
}
