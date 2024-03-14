import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vacay_tix/utils/custom_colors.dart';
import 'package:vacay_tix/widgets/custom_filled_button.dart';

class CustomModalBottom extends StatefulWidget {
  final int tour_id;
  final String tour_name;
  final int tour_price;
  const CustomModalBottom({
    super.key,
    required this.tour_id,
    required this.tour_name,
    required this.tour_price,
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
            widget.tour_name,
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
                  return controller.text =
                      DateFormat('EEEE, dd MMMM yyyy').format(value);
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
                ).format(widget.tour_price),
                style: TextStyle(
                  color: CustomColors.mulberry,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Spacer(),
          CustomFilledButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/details',
                (route) {
                  if (route.isFirst) {
                    return true;
                  } else {
                    return false;
                  }
                },
              );
            },
            label: 'Buy Ticket',
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
