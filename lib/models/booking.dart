class Booking {
  Booking({
    required this.id,
    required this.hotelName,
    required this.hotelAdress,
    required this.horating,
    required this.ratingName,
    required this.departure,
    required this.arrivalCountry,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.room,
    required this.nutrition,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
  });
  late final int id;
  late final String hotelName;
  late final String hotelAdress;
  late final int horating;
  late final String ratingName;
  late final String departure;
  late final String arrivalCountry;
  late final String tourDateStart;
  late final String tourDateStop;
  late final int numberOfNights;
  late final String room;
  late final String nutrition;
  late final int tourPrice;
  late final int fuelCharge;
  late final int serviceCharge;
  
  Booking.fromJson(Map<String, dynamic> json){
    id = json['id'];
    hotelName = json['hotel_name'];
    hotelAdress = json['hotel_adress'];
    horating = json['horating'];
    ratingName = json['rating_name'];
    departure = json['departure'];
    arrivalCountry = json['arrival_country'];
    tourDateStart = json['tour_date_start'];
    tourDateStop = json['tour_date_stop'];
    numberOfNights = json['number_of_nights'];
    room = json['room'];
    nutrition = json['nutrition'];
    tourPrice = json['tour_price'];
    fuelCharge = json['fuel_charge'];
    serviceCharge = json['service_charge'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['hotel_name'] = hotelName;
    _data['hotel_adress'] = hotelAdress;
    _data['horating'] = horating;
    _data['rating_name'] = ratingName;
    _data['departure'] = departure;
    _data['arrival_country'] = arrivalCountry;
    _data['tour_date_start'] = tourDateStart;
    _data['tour_date_stop'] = tourDateStop;
    _data['number_of_nights'] = numberOfNights;
    _data['room'] = room;
    _data['nutrition'] = nutrition;
    _data['tour_price'] = tourPrice;
    _data['fuel_charge'] = fuelCharge;
    _data['service_charge'] = serviceCharge;
    return _data;
  }
}