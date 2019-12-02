import 'package:flutter/material.dart';
import 'add_cryptos_bloc.dart';
export 'add_cryptos_bloc.dart';

class AddCryptosProvider extends InheritedWidget {
  final AddCryptosBloc bloc;

  AddCryptosProvider({Key key, Widget child})
      : bloc = AddCryptosBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static AddCryptosBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AddCryptosProvider)
            as AddCryptosProvider)
        .bloc;
  }
}
