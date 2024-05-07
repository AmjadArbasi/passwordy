// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_activities_db_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLogActivitiesDbDtoCollection on Isar {
  IsarCollection<LogActivitiesDbDto> get logActivitiesDbDtos =>
      this.collection();
}

const LogActivitiesDbDtoSchema = CollectionSchema(
  name: r'LogActivitiesDbDto',
  id: -8315986051855367965,
  properties: {
    r'linker': PropertySchema(
      id: 0,
      name: r'linker',
      type: IsarType.string,
    )
  },
  estimateSize: _logActivitiesDbDtoEstimateSize,
  serialize: _logActivitiesDbDtoSerialize,
  deserialize: _logActivitiesDbDtoDeserialize,
  deserializeProp: _logActivitiesDbDtoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'logActivities': LinkSchema(
      id: 323679620470816253,
      name: r'logActivities',
      target: r'LogActivityDbDto',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _logActivitiesDbDtoGetId,
  getLinks: _logActivitiesDbDtoGetLinks,
  attach: _logActivitiesDbDtoAttach,
  version: '3.1.0+1',
);

int _logActivitiesDbDtoEstimateSize(
  LogActivitiesDbDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.linker;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _logActivitiesDbDtoSerialize(
  LogActivitiesDbDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.linker);
}

LogActivitiesDbDto _logActivitiesDbDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LogActivitiesDbDto();
  object.id = id;
  object.linker = reader.readStringOrNull(offsets[0]);
  return object;
}

P _logActivitiesDbDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _logActivitiesDbDtoGetId(LogActivitiesDbDto object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _logActivitiesDbDtoGetLinks(
    LogActivitiesDbDto object) {
  return [object.logActivities];
}

void _logActivitiesDbDtoAttach(
    IsarCollection<dynamic> col, Id id, LogActivitiesDbDto object) {
  object.id = id;
  object.logActivities.attach(
      col, col.isar.collection<LogActivityDbDto>(), r'logActivities', id);
}

extension LogActivitiesDbDtoQueryWhereSort
    on QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QWhere> {
  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LogActivitiesDbDtoQueryWhere
    on QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QWhereClause> {
  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterWhereClause>
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

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterWhereClause>
      idBetween(
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

extension LogActivitiesDbDtoQueryFilter
    on QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QFilterCondition> {
  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
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

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      idLessThan(
    Id value, {
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

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      linkerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'linker',
      ));
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      linkerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'linker',
      ));
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      linkerEqualTo(
    String? value, {
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

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      linkerGreaterThan(
    String? value, {
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

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      linkerLessThan(
    String? value, {
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

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      linkerBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
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

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
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

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      linkerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      linkerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linker',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      linkerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linker',
        value: '',
      ));
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      linkerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linker',
        value: '',
      ));
    });
  }
}

extension LogActivitiesDbDtoQueryObject
    on QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QFilterCondition> {}

extension LogActivitiesDbDtoQueryLinks
    on QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QFilterCondition> {
  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      logActivities(FilterQuery<LogActivityDbDto> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'logActivities');
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      logActivitiesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'logActivities', length, true, length, true);
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      logActivitiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'logActivities', 0, true, 0, true);
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      logActivitiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'logActivities', 0, false, 999999, true);
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      logActivitiesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'logActivities', 0, true, length, include);
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      logActivitiesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'logActivities', length, include, 999999, true);
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      logActivitiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'logActivities', lower, includeLower, upper, includeUpper);
    });
  }
}

extension LogActivitiesDbDtoQuerySortBy
    on QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QSortBy> {
  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterSortBy>
      sortByLinker() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linker', Sort.asc);
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterSortBy>
      sortByLinkerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linker', Sort.desc);
    });
  }
}

extension LogActivitiesDbDtoQuerySortThenBy
    on QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QSortThenBy> {
  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterSortBy>
      thenByLinker() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linker', Sort.asc);
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterSortBy>
      thenByLinkerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linker', Sort.desc);
    });
  }
}

extension LogActivitiesDbDtoQueryWhereDistinct
    on QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QDistinct> {
  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QDistinct>
      distinctByLinker({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linker', caseSensitive: caseSensitive);
    });
  }
}

extension LogActivitiesDbDtoQueryProperty
    on QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QQueryProperty> {
  QueryBuilder<LogActivitiesDbDto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LogActivitiesDbDto, String?, QQueryOperations> linkerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linker');
    });
  }
}
