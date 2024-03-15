import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vacay_tix/bloc/auth_bloc.dart';
import 'package:vacay_tix/bloc/booking_list_bloc.dart';
import 'package:vacay_tix/screen/home_pages/history_page.dart';
import 'package:vacay_tix/screen/home_pages/my_ticket_page.dart';
import 'package:vacay_tix/screen/home_pages/todo_section.dart';
import 'package:vacay_tix/widgets/custom_alert_logout.dart';
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
  void initState() {
    super.initState();
    context.read<BookingListBloc>().add(SetInitialBookingListEvent());
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
        title: FutureBuilder(
          future: context.read<AuthBloc>().getUser(),
          builder: (context, snapshot) {
            final user = snapshot.data;
            return Text('VacayTix,\nHi, ${user?.name}!');
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (builder) {
                  return CustomAlertLogout();
                },
              );
            },
            icon: Icon(Icons.logout),
            tooltip: 'logout',
          ),
        ],
        toolbarHeight: 72,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<BookingListBloc>().add(RefreshBookingListEvent());
        },
        child: SingleChildScrollView(
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
                          onPressed: indexListPage == 0
                              ? null
                              : () {
                                  _onItemTapped(0);
                                  context
                                      .read<BookingListBloc>()
                                      .add(RefreshBookingListEvent());
                                },
                          title: 'My Tickets',
                          isSelected: indexListPage == 0 ? true : false,
                        ),
                        HomeListButton(
                          onPressed: indexListPage == 1
                              ? null
                              : () {
                                  _onItemTapped(1);
                                  context
                                      .read<BookingListBloc>()
                                      .add(RefreshBookingListEvent());
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
      ),
    );
  }
}
