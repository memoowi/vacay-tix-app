import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vacay_tix/bloc/booking_list_bloc.dart';
import 'package:vacay_tix/bloc/qr_bloc.dart';
import 'package:vacay_tix/bloc/ticket_details_bloc.dart';
import 'package:vacay_tix/screen/ticket_details_partials/ticket_details_user_summary_section.dart';
import 'package:vacay_tix/screen/ticket_details_partials/ticket_info_summary_section.dart';
import 'package:vacay_tix/utils/custom_colors.dart';
import 'package:vacay_tix/widgets/custom_filled_button.dart';
import 'package:vacay_tix/widgets/custom_outline_button.dart';
import 'package:vacay_tix/screen/ticket_details_partials/ticket_details_payment_summary_section.dart';

class TicketDetailsScreen extends StatelessWidget {
  const TicketDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket Details'.toUpperCase()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: CustomColors.white,
            border: Border.all(
              color: CustomColors.mulberry,
              width: 1.4,
            ),
          ),
          child: BlocBuilder<TicketDetailsBloc, TicketDetailsState>(
            builder: (context, state) {
              if (state is TicketDetailsLoadedState) {
                final data = state.bookingModel.data!;
                return Column(
                  children: [
                    TicketInfoSummarySection(data: data),
                    SizedBox(height: 10),
                    Divider(
                      color: CustomColors.mulberry,
                    ),
                    SizedBox(height: 10),
                    TicketDetailsUserSummarySection(data: data),
                    SizedBox(height: 10),
                    data.qrCode != null
                        ? TicketDetailsPaymentSummarySection(
                            data: data,
                          )
                        : Container(),
                    SizedBox(height: 20),
                    data.qrCode == null && data.status == 'confirmed'
                        ? CustomFilledButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/qr_code_view',
                                // (Route<dynamic> route) {
                                //   if (route.settings.name == '/home') {
                                //     return true;
                                //   } else {
                                //     return false;
                                //   }
                                // },
                              );
                              context.read<QrBloc>().add(GenerateQrCode(
                                  bookingId: data.id!, context: context));
                              context
                                  .read<QrBloc>()
                                  .add(LoadQrCode(bookingId: data.id!));
                              context.read<TicketDetailsBloc>().add(
                                  LoadTicketDetailsEvent(bookingId: data.id!));
                              context
                                  .read<BookingListBloc>()
                                  .add(RefreshBookingListEvent());
                            },
                            label: 'Generate QR Code',
                          )
                        : Container(),
                    SizedBox(height: 10),
                    data.qrCode != null
                        ? CustomFilledButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/qr_code_view',
                              );
                              context.read<QrBloc>().add(
                                    LoadQrCode(
                                      bookingId: data.id!,
                                    ),
                                  );
                            },
                            label: 'View QR Code',
                          )
                        : Container(),
                    SizedBox(height: 10),
                    data.status == 'pending'
                        ? CustomOutlineButton(
                            onPressed: () {},
                            label: 'Cancel Booking',
                          )
                        : Container(),
                  ],
                );
              } else if (state is TicketDetailsLoadingState) {
                return Center(
                    child: LinearProgressIndicator(
                  color: CustomColors.coral,
                ));
              } else {
                return Text('Something went wrong...');
              }
            },
          ),
        ),
      ),
    );
  }
}
