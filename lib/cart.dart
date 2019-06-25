import 'package:jaguar_orm/jaguar_orm.dart';

import 'cart_item.dart';

part 'cart.jorm.dart';

class Cart {
  @PrimaryKey()
  int id;

  @Column(uniqueGroup: 'beverages_id', isNullable: true)
  int beverages_id;

  @Column(uniqueGroup: 'item_id', isNullable: true)
  int item_id;

  @HasMany(CartItemBean)
  List<CartItem> beverages;

  @HasOne(CartItemBean)
  CartItem item;

  @Column(isNullable: true)
  int amount;

  Cart({this.id, this.amount = 0, this.beverages_id = 0, this.item_id = 0, this.beverages = const [], this.item});

  Cart copy({id, amount, itemId, beveragesId, beverages, item}) {
    return Cart(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      item_id: itemId ?? this.item_id,
      beverages_id: beveragesId ?? this.beverages_id,
      beverages: beverages ?? this.beverages,
      item: item ?? this.item,
    );
  }

  @override
  String toString() => 'id=$id, amount=$amount, itemId=$item_id, beveragesId=$beverages_id, beverages=$beverages, item=$item';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Cart &&
              runtimeType == other.runtimeType &&
              amount == other.amount &&
              item_id == other.item_id &&
              beverages_id == other.beverages_id &&
              beverages == other.beverages &&
              item == other.item;

  @override
  int get hashCode => beverages.hashCode ^ amount.hashCode;
}

@GenBean()
class CartBean extends Bean<Cart> with _CartBean {
  CartBean(Adapter adapter)
      : cartItemBean = CartItemBean(adapter),
        super(adapter);

  @override
  final CartItemBean cartItemBean;

  @override
  String get tableName => 'cart';
}