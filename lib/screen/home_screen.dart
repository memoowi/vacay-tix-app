import 'package:flutter/material.dart';
import 'package:vacay_tix/screen/home_pages/history_page.dart';
import 'package:vacay_tix/screen/home_pages/my_ticket_page.dart';
import 'package:vacay_tix/screen/home_pages/todo_section.dart';
import 'package:vacay_tix/widgets/home_list_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexListPage = 0;

  List<Widget> listPage = [
    MyTicketsPage(),
    HistoryPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      indexListPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Image.asset(
            'assets/logo/logo-2.png',
          ),
        ),
        title: Text('VacayTix,\nHi, User!'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
            icon: Icon(Icons.logout),
            tooltip: 'logout',
          ),
        ],
        toolbarHeight: 72,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ToDo(),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      HomeListButton(
                        onPressed: () {
                          _onItemTapped(0);
                        },
                        title: 'My Tickets',
                        isSelected: indexListPage == 0 ? true : false,
                      ),
                      HomeListButton(
                        onPressed: () {
                          _onItemTapped(1);
                        },
                        title: 'History',
                        isSelected: indexListPage == 1 ? true : false,
                      ),
                    ],
                  ),
                  listPage[indexListPage],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
