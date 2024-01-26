import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';

class BookingCustomerInfo extends StatefulWidget {
  BookingCustomerInfo({super.key});

  @override
  State<BookingCustomerInfo> createState() => _BookingCustomerInfoState();
}

class _BookingCustomerInfoState extends State<BookingCustomerInfo> {
  final emailController = TextEditingController();
  var colorForm = Color.fromARGB(255, 246, 246, 249);
  int validated = 0;
  String errorMsg = "Пожалуйста, введите правильную почту";
  bool _validatePhone = true;
  bool _validateEmail = true;

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 16, right: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Информация о покупателе",
            style: TextStyle(
                fontSize: 22, fontFamily: 'SF', fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: MaskedTextField(
                mask: "+7(###) ###-##-##",
                validator: validatorPhone,
                decoration: InputDecoration(
                    labelText: "Номер телефона",
                    hintText: "+7(***) ***-**-**",
                    fillColor: (_validatePhone == true)
                        ? Color.fromARGB(255, 246, 246, 249)
                        : Color.fromARGB((255 * 0.15).toInt(), 235, 87, 87),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: TextFormField(
                controller: emailController,
                validator: validatorEmail,
                decoration: InputDecoration(

                    /// errorText: validateEmail(emailController.text),
                    fillColor: (_validateEmail == true)
                        ? Color.fromARGB(255, 246, 246, 249)
                        : Color.fromARGB((255 * 0.15).toInt(), 235, 87, 87),
                    filled: true,
                    labelText: "Почта",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none)),

                ///placeholder: widget.hintText,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту",
            style: TextStyle(
                fontSize: 14,
                fontFamily: 'SF',
                color: Color.fromARGB(255, 130, 135, 150)),
          ),
          SizedBox(
            height: 8,
          )
        ]),
      ),
    );
  }

  String? validatorEmail(String? email) {
    if (email!.isEmpty) {
      _validateEmail = false;
      setState(() {});
      return "Введите почту";
    }
    if (EmailValidator.validate(email!)) {
      _validateEmail = true;
      setState(() {});
      return null;
    }
    _validateEmail = false;
    setState(() {});
    setState(() {});
    return "Введите корректную почту";
  }

  String? validatorPhone(String? phone) {
    if ((phone!.isEmpty) || (phone!.length < 10)) {
      _validatePhone = false;
      setState(() {});
      return "Введите номер телефона";
    }

    _validatePhone = true;
    setState(() {});
    return null;
  }
}
