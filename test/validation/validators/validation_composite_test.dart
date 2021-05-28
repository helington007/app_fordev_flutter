import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:app_fordev_flutter/validation/protocols/protocols.dart';
import 'package:app_fordev_flutter/validation/validators/validators.dart';

class FieldValidationSpy extends Mock implements FieldValidation {
  //CODE...
}

void main() {
  ValidationComposite sut;
  FieldValidationSpy validationNull;
  FieldValidationSpy validationEmpty;
  FieldValidationSpy validationOtherField;

  //validation1
  void mockValidationNull(String error) {
    when(validationNull.validate(any)).thenReturn(error);
  }

  //validation2
  void mockValidationEmpty(String error) {
    when(validationEmpty.validate(any)).thenReturn(error);
  }

  //validation3
  void mockValidationOtherField(String error) {
    when(validationOtherField.validate(any)).thenReturn(error);
  }

  setUp(() {
    //validation1
    validationNull = FieldValidationSpy();
    when(validationNull.field).thenReturn('other_field');
    mockValidationNull(null);

    //validation2
    validationEmpty = FieldValidationSpy();
    when(validationEmpty.field).thenReturn('any_field');
    mockValidationEmpty(null);

    //validation3
    validationOtherField = FieldValidationSpy();
    when(validationOtherField.field).thenReturn('any_field');
    mockValidationOtherField(null);

    sut = ValidationComposite(
        //validation1, //validation2, //validation3
        [validationNull, validationEmpty, validationOtherField]);
  });

  test('Should return null if all validations returns null or empty', () {
    mockValidationEmpty('');
    final error = sut.validate(field: 'any_field', value: 'any_value');

    expect(error, null);
  });

  test('Should return the first error of the field', () {
    //validation1
    mockValidationNull('error_1');
    //validation2
    mockValidationEmpty('error_2');
    //validation3
    mockValidationOtherField('error_3');

    final error = sut.validate(field: 'any_field', value: 'any_value');

    expect(error, 'error_2');
  });
}
