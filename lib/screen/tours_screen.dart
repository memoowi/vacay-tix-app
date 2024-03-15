import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:vacay_tix/bloc/tour_list_bloc.dart';
import 'package:vacay_tix/utils/config.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class ToursScreen extends StatelessWidget {
  const ToursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TourListBloc>().add(LoadTourList());
    return Scaffold(
      appBar: AppBar(
        title: Text('Tours'.toUpperCase()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              BlocBuilder<TourListBloc, TourListState>(
                builder: (context, state) {
                  if (state is TourListLoadedState) {
                    final tours = state.tours;
                    return ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16),
                        itemCount: tours.length,
                        itemBuilder: (context, index) {
                          final data = tours[index];
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/tour_details');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: CustomColors.chestnut,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Image.network(
                                      Config.baseUrl + '/' + data.imageUrls![0],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.name!.toUpperCase(),
                                          style: TextStyle(
                                            color: CustomColors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Icon(
                                              CupertinoIcons.map_pin_ellipse,
                                              color: CustomColors.mulberry,
                                            ),
                                            SizedBox(width: 5),
                                            Expanded(
                                              child: Text(
                                                data.location!,
                                                style: TextStyle(
                                                  color: CustomColors.white,
                                                  fontSize: 16,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.payments,
                                              color: CustomColors.mulberry,
                                            ),
                                            SizedBox(width: 5),
                                            Expanded(
                                              child: Text(
                                                NumberFormat.currency(
                                                  locale: 'id',
                                                  symbol: 'IDR ',
                                                  decimalDigits: 0,
                                                ).format(data.price),
                                                style: TextStyle(
                                                  color: CustomColors.white,
                                                  fontSize: 16,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Icon(
                                              CupertinoIcons.info,
                                              color: CustomColors.mulberry,
                                            ),
                                            SizedBox(width: 5),
                                            Expanded(
                                              child: Text(
                                                data.description!,
                                                style: TextStyle(
                                                  color: CustomColors.white,
                                                  fontSize: 16,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  } else if (state is TourListLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: CustomColors.terracotta,
                      ),
                    );
                  } else {
                    return Text('Something went wrong...');
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
