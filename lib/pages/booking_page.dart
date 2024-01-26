import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotel_app/data/booking_bloc/booking_bloc.dart';
import 'package:hotel_app/data/booking_bloc/booking_repository.dart';
import 'package:hotel_app/pages/success_page.dart';
import 'package:masked_text/masked_text.dart';

import '../components/booking_components/booking_customer_info_widget.dart';
import '../components/booking_components/booking_data_widget.dart';
import '../components/booking_components/booking_hotel_widget.dart';
import '../components/booking_components/booking_price.dart';
import '../components/booking_components/booking_tourist_widget.dart';
import '../models/booking.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  final bookingBloc = BookingBloc();

  @override
  void initState() {
    bookingBloc.add(LoadBooking());
    super.initState();
  }

  List<BookingTouristWidget> tourists = [];
  int tourist = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            "Бронирование",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'SF',
                fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BlocBuilder<BookingBloc, BookingState>(
          bloc: bookingBloc,
          builder: (context, state) {
            if (state is BookingLoaded) {
              return SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BookingHotelWidget(
                        hotel: state.booking,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      BookingDataWidget(
                        booking: state.booking,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            BookingCustomerInfo(),
                            SizedBox(
                              height: 8,
                            ),
                            SingleChildScrollView(
                              child: Column(children: [
                                for (int i = 1; i <= tourist; i++) ...[
                                  BookingTouristWidget(
                                    numberOfTourist: i,
                                  )
                                ]
                              ]),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  "Добавить туриста",
                                  style: TextStyle(
                                      fontFamily: 'SF',
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 24.0, top: 13, bottom: 13),
                                child: SizedBox(
                                  width: 32,
                                  height: 32,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(Icons.add),
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        6.0))),
                                        iconColor:
                                            MaterialStatePropertyAll<Color>(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStatePropertyAll<Color>(
                                                Color.fromARGB(
                                                    255, 13, 114, 255))),
                                    onPressed: () {
                                      setState(() {
                                        tourist++;
                                      });
                                    },
                                  ),
                                ),
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      BookingPrice(
                        booking: state.booking,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16),
                        child: SizedBox(
                          width: 343,
                          height: 48,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Color.fromARGB(255, 13, 114, 255)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                )),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  log("BOOKED");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SuccessPage()),
                                  );
                                }
                              },
                              child: Text(
                                "Оплатить ${state.booking.tourPrice} Р",
                                style: TextStyle(
                                    fontFamily: 'SF',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )),
                        ),
                      )
                    ]),
              );
            }

            if (state is BookingLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Error with connection."),
                    ElevatedButton(
                      onPressed: () {
                        bookingBloc.add(LoadBooking());
                      },
                      child: Text("Try again"),
                    )
                  ],
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
