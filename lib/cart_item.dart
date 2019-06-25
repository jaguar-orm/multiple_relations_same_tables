import 'package:jaguar_orm/jaguar_orm.dart';

import 'package:jaguar_dart_example/cart.dart';

part 'cart_item.jorm.dart';

class CartItem {
  @PrimaryKey()
  int id;

  @Column(isNullable: true)
  int amount;

  @Column(isNullable: true)
  String product;

  @Column(isNullable: true)
  int quantity;

  @BelongsTo(CartBean, isNullable: true, refCol: 'beverages_id')
  int cartBeveragesId;

  @BelongsTo(CartBean, isNullable: true, refCol: 'item_id')
  int cartItemId;

  CartItem({this.amount, this.product, this.quantity, this.id, this.cartBeveragesId, this.cartItemId});
  CartItem.make(this.amount, this.product, this.quantity);

  @override
  String toString() =>
      'id=$id, amount=$amount, quantity=$quantity, product=$product, cartBeveragesId=$cartBeveragesId, cartItemId=$cartItemId';

  CartItem copy({int id, int quantity, String product, int amount, int cartBeveragesId, int cartItemId}) {
    return CartItem(
      amount: amount ?? this.amount,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      id: id ?? this.id,
      cartBeveragesId: cartBeveragesId ?? this.cartBeveragesId,
      cartItemId: cartItemId ?? this.cartItemId,

    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CartItem &&
              runtimeType == other.runtimeType &&
              amount == other.amount &&
              product == other.product &&
              quantity == other.quantity &&
              cartBeveragesId == other.cartBeveragesId &&
              cartItemId == other.cartItemId;

  @override
  int get hashCode => amount.hashCode ^ product.hashCode ^ quantity.hashCode;
}

@GenBean()
class CartItemBean extends Bean<CartItem> with _CartItemBean {
  CartItemBean(Adapter adapter) : super(adapter);

  CartBean _cartBean;

  @override
  String get tableName => 'cartItem';

  @override
  CartBean get cartBean => _cartBean ??= CartBean(adapter);
}