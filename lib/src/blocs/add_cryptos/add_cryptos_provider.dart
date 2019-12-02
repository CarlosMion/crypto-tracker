import 'package:flutter/material.dart';
import 'add_cryptos_bloc.dart';

class AddCryptosProvider extends InheritedWidget {
  final bloc = AddCryptosBloc();

  AddCryptosProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static AddCryptosBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AddCryptosProvider)
            as AddCryptosProvider)
        .bloc;
  }
}
