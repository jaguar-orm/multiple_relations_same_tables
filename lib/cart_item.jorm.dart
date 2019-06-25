// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _CartItemBean implements Bean<CartItem> {
  final id = IntField('id');
  final amount = IntField('amount');
  final product = StrField('product');
  final quantity = IntField('quantity');
  final cartBeveragesId = IntField('cart_beverages_id');
  final cartItemId = IntField('cart_item_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        amount.name: amount,
        product.name: product,
        quantity.name: quantity,
        cartBeveragesId.name: cartBeveragesId,
        cartItemId.name: cartItemId,
      };
  CartItem fromMap(Map map) {
    CartItem model = CartItem();
    model.id = adapter.parseValue(map['id']);
    model.amount = adapter.parseValue(map['amount']);
    model.product = adapter.parseValue(map['product']);
    model.quantity = adapter.parseValue(map['quantity']);
    model.cartBeveragesId = adapter.parseValue(map['cart_beverages_id']);
    model.cartItemId = adapter.parseValue(map['cart_item_id']);

    return model;
  }

  List<SetColumn> toSetColumns(CartItem model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(amount.set(model.amount));
      ret.add(product.set(model.product));
      ret.add(quantity.set(model.quantity));
      ret.add(cartBeveragesId.set(model.cartBeveragesId));
      ret.add(cartItemId.set(model.cartItemId));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(amount.name)) ret.add(amount.set(model.amount));
      if (only.contains(product.name)) ret.add(product.set(model.product));
      if (only.contains(quantity.name)) ret.add(quantity.set(model.quantity));
      if (only.contains(cartBeveragesId.name))
        ret.add(cartBeveragesId.set(model.cartBeveragesId));
      if (only.contains(cartItemId.name))
        ret.add(cartItemId.set(model.cartItemId));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.amount != null) {
        ret.add(amount.set(model.amount));
      }
      if (model.product != null) {
        ret.add(product.set(model.product));
      }
      if (model.quantity != null) {
        ret.add(quantity.set(model.quantity));
      }
      if (model.cartBeveragesId != null) {
        ret.add(cartBeveragesId.set(model.cartBeveragesId));
      }
      if (model.cartItemId != null) {
        ret.add(cartItemId.set(model.cartItemId));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(id.name, primary: true, isNullable: false);
    st.addInt(amount.name, isNullable: true);
    st.addStr(product.name, isNullable: true);
    st.addInt(quantity.name, isNullable: true);
    st.addInt(cartBeveragesId.name,
        foreignTable: cartBean.tableName,
        foreignCol: 'beverages_id',
        isNullable: true);
    st.addInt(cartItemId.name,
        foreignTable: cartBean.tableName,
        foreignCol: 'item_id',
        isNullable: true);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(CartItem model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<CartItem> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(CartItem model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<CartItem> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
    }
    final UpsertMany upsert = upserters.addAll(data);
    await adapter.upsertMany(upsert);
    return;
  }

  Future<int> update(CartItem model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<CartItem> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      where.add(this.id.eq(model.id));
    }
    final UpdateMany update = updaters.addAll(data, where);
    await adapter.updateMany(update);
    return;
  }

  Future<CartItem> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    return await findOne(find);
  }

  Future<int> remove(int id) async {
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<CartItem> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<List<CartItem>> findByCart(int cartBeveragesId, int cartItemId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder
        .where(this.cartBeveragesId.eq(cartBeveragesId))
        .where(this.cartItemId.eq(cartItemId));
    return findMany(find);
  }

  Future<List<CartItem>> findByCartList(List<Cart> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Cart model in models) {
      find.or(this.cartBeveragesId.eq(model.beverages_id) &
          this.cartItemId.eq(model.item_id));
    }
    return findMany(find);
  }

  Future<int> removeByCart(int cartBeveragesId, int cartItemId) async {
    final Remove rm = remover
        .where(this.cartBeveragesId.eq(cartBeveragesId))
        .where(this.cartItemId.eq(cartItemId));
    return await adapter.remove(rm);
  }

  void associateCart(CartItem child, Cart parent) {
    child.cartBeveragesId = parent.beverages_id;
    child.cartItemId = parent.item_id;
  }

  CartBean get cartBean;
}
