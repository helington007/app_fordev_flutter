import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../login_presenter.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);
    return StreamBuilder<String>(
        stream: presenter.emailErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              icon: Icon(
                Icons.email,
                color: Theme.of(context).primaryColorLight,
              ),
              //Valores vazios "" são um problema, pois não dá pra validar valores vazios
              //2 => snapshot.data? => Está comparando se contém algum dado, vazio "" ou não
              //3 => snapshot.data?.isEmpty => Está comparando se contém algum dado, e se esse mesmo dado obserevado é vazio ""
              //4 => se as duas condições forem verdadeiras, ele "errorText" como "null"
              //5 => caso contrário, ele encontrou um valor correto e apresenta os dados, normalmente
              errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: presenter.validateEmail,
          );
        });
  }
}
