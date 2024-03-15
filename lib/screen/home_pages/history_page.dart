import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vacay_tix/bloc/booking_list_bloc.dart';
import 'package:vacay_tix/bloc/ticket_details_bloc.dart';
import 'package:vacay_tix/utils/custom_colors.dart';
import 'package:vacay_tix/widgets/history_ticket_tile.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          BlocBuilder<BookingListBloc, BookingListState>(
            builder: (context, state) {
              if (state is BookingListLoadedState) {
                final filteredData = state.bookingList.data!.where((element) =>
                    element.status == 'canceled' ||
                    element.qrCode?.isUsed == 'yes');
                if (filteredData.isEmpty) {
                  return Text('No Tickets found');
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: filteredData.length,
                  itemBuilder: (context, index) {
                    final data = filteredData.elementAt(index);
                    return HistoryTicketTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/details');
                        context.read<TicketDetailsBloc>().add(
                              LoadTicketDetailsEvent(bookingId: data.id!),
                            );
                      },
                      bookingId: data.id!,
                      tourName: data.tour!.name!,
                      bookingDate: data.bookingDate!,
                      isCanceled: data.status == 'canceled' ? true : false,
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
    );
  }
}
