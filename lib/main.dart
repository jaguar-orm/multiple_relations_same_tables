import 'package:jaguar_dart_example/cart.dart';
import 'package:jaguar_dart_example/cart_item.dart';
import 'package:jaguar_query_postgres/jaguar_query_postgres.dart';

/// The adapter
PgAdapter _adapter =
    new PgAdapter('dart_jaguar', username: 'postgres', password: 'postgres');

main() async {
  // Connect to database
  await _adapter.connect();

  // Create beans
  final cartBean = new CartBean(_adapter);
  final cartItemBean = new CartItemBean(_adapter);

  // Drop old tables
  await cartItemBean.drop();
  await cartBean.drop();

  // Create new tables
  await cartBean.createTable();
  await cartItemBean.createTable();

  final cart1 = new Cart()
    ..id = 1
    ..amount = 4
    ..item_id = 1
    ..beverages_id = 2
    ..item = (new CartItem()
      ..id = 1
      ..product = 'potato'
      ..quantity = 2)
    ..beverages = List.of([
      new CartItem()
        ..id = 2
        ..product = 'water'
        ..quantity = 2,
      new CartItem()
        ..id = 3
        ..product = 'soda'
        ..quantity = 3,
      new CartItem()
        ..id = 4
        ..product = 'juice'
        ..quantity = 4
    ]);
  await cartBean.insert(cart1, cascade: true);

  final cart = await cartBean.find(1, preload: true);
  print(cart);
}
