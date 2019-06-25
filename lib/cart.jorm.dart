// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _CartBean implements Bean<Cart> {
  final id = IntField('id');
  final beverages_id = IntField('beverages_id');
  final item_id = IntField('item_id');
  final amount = IntField('amount');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        beverages_id.name: beverages_id,
        item_id.name: item_id,
        amount.name: amount,
      };
  Cart fromMap(Map map) {
    Cart model = Cart();
    model.id = adapter.parseValue(map['id']);
    model.beverages_id = adapter.parseValue(map['beverages_id']);
    model.item_id = adapter.parseValue(map['item_id']);
    model.amount = adapter.parseValue(map['amount']);

    return model;
  }

  List<SetColumn> toSetColumns(Cart model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(beverages_id.set(model.beverages_id));
      ret.add(item_id.set(model.item_id));
      ret.add(amount.set(model.amount));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(beverages_id.name))
        ret.add(beverages_id.set(model.beverages_id));
      if (only.contains(item_id.name)) ret.add(item_id.set(model.item_id));
      if (only.contains(amount.name)) ret.add(amount.set(model.amount));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.beverages_id != null) {
        ret.add(beverages_id.set(model.beverages_id));
      }
      if (model.item_id != null) {
        ret.add(item_id.set(model.item_id));
      }
      if (model.amount != null) {
        ret.add(amount.set(model.amount));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(id.name, primary: true, isNullable: false);
    st.addInt(beverages_id.name,
        isNullable: false, uniqueGroup: "beverages_id");
    st.addInt(item_id.name, isNullable: false, uniqueGroup: "item_id");
    st.addInt(amount.name, isNullable: true);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Cart model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert);
    if (cascade) {
      Cart newModel;
      if (model.beverages != null) {
        newModel ??= await find(model.id);
        model.beverages.forEach((x) => cartItemBean.associateCart(x, newModel));
        for (final child in model.beverages) {
          await cartItemBean.insert(child, cascade: cascade);
        }
      }
      if (model.item != null) {
        newModel ??= await find(model.id);
        cartItemBean.associateCart(model.item, newModel);
        await cartItemBean.insert(model.item, cascade: cascade);
      }
    }
    return retId;
  }

  Future<void> insertMany(List<Cart> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(insert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = models
          .map((model) =>
              toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
          .toList();
      final InsertMany insert = inserters.addAll(data);
      await adapter.insertMany(insert);
      return;
    }
  }

  Future<dynamic> upsert(Cart model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      Cart newModel;
      if (model.beverages != null) {
        newModel ??= await find(model.id);
        model.beverages.forEach((x) => cartItemBean.associateCart(x, newModel));
        for (final child in model.beverages) {
          await cartItemBean.upsert(child, cascade: cascade);
        }
      }
      if (model.item != null) {
        newModel ??= await find(model.id);
        cartItemBean.associateCart(model.item, newModel);
        await cartItemBean.upsert(model.item, cascade: cascade);
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<Cart> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(upsert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
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
  }

  Future<int> update(Cart model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      Cart newModel;
      if (model.beverages != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.beverages
              .forEach((x) => cartItemBean.associateCart(x, newModel));
        }
        for (final child in model.beverages) {
          await cartItemBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
      if (model.item != null) {
        if (associate) {
          newModel ??= await find(model.id);
          cartItemBean.associateCart(model.item, newModel);
        }
        await cartItemBean.update(model.item,
            cascade: cascade, associate: associate);
      }
    }
    return ret;
  }

  Future<void> updateMany(List<Cart> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(update(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
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
  }

  Future<Cart> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final Cart model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(int id, {bool cascade = false}) async {
    if (cascade) {
      final Cart newModel = await find(id);
      if (newModel != null) {
        await cartItemBean.removeByCart(
            newModel.beverages_id, newModel.item_id);
        await cartItemBean.removeByCart(
            newModel.beverages_id, newModel.item_id);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Cart> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<Cart> preload(Cart model, {bool cascade = false}) async {
    model.beverages = await cartItemBean.findByCart(
        model.beverages_id, model.item_id,
        preload: cascade, cascade: cascade);
    model.item = await cartItemBean.findByCart(
        model.beverages_id, model.item_id,
        preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<Cart>> preloadAll(List<Cart> models,
      {bool cascade = false}) async {
    models.forEach((Cart model) => model.beverages ??= []);
    await OneToXHelper.preloadAll<Cart, CartItem>(
        models,
        (Cart model) => [model.beverages_id, model.item_id],
        cartItemBean.findByCartList,
        (CartItem model) => [model.cartBeveragesId, model.cartItemId],
        (Cart model, CartItem child) =>
            model.beverages = List.from(model.beverages)..add(child),
        cascade: cascade);
    await OneToXHelper.preloadAll<Cart, CartItem>(
        models,
        (Cart model) => [model.beverages_id, model.item_id],
        cartItemBean.findByCartList,
        (CartItem model) => [model.cartBeveragesId, model.cartItemId],
        (Cart model, CartItem child) => model.item = child,
        cascade: cascade);
    return models;
  }

  CartItemBean get cartItemBean;
}
