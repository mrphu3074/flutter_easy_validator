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

  // Advance schema
  
    final contactSchema = V.map().shape({
    'firstName': V.string(),
    'lastName': V.string(),
    'phone': V.string(),
    'address': V.string()
  });

  final orderLineSchema = V.map().shape({
    'productId': V.int()..required(),
    'productName': V.string(),
    'qty': V.int()..required(),
    'price': V.double()..required(),
  });

  final saleOrderSchema = V.map().shape({
    'customer': V.string()..required(),
    "companyName": V.string(),
    'invoiceAddress': contactSchema,
    'deliveryAddress': contactSchema,
    'termsAndConditions': V.bool()..required(),
    'orderLines': V.list().of(orderLineSchema)..required()
  });

  final productSchema = V.map().shape({
    'name': V.string()..required()..label="Tên sản phẩm",
    'sku': V.string()..required(),
    'featured_image': V.string(),
    'type': V.string()..oneOf(['consumable', 'service']),
    'category_ids': V.list()..of(V.int()),
    'list_price': V.double()
      ..required()
      ..label = "Price",
    'sale_price': V.double()..label = "Sale Price",
    'cost': V.double()..label = "Cost",
    'description': V.string()
  });

  print(productSchema.validate({
    'name': '',
    'category_ids': [
      1,"abc",3
    ]
  }));
}
