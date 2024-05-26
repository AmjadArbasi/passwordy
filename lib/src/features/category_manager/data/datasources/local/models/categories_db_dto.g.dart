// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_db_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCategoriesDbDtoCollection on Isar {
  IsarCollection<CategoriesDbDto> get categoriesDbDtos => this.collection();
}

const CategoriesDbDtoSchema = CollectionSchema(
  name: r'CategoriesDbDto',
  id: 3841949422973842718,
  properties: {},
  estimateSize: _categoriesDbDtoEstimateSize,
  serialize: _categoriesDbDtoSerialize,
  deserialize: _categoriesDbDtoDeserialize,
  deserializeProp: _categoriesDbDtoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'categories': LinkSchema(
      id: -7920971862278343551,
      name: r'categories',
      target: r'CategoryDbDto',
      single: false,
    ),
    r'user': LinkSchema(
      id: -8564506958194280524,
      name: r'user',
      target: r'UserLocalDto',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _categoriesDbDtoGetId,
  getLinks: _categoriesDbDtoGetLinks,
  attach: _categoriesDbDtoAttach,
  version: '3.1.0+1',
);

int _categoriesDbDtoEstimateSize(
  CategoriesDbDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _categoriesDbDtoSerialize(
  CategoriesDbDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {}
CategoriesDbDto _categoriesDbDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CategoriesDbDto();
  object.id = id;
  return object;
}

P _categoriesDbDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _categoriesDbDtoGetId(CategoriesDbDto object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _categoriesDbDtoGetLinks(CategoriesDbDto object) {
  return [object.categories, object.user];
}

void _categoriesDbDtoAttach(
    IsarCollection<dynamic> col, Id id, CategoriesDbDto object) {
  object.id = id;
  object.categories
      .attach(col, col.isar.collection<CategoryDbDto>(), r'categories', id);
  object.user.attach(col, col.isar.collection<UserLocalDto>(), r'user', id);
}

extension CategoriesDbDtoQueryWhereSort
    on QueryBuilder<CategoriesDbDto, CategoriesDbDto, QWhere> {
  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CategoriesDbDtoQueryWhere
    on QueryBuilder<CategoriesDbDto, CategoriesDbDto, QWhereClause> {
  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CategoriesDbDtoQueryFilter
    on QueryBuilder<CategoriesDbDto, CategoriesDbDto, QFilterCondition> {
  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CategoriesDbDtoQueryObject
    on QueryBuilder<CategoriesDbDto, CategoriesDbDto, QFilterCondition> {}

extension CategoriesDbDtoQueryLinks
    on QueryBuilder<CategoriesDbDto, CategoriesDbDto, QFilterCondition> {
  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      categories(FilterQuery<CategoryDbDto> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'categories');
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      categoriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'categories', length, true, length, true);
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      categoriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'categories', 0, true, 0, true);
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      categoriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'categories', 0, false, 999999, true);
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      categoriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'categories', 0, true, length, include);
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      categoriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'categories', length, include, 999999, true);
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      categoriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'categories', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition> user(
      FilterQuery<UserLocalDto> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'user');
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      userIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', 0, true, 0, true);
    });
  }
}

extension CategoriesDbDtoQuerySortBy
    on QueryBuilder<CategoriesDbDto, CategoriesDbDto, QSortBy> {}

extension CategoriesDbDtoQuerySortThenBy
    on QueryBuilder<CategoriesDbDto, CategoriesDbDto, QSortThenBy> {
  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension CategoriesDbDtoQueryWhereDistinct
    on QueryBuilder<CategoriesDbDto, CategoriesDbDto, QDistinct> {}

extension CategoriesDbDtoQueryProperty
    on QueryBuilder<CategoriesDbDto, CategoriesDbDto, QQueryProperty> {
  QueryBuilder<CategoriesDbDto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
