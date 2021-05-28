enum DomainError { unexpected, invalidCredentials }

extension DomainErrorExtension on DomainError {
  String get description {
    //this => chama o próprio objeto
    switch (this) {
      case DomainError.invalidCredentials:
        //Texto deve ser igual ao do arquivo "C:\projects\flutter\app_fordev_flutter\test\presentation\presenters\stream_login_presenter_test.dart" na linha "182"
        return 'Credenciais inválidas.';
      default:
        //Texto deve ser igual ao do arquivo "C:\projects\flutter\app_fordev_flutter\test\presentation\presenters\stream_login_presenter_test.dart" na linha "204"
        return 'Algo errado aconteceu. Tente novamente em breve.';
    }
  }
}
