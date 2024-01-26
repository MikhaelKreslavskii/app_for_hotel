part of 'hotel_bloc.dart';

class HotelState {}

class HotelInitial extends HotelState {}

class HotelLoading extends HotelState {}

class HotelLoaded extends HotelState {
  final List<Hotel> hotelList;

  HotelLoaded({required this.hotelList});
}

class HotelLoadFailure extends HotelState {
  final Object? exception;
  HotelLoadFailure({required this.exception});
}
