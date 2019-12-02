import 'package:flutter/material.dart';

import '../blocs/add_cryptos/add_cryptos_provider.dart';

class InputArea extends StatelessWidget {
  final String label;
  final String hint;
  final String buttonText;
  final Function onSubmit;

  InputArea({this.label, this.hint, this.buttonText, this.onSubmit});

  Widget build(context) {
    final bloc = AddCryptosProvider.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildLabel(label),
          buildCryptoInputField(bloc, hint),
        ],
      ),
    );
  }

  Widget buildLabel(String label) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
    );
  }

  Widget buildCryptoInputField(AddCryptosBloc bloc, String hint) {
    return StreamBuilder(
        stream: bloc.cryptoCurrency,
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.only(top: 24.0),
            child: TextField(
              onChanged: bloc.changeCryptocurrency,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: hint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                errorText: snapshot.error,
              ),
            ),
          );
        });
  }
}
