import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vacay_tix/bloc/booking_list_bloc.dart';
import 'package:vacay_tix/utils/custom_colors.dart';
import 'package:vacay_tix/widgets/dot_ticket_tile.dart';

class PaidScreen extends StatelessWidget {
  const PaidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BookingListBloc>().add(RefreshBookingListEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'.toUpperCase()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Generate QR Code to your paid tickets',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Divider(
                color: CustomColors.mulberry,
                thickness: 2.0,
              ),
              BlocBuilder<BookingListBloc, BookingListState>(
                builder: (context, state) {
                  if (state is BookingListLoadedState) {
                    final filteredData = state.bookingList.data!.where(
                        (element) =>
                            element.status == 'confirmed' &&
                            element.qrCode == null);
                    if (filteredData.isEmpty) {
                      return Center(
                        child: Text('No Tickets found'),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: filteredData.length,
                      itemBuilder: (context, index) {
                        final data = filteredData.elementAt(index);
                        return DotTicketTile(
                          onTap: () {
                            Navigator.pushNamed(context, '/details');
                          },
                          bookingId: data.id!,
                          tourName: data.tour!.name!,
                          bookingDate: data.bookingDate!,
                          isPaid: true,
                        );
                      },
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: CustomColors.terracotta,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
