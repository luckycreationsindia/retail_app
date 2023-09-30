// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetOrderCollection on Isar {
  IsarCollection<String, Order> get orders => this.collection();
}

const OrderSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'orders',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'id',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'name',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'orderNo',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'items',
        type: IsarType.objectList,
        target: 'order_items',
      ),
      IsarPropertySchema(
        name: 'qty',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'gross',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'discount',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'tax',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'net',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'netRound',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'paymentType',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'paymentStatus',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'status',
        type: IsarType.bool,
      ),
      IsarPropertySchema(
        name: 'createdAt',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'updatedAt',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'isarId',
        type: IsarType.long,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<String, Order>(
    serialize: serializeOrder,
    deserialize: deserializeOrder,
    deserializeProperty: deserializeOrderProp,
  ),
  embeddedSchemas: [OrderItemsSchema],
);

@isarProtected
int serializeOrder(IsarWriter writer, Order object) {
  IsarCore.writeString(writer, 1, object.id);
  IsarCore.writeString(writer, 2, object.name);
  IsarCore.writeLong(writer, 3, object.orderNo);
  {
    final list = object.items;
    final listWriter = IsarCore.beginList(writer, 4, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeOrderItems(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  IsarCore.writeLong(writer, 5, object.qty);
  IsarCore.writeDouble(writer, 6, object.gross);
  IsarCore.writeDouble(writer, 7, object.discount);
  IsarCore.writeDouble(writer, 8, object.tax);
  IsarCore.writeDouble(writer, 9, object.net);
  IsarCore.writeDouble(writer, 10, object.netRound);
  IsarCore.writeLong(writer, 11, object.paymentType);
  IsarCore.writeLong(writer, 12, object.paymentStatus);
  IsarCore.writeBool(writer, 13, object.status);
  IsarCore.writeLong(writer, 14,
      object.createdAt?.toUtc().microsecondsSinceEpoch ?? -9223372036854775808);
  IsarCore.writeLong(writer, 15,
      object.updatedAt?.toUtc().microsecondsSinceEpoch ?? -9223372036854775808);
  IsarCore.writeLong(writer, 16, object.isarId);
  return Isar.fastHash(object.id);
}

@isarProtected
Order deserializeOrder(IsarReader reader) {
  final String _id;
  _id = IsarCore.readString(reader, 1) ?? '';
  final String _name;
  _name = IsarCore.readString(reader, 2) ?? '';
  final int _orderNo;
  _orderNo = IsarCore.readLong(reader, 3);
  final List<OrderItems> _items;
  {
    final length = IsarCore.readList(reader, 4, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _items = const <OrderItems>[];
      } else {
        final list = List<OrderItems>.filled(
            length,
            OrderItems(
              id: '',
              product: '',
              qty: -9223372036854775808,
              price: double.nan,
              gross: double.nan,
              net: double.nan,
              netRound: double.nan,
            ),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = OrderItems(
                id: '',
                product: '',
                qty: -9223372036854775808,
                price: double.nan,
                gross: double.nan,
                net: double.nan,
                netRound: double.nan,
              );
            } else {
              final embedded = deserializeOrderItems(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        _items = list;
      }
    }
  }
  final int _qty;
  _qty = IsarCore.readLong(reader, 5);
  final double _gross;
  _gross = IsarCore.readDouble(reader, 6);
  final double _discount;
  {
    final value = IsarCore.readDouble(reader, 7);
    if (value.isNaN) {
      _discount = 0;
    } else {
      _discount = value;
    }
  }
  final double _tax;
  {
    final value = IsarCore.readDouble(reader, 8);
    if (value.isNaN) {
      _tax = 0;
    } else {
      _tax = value;
    }
  }
  final double _net;
  _net = IsarCore.readDouble(reader, 9);
  final double _netRound;
  _netRound = IsarCore.readDouble(reader, 10);
  final int _paymentType;
  {
    final value = IsarCore.readLong(reader, 11);
    if (value == -9223372036854775808) {
      _paymentType = 0;
    } else {
      _paymentType = value;
    }
  }
  final int _paymentStatus;
  {
    final value = IsarCore.readLong(reader, 12);
    if (value == -9223372036854775808) {
      _paymentStatus = 0;
    } else {
      _paymentStatus = value;
    }
  }
  final bool _status;
  {
    if (IsarCore.readNull(reader, 13)) {
      _status = true;
    } else {
      _status = IsarCore.readBool(reader, 13);
    }
  }
  final DateTime? _createdAt;
  {
    final value = IsarCore.readLong(reader, 14);
    if (value == -9223372036854775808) {
      _createdAt = null;
    } else {
      _createdAt =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final DateTime? _updatedAt;
  {
    final value = IsarCore.readLong(reader, 15);
    if (value == -9223372036854775808) {
      _updatedAt = null;
    } else {
      _updatedAt =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final object = Order(
    id: _id,
    name: _name,
    orderNo: _orderNo,
    items: _items,
    qty: _qty,
    gross: _gross,
    discount: _discount,
    tax: _tax,
    net: _net,
    netRound: _netRound,
    paymentType: _paymentType,
    paymentStatus: _paymentStatus,
    status: _status,
    createdAt: _createdAt,
    updatedAt: _updatedAt,
  );
  return object;
}

@isarProtected
dynamic deserializeOrderProp(IsarReader reader, int property) {
  switch (property) {
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    case 3:
      return IsarCore.readLong(reader, 3);
    case 4:
      {
        final length = IsarCore.readList(reader, 4, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <OrderItems>[];
          } else {
            final list = List<OrderItems>.filled(
                length,
                OrderItems(
                  id: '',
                  product: '',
                  qty: -9223372036854775808,
                  price: double.nan,
                  gross: double.nan,
                  net: double.nan,
                  netRound: double.nan,
                ),
                growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = OrderItems(
                    id: '',
                    product: '',
                    qty: -9223372036854775808,
                    price: double.nan,
                    gross: double.nan,
                    net: double.nan,
                    netRound: double.nan,
                  );
                } else {
                  final embedded = deserializeOrderItems(objectReader);
                  IsarCore.freeReader(objectReader);
                  list[i] = embedded;
                }
              }
            }
            IsarCore.freeReader(reader);
            return list;
          }
        }
      }
    case 5:
      return IsarCore.readLong(reader, 5);
    case 6:
      return IsarCore.readDouble(reader, 6);
    case 7:
      {
        final value = IsarCore.readDouble(reader, 7);
        if (value.isNaN) {
          return 0;
        } else {
          return value;
        }
      }
    case 8:
      {
        final value = IsarCore.readDouble(reader, 8);
        if (value.isNaN) {
          return 0;
        } else {
          return value;
        }
      }
    case 9:
      return IsarCore.readDouble(reader, 9);
    case 10:
      return IsarCore.readDouble(reader, 10);
    case 11:
      {
        final value = IsarCore.readLong(reader, 11);
        if (value == -9223372036854775808) {
          return 0;
        } else {
          return value;
        }
      }
    case 12:
      {
        final value = IsarCore.readLong(reader, 12);
        if (value == -9223372036854775808) {
          return 0;
        } else {
          return value;
        }
      }
    case 13:
      {
        if (IsarCore.readNull(reader, 13)) {
          return true;
        } else {
          return IsarCore.readBool(reader, 13);
        }
      }
    case 14:
      {
        final value = IsarCore.readLong(reader, 14);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    case 15:
      {
        final value = IsarCore.readLong(reader, 15);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    case 16:
      return IsarCore.readLong(reader, 16);
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _OrderUpdate {
  bool call({
    required String id,
    String? name,
    int? orderNo,
    int? qty,
    double? gross,
    double? discount,
    double? tax,
    double? net,
    double? netRound,
    int? paymentType,
    int? paymentStatus,
    bool? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? isarId,
  });
}

class _OrderUpdateImpl implements _OrderUpdate {
  const _OrderUpdateImpl(this.collection);

  final IsarCollection<String, Order> collection;

  @override
  bool call({
    required String id,
    Object? name = ignore,
    Object? orderNo = ignore,
    Object? qty = ignore,
    Object? gross = ignore,
    Object? discount = ignore,
    Object? tax = ignore,
    Object? net = ignore,
    Object? netRound = ignore,
    Object? paymentType = ignore,
    Object? paymentStatus = ignore,
    Object? status = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
    Object? isarId = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (name != ignore) 2: name as String?,
          if (orderNo != ignore) 3: orderNo as int?,
          if (qty != ignore) 5: qty as int?,
          if (gross != ignore) 6: gross as double?,
          if (discount != ignore) 7: discount as double?,
          if (tax != ignore) 8: tax as double?,
          if (net != ignore) 9: net as double?,
          if (netRound != ignore) 10: netRound as double?,
          if (paymentType != ignore) 11: paymentType as int?,
          if (paymentStatus != ignore) 12: paymentStatus as int?,
          if (status != ignore) 13: status as bool?,
          if (createdAt != ignore) 14: createdAt as DateTime?,
          if (updatedAt != ignore) 15: updatedAt as DateTime?,
          if (isarId != ignore) 16: isarId as int?,
        }) >
        0;
  }
}

sealed class _OrderUpdateAll {
  int call({
    required List<String> id,
    String? name,
    int? orderNo,
    int? qty,
    double? gross,
    double? discount,
    double? tax,
    double? net,
    double? netRound,
    int? paymentType,
    int? paymentStatus,
    bool? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? isarId,
  });
}

class _OrderUpdateAllImpl implements _OrderUpdateAll {
  const _OrderUpdateAllImpl(this.collection);

  final IsarCollection<String, Order> collection;

  @override
  int call({
    required List<String> id,
    Object? name = ignore,
    Object? orderNo = ignore,
    Object? qty = ignore,
    Object? gross = ignore,
    Object? discount = ignore,
    Object? tax = ignore,
    Object? net = ignore,
    Object? netRound = ignore,
    Object? paymentType = ignore,
    Object? paymentStatus = ignore,
    Object? status = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
    Object? isarId = ignore,
  }) {
    return collection.updateProperties(id, {
      if (name != ignore) 2: name as String?,
      if (orderNo != ignore) 3: orderNo as int?,
      if (qty != ignore) 5: qty as int?,
      if (gross != ignore) 6: gross as double?,
      if (discount != ignore) 7: discount as double?,
      if (tax != ignore) 8: tax as double?,
      if (net != ignore) 9: net as double?,
      if (netRound != ignore) 10: netRound as double?,
      if (paymentType != ignore) 11: paymentType as int?,
      if (paymentStatus != ignore) 12: paymentStatus as int?,
      if (status != ignore) 13: status as bool?,
      if (createdAt != ignore) 14: createdAt as DateTime?,
      if (updatedAt != ignore) 15: updatedAt as DateTime?,
      if (isarId != ignore) 16: isarId as int?,
    });
  }
}

extension OrderUpdate on IsarCollection<String, Order> {
  _OrderUpdate get update => _OrderUpdateImpl(this);

  _OrderUpdateAll get updateAll => _OrderUpdateAllImpl(this);
}

sealed class _OrderQueryUpdate {
  int call({
    String? name,
    int? orderNo,
    int? qty,
    double? gross,
    double? discount,
    double? tax,
    double? net,
    double? netRound,
    int? paymentType,
    int? paymentStatus,
    bool? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? isarId,
  });
}

class _OrderQueryUpdateImpl implements _OrderQueryUpdate {
  const _OrderQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<Order> query;
  final int? limit;

  @override
  int call({
    Object? name = ignore,
    Object? orderNo = ignore,
    Object? qty = ignore,
    Object? gross = ignore,
    Object? discount = ignore,
    Object? tax = ignore,
    Object? net = ignore,
    Object? netRound = ignore,
    Object? paymentType = ignore,
    Object? paymentStatus = ignore,
    Object? status = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
    Object? isarId = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (name != ignore) 2: name as String?,
      if (orderNo != ignore) 3: orderNo as int?,
      if (qty != ignore) 5: qty as int?,
      if (gross != ignore) 6: gross as double?,
      if (discount != ignore) 7: discount as double?,
      if (tax != ignore) 8: tax as double?,
      if (net != ignore) 9: net as double?,
      if (netRound != ignore) 10: netRound as double?,
      if (paymentType != ignore) 11: paymentType as int?,
      if (paymentStatus != ignore) 12: paymentStatus as int?,
      if (status != ignore) 13: status as bool?,
      if (createdAt != ignore) 14: createdAt as DateTime?,
      if (updatedAt != ignore) 15: updatedAt as DateTime?,
      if (isarId != ignore) 16: isarId as int?,
    });
  }
}

extension OrderQueryUpdate on IsarQuery<Order> {
  _OrderQueryUpdate get updateFirst => _OrderQueryUpdateImpl(this, limit: 1);

  _OrderQueryUpdate get updateAll => _OrderQueryUpdateImpl(this);
}

class _OrderQueryBuilderUpdateImpl implements _OrderQueryUpdate {
  const _OrderQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<Order, Order, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? name = ignore,
    Object? orderNo = ignore,
    Object? qty = ignore,
    Object? gross = ignore,
    Object? discount = ignore,
    Object? tax = ignore,
    Object? net = ignore,
    Object? netRound = ignore,
    Object? paymentType = ignore,
    Object? paymentStatus = ignore,
    Object? status = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
    Object? isarId = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (name != ignore) 2: name as String?,
        if (orderNo != ignore) 3: orderNo as int?,
        if (qty != ignore) 5: qty as int?,
        if (gross != ignore) 6: gross as double?,
        if (discount != ignore) 7: discount as double?,
        if (tax != ignore) 8: tax as double?,
        if (net != ignore) 9: net as double?,
        if (netRound != ignore) 10: netRound as double?,
        if (paymentType != ignore) 11: paymentType as int?,
        if (paymentStatus != ignore) 12: paymentStatus as int?,
        if (status != ignore) 13: status as bool?,
        if (createdAt != ignore) 14: createdAt as DateTime?,
        if (updatedAt != ignore) 15: updatedAt as DateTime?,
        if (isarId != ignore) 16: isarId as int?,
      });
    } finally {
      q.close();
    }
  }
}

extension OrderQueryBuilderUpdate on QueryBuilder<Order, Order, QOperations> {
  _OrderQueryUpdate get updateFirst =>
      _OrderQueryBuilderUpdateImpl(this, limit: 1);

  _OrderQueryUpdate get updateAll => _OrderQueryBuilderUpdateImpl(this);
}

extension OrderQueryFilter on QueryBuilder<Order, Order, QFilterCondition> {
  QueryBuilder<Order, Order, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> idGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> idLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> idLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> idMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> nameGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> nameLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> orderNoEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> orderNoGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> orderNoGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> orderNoLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> orderNoLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> orderNoBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> itemsIsEmpty() {
    return not().itemsIsNotEmpty();
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> itemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 4, value: null),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> qtyEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> qtyGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> qtyGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> qtyLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> qtyLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> qtyBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> grossEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> grossGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> grossGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> grossLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> grossLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> grossBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower,
          upper: upper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> discountEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 7,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> discountGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 7,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition>
      discountGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 7,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> discountLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 7,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> discountLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 7,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> discountBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 7,
          lower: lower,
          upper: upper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> taxEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 8,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> taxGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 8,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> taxGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 8,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> taxLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 8,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> taxLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 8,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> taxBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 8,
          lower: lower,
          upper: upper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> netEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 9,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> netGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 9,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> netGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 9,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> netLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 9,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> netLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 9,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> netBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 9,
          lower: lower,
          upper: upper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> netRoundEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 10,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> netRoundGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 10,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition>
      netRoundGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 10,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> netRoundLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 10,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> netRoundLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 10,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> netRoundBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 10,
          lower: lower,
          upper: upper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> paymentTypeEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 11,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> paymentTypeGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 11,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition>
      paymentTypeGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 11,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> paymentTypeLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 11,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition>
      paymentTypeLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 11,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> paymentTypeBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 11,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> paymentStatusEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 12,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> paymentStatusGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 12,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition>
      paymentStatusGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 12,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> paymentStatusLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 12,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition>
      paymentStatusLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 12,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> paymentStatusBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 12,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> statusEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 13,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 14));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> createdAtIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 14));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> createdAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 14,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> createdAtGreaterThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 14,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition>
      createdAtGreaterThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 14,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> createdAtLessThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 14,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> createdAtLessThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 14,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> createdAtBetween(
    DateTime? lower,
    DateTime? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 14,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 15));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 15));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> updatedAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 15,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> updatedAtGreaterThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 15,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition>
      updatedAtGreaterThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 15,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> updatedAtLessThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 15,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> updatedAtLessThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 15,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> updatedAtBetween(
    DateTime? lower,
    DateTime? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 15,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> isarIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 16,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> isarIdGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 16,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> isarIdGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 16,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> isarIdLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 16,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> isarIdLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 16,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> isarIdBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 16,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension OrderQueryObject on QueryBuilder<Order, Order, QFilterCondition> {}

extension OrderQuerySortBy on QueryBuilder<Order, Order, QSortBy> {
  QueryBuilder<Order, Order, QAfterSortBy> sortById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByOrderNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByOrderNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByGross() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByGrossDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByTaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByNet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByNetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByNetRound() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByNetRoundDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByPaymentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(11);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByPaymentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(11, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByPaymentStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(12);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByPaymentStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(12, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(13);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(13, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(14);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(14, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(15);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(15, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(16);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(16, sort: Sort.desc);
    });
  }
}

extension OrderQuerySortThenBy on QueryBuilder<Order, Order, QSortThenBy> {
  QueryBuilder<Order, Order, QAfterSortBy> thenById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByOrderNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByOrderNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByGross() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByGrossDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByTaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByNet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByNetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByNetRound() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByNetRoundDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByPaymentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(11);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByPaymentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(11, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByPaymentStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(12);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByPaymentStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(12, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(13);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(13, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(14);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(14, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(15);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(15, sort: Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(16);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(16, sort: Sort.desc);
    });
  }
}

extension OrderQueryWhereDistinct on QueryBuilder<Order, Order, QDistinct> {
  QueryBuilder<Order, Order, QAfterDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Order, Order, QAfterDistinct> distinctByOrderNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<Order, Order, QAfterDistinct> distinctByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5);
    });
  }

  QueryBuilder<Order, Order, QAfterDistinct> distinctByGross() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6);
    });
  }

  QueryBuilder<Order, Order, QAfterDistinct> distinctByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(7);
    });
  }

  QueryBuilder<Order, Order, QAfterDistinct> distinctByTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(8);
    });
  }

  QueryBuilder<Order, Order, QAfterDistinct> distinctByNet() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(9);
    });
  }

  QueryBuilder<Order, Order, QAfterDistinct> distinctByNetRound() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(10);
    });
  }

  QueryBuilder<Order, Order, QAfterDistinct> distinctByPaymentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(11);
    });
  }

  QueryBuilder<Order, Order, QAfterDistinct> distinctByPaymentStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(12);
    });
  }

  QueryBuilder<Order, Order, QAfterDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(13);
    });
  }

  QueryBuilder<Order, Order, QAfterDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(14);
    });
  }

  QueryBuilder<Order, Order, QAfterDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(15);
    });
  }

  QueryBuilder<Order, Order, QAfterDistinct> distinctByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(16);
    });
  }
}

extension OrderQueryProperty1 on QueryBuilder<Order, Order, QProperty> {
  QueryBuilder<Order, String, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Order, String, QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Order, int, QAfterProperty> orderNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Order, List<OrderItems>, QAfterProperty> itemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Order, int, QAfterProperty> qtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Order, double, QAfterProperty> grossProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<Order, double, QAfterProperty> discountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<Order, double, QAfterProperty> taxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<Order, double, QAfterProperty> netProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<Order, double, QAfterProperty> netRoundProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<Order, int, QAfterProperty> paymentTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }

  QueryBuilder<Order, int, QAfterProperty> paymentStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(12);
    });
  }

  QueryBuilder<Order, bool, QAfterProperty> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(13);
    });
  }

  QueryBuilder<Order, DateTime?, QAfterProperty> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(14);
    });
  }

  QueryBuilder<Order, DateTime?, QAfterProperty> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(15);
    });
  }

  QueryBuilder<Order, int, QAfterProperty> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(16);
    });
  }
}

extension OrderQueryProperty2<R> on QueryBuilder<Order, R, QAfterProperty> {
  QueryBuilder<Order, (R, String), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Order, (R, String), QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Order, (R, int), QAfterProperty> orderNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Order, (R, List<OrderItems>), QAfterProperty> itemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Order, (R, int), QAfterProperty> qtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Order, (R, double), QAfterProperty> grossProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<Order, (R, double), QAfterProperty> discountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<Order, (R, double), QAfterProperty> taxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<Order, (R, double), QAfterProperty> netProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<Order, (R, double), QAfterProperty> netRoundProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<Order, (R, int), QAfterProperty> paymentTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }

  QueryBuilder<Order, (R, int), QAfterProperty> paymentStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(12);
    });
  }

  QueryBuilder<Order, (R, bool), QAfterProperty> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(13);
    });
  }

  QueryBuilder<Order, (R, DateTime?), QAfterProperty> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(14);
    });
  }

  QueryBuilder<Order, (R, DateTime?), QAfterProperty> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(15);
    });
  }

  QueryBuilder<Order, (R, int), QAfterProperty> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(16);
    });
  }
}

extension OrderQueryProperty3<R1, R2>
    on QueryBuilder<Order, (R1, R2), QAfterProperty> {
  QueryBuilder<Order, (R1, R2, String), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Order, (R1, R2, String), QOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Order, (R1, R2, int), QOperations> orderNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Order, (R1, R2, List<OrderItems>), QOperations> itemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Order, (R1, R2, int), QOperations> qtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Order, (R1, R2, double), QOperations> grossProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<Order, (R1, R2, double), QOperations> discountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<Order, (R1, R2, double), QOperations> taxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<Order, (R1, R2, double), QOperations> netProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<Order, (R1, R2, double), QOperations> netRoundProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<Order, (R1, R2, int), QOperations> paymentTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }

  QueryBuilder<Order, (R1, R2, int), QOperations> paymentStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(12);
    });
  }

  QueryBuilder<Order, (R1, R2, bool), QOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(13);
    });
  }

  QueryBuilder<Order, (R1, R2, DateTime?), QOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(14);
    });
  }

  QueryBuilder<Order, (R1, R2, DateTime?), QOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(15);
    });
  }

  QueryBuilder<Order, (R1, R2, int), QOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(16);
    });
  }
}

// **************************************************************************
// _IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const OrderItemsSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'order_items',
    embedded: true,
    properties: [
      IsarPropertySchema(
        name: 'id',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'product',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'qty',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'price',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'gross',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'tax',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'discount',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'net',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'netRound',
        type: IsarType.double,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, OrderItems>(
    serialize: serializeOrderItems,
    deserialize: deserializeOrderItems,
  ),
);

@isarProtected
int serializeOrderItems(IsarWriter writer, OrderItems object) {
  IsarCore.writeString(writer, 1, object.id);
  IsarCore.writeString(writer, 2, object.product);
  IsarCore.writeLong(writer, 3, object.qty);
  IsarCore.writeDouble(writer, 4, object.price);
  IsarCore.writeDouble(writer, 5, object.gross);
  IsarCore.writeDouble(writer, 6, object.tax);
  IsarCore.writeDouble(writer, 7, object.discount);
  IsarCore.writeDouble(writer, 8, object.net);
  IsarCore.writeDouble(writer, 9, object.netRound);
  return 0;
}

@isarProtected
OrderItems deserializeOrderItems(IsarReader reader) {
  final String _id;
  _id = IsarCore.readString(reader, 1) ?? '';
  final String _product;
  _product = IsarCore.readString(reader, 2) ?? '';
  final int _qty;
  _qty = IsarCore.readLong(reader, 3);
  final double _price;
  _price = IsarCore.readDouble(reader, 4);
  final double _gross;
  _gross = IsarCore.readDouble(reader, 5);
  final double _tax;
  {
    final value = IsarCore.readDouble(reader, 6);
    if (value.isNaN) {
      _tax = 0;
    } else {
      _tax = value;
    }
  }
  final double _discount;
  {
    final value = IsarCore.readDouble(reader, 7);
    if (value.isNaN) {
      _discount = 0;
    } else {
      _discount = value;
    }
  }
  final double _net;
  _net = IsarCore.readDouble(reader, 8);
  final double _netRound;
  _netRound = IsarCore.readDouble(reader, 9);
  final object = OrderItems(
    id: _id,
    product: _product,
    qty: _qty,
    price: _price,
    gross: _gross,
    tax: _tax,
    discount: _discount,
    net: _net,
    netRound: _netRound,
  );
  return object;
}

extension OrderItemsQueryFilter
    on QueryBuilder<OrderItems, OrderItems, QFilterCondition> {
  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> idLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      idLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> productEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      productGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      productGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> productLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      productLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> productBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> productStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> productEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> productContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> productMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> productIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      productIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> qtyEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> qtyGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      qtyGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> qtyLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      qtyLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> qtyBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> priceEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> priceGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      priceGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> priceLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      priceLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> priceBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> grossEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> grossGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      grossGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> grossLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      grossLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> grossBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> taxEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> taxGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      taxGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> taxLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      taxLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> taxBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower,
          upper: upper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> discountEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 7,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      discountGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 7,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      discountGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 7,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> discountLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 7,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      discountLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 7,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> discountBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 7,
          lower: lower,
          upper: upper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> netEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 8,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> netGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 8,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      netGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 8,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> netLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 8,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      netLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 8,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> netBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 8,
          lower: lower,
          upper: upper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> netRoundEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 9,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      netRoundGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 9,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      netRoundGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 9,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> netRoundLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 9,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition>
      netRoundLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 9,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OrderItems, OrderItems, QAfterFilterCondition> netRoundBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 9,
          lower: lower,
          upper: upper,
          epsilon: epsilon,
        ),
      );
    });
  }
}

extension OrderItemsQueryObject
    on QueryBuilder<OrderItems, OrderItems, QFilterCondition> {}
