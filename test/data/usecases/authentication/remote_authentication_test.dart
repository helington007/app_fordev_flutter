//Pacotes de terceiros
import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

//Meus pacotes de domínio
import 'package:app_fordev_flutter/domain/usecases/usecases.dart';
import 'package:app_fordev_flutter/domain/helpers/helpers.dart';

//Minhas bibliotecas
import 'package:app_fordev_flutter/data/usecases/usecases.dart';
import 'package:app_fordev_flutter/data/http/http.dart';

/*
* Adicionando "_" ao método tornamos ele um método privado
* Excemplo de método privado => _mockupRequest()
* Excemplo de método público => _mockupRequest()
*/

class HttpClientSpy extends Mock implements HttpClient {
  //CODE...
}

void main() {
  RemoteAuthenticarion sut;
  HttpClientSpy httpClient;
  String url;
  AuthenticationParams params;

  Map mockupValidData() =>
      {'accessToken': faker.guid.guid(), 'name': faker.person.name()};

  PostExpectation mockupRequest() => when(httpClient.request(
      url: anyNamed('url'),
      method: anyNamed('method'),
      body: anyNamed('body')));

  void mockupHttpData(Map data) {
    mockupRequest().thenAnswer((_) async => data);
  }

  void mockupHttpError(HttpError error) {
    mockupRequest().thenThrow(error);
  }

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthenticarion(url: url, httpClient: httpClient);

    params = AuthenticationParams(
        email: faker.internet.email(), password: faker.internet.password());

    mockupHttpData(mockupValidData());
  });

  test('Should call HttpClient with correct values', () async {
    await sut.auth(params);

    verify(httpClient.request(
        url: url,
        method: 'post',
        body: {'email': params.email, 'password': params.password}));
  });

  test('Should throw UnexpectedError if HttpClient returns 400', () async {
    mockupHttpError(HttpError.badRequest);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 404', () async {
    mockupHttpError(HttpError.notFound);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    mockupHttpError(HttpError.serverError);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw InvalidCredentialsError if HttpClient returns 401',
      () async {
    mockupHttpError(HttpError.unauthorized);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.invalidCredentials));
  });

  test('Should return an account if HttpClient returns 200', () async {
    final validData = mockupValidData();

    mockupHttpData(validData);

    final account = await sut.auth(params);

    expect(account.token, validData['accessToken']);
  });

  test(
      'Should throw UnexpectedError if HttpClient returns 200 with invalid data',
      () async {
    mockupHttpData({'invalid_key': 'invalid_value'});

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });
}
