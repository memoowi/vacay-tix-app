import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:vacay_tix/bloc/booking_bloc.dart';
import 'package:vacay_tix/bloc/ticket_details_bloc.dart';
import 'package:vacay_tix/utils/custom_colors.dart';
import 'package:vacay_tix/widgets/custom_filled_button.dart';

class CustomModalBottom extends StatefulWidget {
  final int tourId;
  final String tourName;
  final int tourPrice;
  const CustomModalBottom({
    super.key,
    required this.tourId,
    required this.tourName,
    required this.tourPrice,
  });

  @override
  State<CustomModalBottom> createState() => _CustomModalBottomState();
}

class _CustomModalBottomState extends State<CustomModalBottom> {
  TextEditingController controller = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    controller = controller
      ..text = DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tour Name :',
            style: TextStyle(
              color: CustomColors.mulberry,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            widget.tourName,
            style: TextStyle(
              color: CustomColors.mulberry,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Booking Date :',
            style: TextStyle(
              color: CustomColors.mulberry,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 12),
          TextField(
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  Duration(days: 30),
                ),
              ).then(
                (value) {
                  if (value == null) return null;
                  setState(() {
                    selectedDate = value;
                  });
                  final formattedDate =
                      DateFormat('EEEE, dd MMMM yyyy').format(value);
                  return controller.text = formattedDate;
                },
              );
            },
            controller: controller,
            readOnly: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: CustomColors.mulberry,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: CustomColors.mulberry,
                  width: 2,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price :',
                style: TextStyle(
                  color: CustomColors.mulberry,
                  fontSize: 16,
                ),
              ),
              Text(
                NumberFormat.currency(
                  locale: 'id',
                  symbol: 'IDR ',
                  decimalDigits: 0,
                ).format(widget.tourPrice),
                style: TextStyle(
                  color: CustomColors.mulberry,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Spacer(),
          BlocConsumer<BookingBloc, BookingState>(
            listener: (context, state) {
              if (state is BookingSuccess) {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  '/details',
                );
                context.read<TicketDetailsBloc>().add(
                      LoadTicketDetailsEvent(bookingId: state.bookingId),
                    );
                context.read<BookingBloc>().add(ResetBookingEvent());
              }
            },
            builder: (context, state) {
              return CustomFilledButton(
                onPressed: (state is BookingLoading)
                    ? null
                    : () {
                        context.read<BookingBloc>().add(
                              NewBookingEvent(
                                tourId: widget.tourId,
                                bookingDate: selectedDate,
                                context: context,
                              ),
                            );
                      },
                label: 'Buy Ticket',
              );
            },
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
