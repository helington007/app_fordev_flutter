import 'package:test/test.dart';

import 'package:app_fordev_flutter/validation/validators/validators.dart';

void main() {
  RequiredFieldValidation sut;

  setUp(() {
    sut = RequiredFieldValidation('any_field');
  });

  test('Should return null if values is not empty', () {
    expect(sut.validate('any_value'), null);
  });

  test('Should return error if values is empty', () {
    expect(sut.validate(''), 'Campo obrigatório.');
  });

  test('Should return error if values is null', () {
    expect(sut.validate(null), 'Campo obrigatório.');
  });
}
