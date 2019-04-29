import 'package:easy_validator/easy_validator.dart' as V;

void main() {
  final schema = V.map().shape({
    'email': V.string()
      ..required()
      ..email()
      ..label = "Email",
    'password': V.string()
      ..required()
      ..min(6)
      ..max(8)
      ..label = "Password",
    'isRemember': V.bool()..label = "Remember"
  });

  // valid
  Map errors;
  errors =
      schema.validate({'email': 'mrphu3074@gmail.com', 'password': '123456'});
  print("VALID");
  print(errors); // {} | Empty

  // invalid
  errors =
      schema.validate({'email': 'mrphu3074@gmail', 'password': '123456789'});

  print("INVALID");
  print(errors);
  // {
  //    email: Email must be a valid email,
  //    password: Password must be at most 8 characters
  // }
}
