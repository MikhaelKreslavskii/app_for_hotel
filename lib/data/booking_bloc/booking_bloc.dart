import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/data/booking_bloc/booking_repository.dart';
import 'package:hotel_app/data/hotel_bloc/hotel_repository.dart';

import '../../models/booking.dart';
import '../../models/hotel.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<LoadBooking>((event, emit) async {
      try {
        emit(BookingLoading());
        final booking = await repository.getBooking();
        emit(BookingLoaded(booking: booking));
      } catch (e) {
        emit(BookingLoadingFailure(exception: e));
        // TODO
      }
    });
  }
  final repository = BookingRepository();
}
