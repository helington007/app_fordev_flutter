//package de terceiros
import 'package:meta/meta.dart';

//Meu domínio
import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';

//Minhas bibliotecas
import '../../http/http.dart';

//Meus Models
import '../../models/models.dart';

class RemoteAuthenticarion implements Authentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthenticarion({@required this.httpClient, @required this.url});

  Future<AccountEntity> auth(AuthenticationParams params) async {
    final body = RemoteAuthenticationParams.fromDomain(params).toJson();

    try {
      final httpResponse =
          await httpClient.request(url: url, method: 'post', body: body);
      return RemoteAccountModel.fromJson(httpResponse).toEntity();
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}

class RemoteAuthenticationParams {
  final String email;
  final String password; //secret

  RemoteAuthenticationParams(
      {@required this.email, @required this.password //secret
      });

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParams params) =>
      RemoteAuthenticationParams(
          email: params.email, password: params.password);

  Map toJson() => {'email': email, 'password': password};
}
