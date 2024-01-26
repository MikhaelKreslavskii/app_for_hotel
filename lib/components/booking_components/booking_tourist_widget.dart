import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';

class BookingTouristWidget extends StatefulWidget {
  final int numberOfTourist;
  const BookingTouristWidget({required this.numberOfTourist});

  @override
  State<BookingTouristWidget> createState() =>
      _BookingTouristWidgetState(numberOfTourist);
}

class _BookingTouristWidgetState extends State<BookingTouristWidget> {
  bool visible = true;
  final int val;
  String text = "";
  String name = "";

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _birthController = TextEditingController();
  final _citizenController = TextEditingController();
  final _numberPasssport = TextEditingController();
  final _dateController = TextEditingController();

  bool _validateName = true;
  bool _validateSurname = true;
  bool _validateBirth = true;
  bool _validateCitizen = true;
  bool _validateNumber = true;
  bool _validateDate = true;

  final _nameFocus = FocusNode();
  final _surnameFocus = FocusNode();
  final _birthFocus = FocusNode();
  final _citizenFocus = FocusNode();
  final _numberFocus = FocusNode();
  final _dateFocus = FocusNode();
  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _birthController.dispose();
    _citizenController.dispose();
    _numberPasssport.dispose();
    _dateController.dispose();

    _nameFocus.dispose();
    _surnameFocus.dispose();
    _birthFocus.dispose();
    _citizenFocus.dispose();
    _numberFocus.dispose();
    _dateFocus.dispose();

    super.dispose();
  }

  bool click = false;

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  _BookingTouristWidgetState(this.val) {
    log(val.toString());
    switch (val) {
      case 1:
        {
          text = "Первый";
          break;
        }

      case 2:
        {
          text = "Второй";
          break;
        }

      case 3:
        {
          text = "Третий";
          break;
        }

      default:
        text = "Новый";
    }
  }
  @override
  Widget build(BuildContext context) {
    Icon icon = Icon(Icons.keyboard_arrow_up, color: Colors.blue);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, top: 16, bottom: 16),
                    child: Text(
                      "${text} турист",
                      style: TextStyle(
                          fontFamily: 'SF',
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 24.0, top: 13, bottom: 13),
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Center(
                          child: Icon(
                            (click == false)
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.blue,
                            size: 25,
                          ),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0))),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 231, 241, 255))),
                        onPressed: () {
                          setState(() {
                            click = !click;
                            visible = !visible;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Visibility(
                visible: visible,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 8, right: 16),
                        child: TextFormField(
                          controller: _nameController,
                          validator: (visible) ? _validatorName : null,
                          focusNode: _nameFocus,
                          onFieldSubmitted: (_) {
                            _fieldFocusChange(
                                context, _nameFocus, _surnameFocus);
                          },
                          decoration: InputDecoration(
                            fillColor: (_validateName == true)
                                ? Color.fromARGB(255, 246, 246, 249)
                                : Color.fromARGB(
                                    (255 * 0.15).toInt(), 235, 87, 87),
                            filled: true,
                            labelText: "Имя",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16, top: 8),
                        child: TextFormField(
                          focusNode: _surnameFocus,
                          onFieldSubmitted: (_) {
                            _fieldFocusChange(
                                context, _surnameFocus, _birthFocus);
                          },
                          controller: _surnameController,
                          validator: (visible) ? _validatorSurname : null,
                          decoration: InputDecoration(
                              fillColor: (_validateSurname == true)
                                  ? Color.fromARGB(255, 246, 246, 249)
                                  : Color.fromARGB(
                                      (255 * 0.15).toInt(), 235, 87, 87),
                              filled: true,
                              labelText: "Фамилия",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 8, right: 16),
                        child: MaskedTextField(
                          focusNode: _birthFocus,
                          onFieldSubmitted: (_) {
                            _fieldFocusChange(
                                context, _birthFocus, _citizenFocus);
                          },
                          mask: "##/##/####",
                          controller: _birthController,
                          validator: (visible) ? _validatorDate : null,
                          decoration: InputDecoration(
                              fillColor: (_validateBirth == true)
                                  ? Color.fromARGB(255, 246, 246, 249)
                                  : Color.fromARGB(
                                      (255 * 0.15).toInt(), 235, 87, 87),
                              filled: true,
                              labelText: "Дата рождения",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 8, right: 16),
                        child: TextFormField(
                          focusNode: _citizenFocus,
                          onFieldSubmitted: (_) {
                            _fieldFocusChange(
                                context, _citizenFocus, _numberFocus);
                          },
                          controller: _citizenController,
                          validator: (visible) ? _validatorCitizen : null,
                          decoration: InputDecoration(
                              fillColor: (_validateCitizen == true)
                                  ? Color.fromARGB(255, 246, 246, 249)
                                  : Color.fromARGB(
                                      (255 * 0.15).toInt(), 235, 87, 87),
                              filled: true,
                              labelText: "Гражданство",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 8, right: 16),
                        child: TextFormField(
                          focusNode: _numberFocus,
                          onFieldSubmitted: (_) {
                            _fieldFocusChange(
                                context, _numberFocus, _dateFocus);
                          },
                          controller: _numberPasssport,
                          validator: (visible) ? _validatorNumber : null,
                          decoration: InputDecoration(
                              fillColor: (_validateNumber == true)
                                  ? Color.fromARGB(255, 246, 246, 249)
                                  : Color.fromARGB(
                                      (255 * 0.15).toInt(), 235, 87, 87),
                              filled: true,
                              labelText: "Номер загранпаспорта",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 8, right: 16, bottom: 8),
                        child: MaskedTextField(
                          focusNode: _dateFocus,
                          onFieldSubmitted: (value) {
                            _dateFocus.unfocus();
                          },
                          mask: "##/##/####",
                          controller: _dateController,
                          validator: (visible) ? _validatorExpire : null,
                          decoration: InputDecoration(
                              fillColor: (_validateDate == true)
                                  ? Color.fromARGB(255, 246, 246, 249)
                                  : Color.fromARGB(
                                      (255 * 0.15).toInt(), 235, 87, 87),
                              filled: true,
                              labelText: "Срок действия загранпаспорта",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  String? _validatorDate(String? value) {
    if ((value!.isEmpty) || (value!.length < 6)) {
      _validateBirth = false;
      setState(() {});
      return "Введите дату рождения";
    }

    _validateBirth = true;
    setState(() {});
    return null;
  }

  String? _validatorName(String? value) {
    if (value!.isEmpty) {
      _validateName = false;
      setState(() {});

      return "Введите имя";
    }

    _validateName = true;
    setState(() {});

    return null;
  }

  String? _validatorSurname(String? value) {
    if (value!.isEmpty) {
      _validateSurname = false;
      setState(() {});

      return "Введите фамилию";
    }

    _validateSurname = true;
    setState(() {});

    return null;
  }

  String? _validatorCitizen(String? value) {
    if (value!.isEmpty) {
      _validateCitizen = false;
      setState(() {});

      return "Введите гражданство";
    }

    _validateCitizen = true;
    setState(() {});

    return null;
  }

  String? _validatorNumber(String? value) {
    if (value!.isEmpty) {
      _validateNumber = false;
      setState(() {});

      return "Введите номер загранпаспорта";
    }

    _validateNumber = true;
    setState(() {});

    return null;
  }

  String? _validatorExpire(String? value) {
    if ((value!.isEmpty) || (value!.length < 6)) {
      _validateDate = false;
      setState(() {});
      return "Введите дату рождения";
    }

    _validateDate = true;

    setState(() {});
    return null;
  }
}
