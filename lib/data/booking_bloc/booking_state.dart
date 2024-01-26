part of 'booking_bloc.dart';

class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingLoaded extends BookingState {
  final Booking booking;

  BookingLoaded({required this.booking});
}

class BookingLoadingFailure extends BookingState {
  final Object? exception;

  BookingLoadingFailure({required this.exception});
}
