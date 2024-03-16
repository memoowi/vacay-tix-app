import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:vacay_tix/bloc/tour_bloc.dart';
import 'package:vacay_tix/utils/config.dart';
import 'package:vacay_tix/utils/custom_colors.dart';
import 'package:vacay_tix/widgets/custom_filled_button.dart';
import 'package:vacay_tix/widgets/custom_modal_bottom.dart';
import 'package:vacay_tix/widgets/image_carousel_container.dart';

class TourDetailsScreen extends StatefulWidget {
  TourDetailsScreen({super.key});

  @override
  State<TourDetailsScreen> createState() => _TourDetailsScreenState();
}

class _TourDetailsScreenState extends State<TourDetailsScreen> {
  int indexListPage = 0;

  final CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tour Details'.toUpperCase()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<TourBloc, TourState>(
          builder: (context, state) {
            if (state is TourLoadedState) {
              final data = state.tourModel.data!;
              final imageUrls = data.imageUrls!;
              final List<Widget> items = [];
              imageUrls.forEach((element) {
                items.add(ImageCarouselContainer(
                    imageUrl: Config.baseUrl + '/' + element));
              });
              return Column(
                children: [
                  SizedBox(height: 16),
                  CarouselSlider(
                    items: items,
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                      enlargeFactor: 0.4,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          indexListPage = index;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton.outlined(
                        onPressed: indexListPage == 0
                            ? null
                            : () {
                                buttonCarouselController.previousPage();
                                setState(() {
                                  indexListPage--;
                                });
                              },
                        icon: Icon(Icons.arrow_back),
                      ),
                      SizedBox(width: 16),
                      Text('${indexListPage + 1}/${items.length}'),
                      SizedBox(width: 16),
                      IconButton.outlined(
                        onPressed: indexListPage == items.length - 1
                            ? null
                            : () {
                                buttonCarouselController.nextPage();
                                setState(() {
                                  indexListPage++;
                                });
                              },
                        icon: Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.label_important_outline,
                              color: Colors.green.shade800,
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                data.name!,
                                style: TextStyle(
                                  color: CustomColors.mulberry,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
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
                              CupertinoIcons.map_pin_ellipse,
                              color: CustomColors.coral,
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                data.location!,
                                style: TextStyle(
                                  color: CustomColors.mulberry,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
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
                              color: CustomColors.chestnut,
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
                                  color: CustomColors.mulberry,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14),
                        Text(
                          'Description :',
                          style: TextStyle(
                            color: CustomColors.mulberry,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: CustomColors.mulberry,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          data.description!,
                          style: TextStyle(
                            color: CustomColors.mulberry,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 20),
                        CustomFilledButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              showDragHandle: true,
                              backgroundColor: CustomColors.eggshell,
                              clipBehavior: Clip.hardEdge,
                              constraints: BoxConstraints(
                                minWidth: double.infinity,
                              ),
                              builder: (context) {
                                return CustomModalBottom(
                                  tour_id: 1,
                                  tour_name: 'Rinjani',
                                  tour_price: 25000,
                                );
                              },
                            );
                          },
                          label: 'Book Now',
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is TourLoadingState) {
              return Center(
                child: LinearProgressIndicator(
                  color: CustomColors.terracotta,
                ),
              );
            } else {
              return Text('Something went wrong...');
            }
          },
        ),
      ),
    );
  }
}
