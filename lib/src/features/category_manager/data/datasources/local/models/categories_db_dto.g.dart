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
  properties: {
    r'linker': PropertySchema(
      id: 0,
      name: r'linker',
      type: IsarType.string,
    )
  },
  estimateSize: _categoriesDbDtoEstimateSize,
  serialize: _categoriesDbDtoSerialize,
  deserialize: _categoriesDbDtoDeserialize,
  deserializeProp: _categoriesDbDtoDeserializeProp,
  idName: r'id',
  indexes: {
    r'linker': IndexSchema(
      id: 6223059953983404649,
      name: r'linker',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'linker',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'categories': LinkSchema(
      id: -7920971862278343551,
      name: r'categories',
      target: r'CategoryDbDto',
      single: false,
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
  bytesCount += 3 + object.linker.length * 3;
  return bytesCount;
}

void _categoriesDbDtoSerialize(
  CategoriesDbDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.linker);
}

CategoriesDbDto _categoriesDbDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CategoriesDbDto(
    id: id,
    linker: reader.readString(offsets[0]),
  );
  return object;
}

P _categoriesDbDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _categoriesDbDtoGetId(CategoriesDbDto object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _categoriesDbDtoGetLinks(CategoriesDbDto object) {
  return [object.categories];
}

void _categoriesDbDtoAttach(
    IsarCollection<dynamic> col, Id id, CategoriesDbDto object) {
  object.id = id;
  object.categories
      .attach(col, col.isar.collection<CategoryDbDto>(), r'categories', id);
}

extension CategoriesDbDtoByIndex on IsarCollection<CategoriesDbDto> {
  Future<CategoriesDbDto?> getByLinker(String linker) {
    return getByIndex(r'linker', [linker]);
  }

  CategoriesDbDto? getByLinkerSync(String linker) {
    return getByIndexSync(r'linker', [linker]);
  }

  Future<bool> deleteByLinker(String linker) {
    return deleteByIndex(r'linker', [linker]);
  }

  bool deleteByLinkerSync(String linker) {
    return deleteByIndexSync(r'linker', [linker]);
  }

  Future<List<CategoriesDbDto?>> getAllByLinker(List<String> linkerValues) {
    final values = linkerValues.map((e) => [e]).toList();
    return getAllByIndex(r'linker', values);
  }

  List<CategoriesDbDto?> getAllByLinkerSync(List<String> linkerValues) {
    final values = linkerValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'linker', values);
  }

  Future<int> deleteAllByLinker(List<String> linkerValues) {
    final values = linkerValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'linker', values);
  }

  int deleteAllByLinkerSync(List<String> linkerValues) {
    final values = linkerValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'linker', values);
  }

  Future<Id> putByLinker(CategoriesDbDto object) {
    return putByIndex(r'linker', object);
  }

  Id putByLinkerSync(CategoriesDbDto object, {bool saveLinks = true}) {
    return putByIndexSync(r'linker', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLinker(List<CategoriesDbDto> objects) {
    return putAllByIndex(r'linker', objects);
  }

  List<Id> putAllByLinkerSync(List<CategoriesDbDto> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'linker', objects, saveLinks: saveLinks);
  }
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

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterWhereClause>
      linkerEqualTo(String linker) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'linker',
        value: [linker],
      ));
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterWhereClause>
      linkerNotEqualTo(String linker) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'linker',
              lower: [],
              upper: [linker],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'linker',
              lower: [linker],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'linker',
              lower: [linker],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'linker',
              lower: [],
              upper: [linker],
              includeUpper: false,
            ));
      }
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

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      linkerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      linkerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      linkerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      linkerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linker',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      linkerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'linker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      linkerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'linker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      linkerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      linkerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linker',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      linkerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linker',
        value: '',
      ));
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterFilterCondition>
      linkerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linker',
        value: '',
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
}

extension CategoriesDbDtoQuerySortBy
    on QueryBuilder<CategoriesDbDto, CategoriesDbDto, QSortBy> {
  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterSortBy> sortByLinker() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linker', Sort.asc);
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterSortBy>
      sortByLinkerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linker', Sort.desc);
    });
  }
}

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

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterSortBy> thenByLinker() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linker', Sort.asc);
    });
  }

  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QAfterSortBy>
      thenByLinkerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linker', Sort.desc);
    });
  }
}

extension CategoriesDbDtoQueryWhereDistinct
    on QueryBuilder<CategoriesDbDto, CategoriesDbDto, QDistinct> {
  QueryBuilder<CategoriesDbDto, CategoriesDbDto, QDistinct> distinctByLinker(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linker', caseSensitive: caseSensitive);
    });
  }
}

extension CategoriesDbDtoQueryProperty
    on QueryBuilder<CategoriesDbDto, CategoriesDbDto, QQueryProperty> {
  QueryBuilder<CategoriesDbDto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CategoriesDbDto, String, QQueryOperations> linkerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linker');
    });
  }
}
