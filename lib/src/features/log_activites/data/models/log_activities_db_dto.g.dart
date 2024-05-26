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
  properties: {},
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
    ),
    r'user': LinkSchema(
      id: 263790393147810667,
      name: r'user',
      target: r'UserLocalDto',
      single: true,
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
  return bytesCount;
}

void _logActivitiesDbDtoSerialize(
  LogActivitiesDbDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {}
LogActivitiesDbDto _logActivitiesDbDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LogActivitiesDbDto();
  object.id = id;
  return object;
}

P _logActivitiesDbDtoDeserializeProp<P>(
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

Id _logActivitiesDbDtoGetId(LogActivitiesDbDto object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _logActivitiesDbDtoGetLinks(
    LogActivitiesDbDto object) {
  return [object.logActivities, object.user];
}

void _logActivitiesDbDtoAttach(
    IsarCollection<dynamic> col, Id id, LogActivitiesDbDto object) {
  object.id = id;
  object.logActivities.attach(
      col, col.isar.collection<LogActivityDbDto>(), r'logActivities', id);
  object.user.attach(col, col.isar.collection<UserLocalDto>(), r'user', id);
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

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      user(FilterQuery<UserLocalDto> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'user');
    });
  }

  QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QAfterFilterCondition>
      userIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', 0, true, 0, true);
    });
  }
}

extension LogActivitiesDbDtoQuerySortBy
    on QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QSortBy> {}

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
}

extension LogActivitiesDbDtoQueryWhereDistinct
    on QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QDistinct> {}

extension LogActivitiesDbDtoQueryProperty
    on QueryBuilder<LogActivitiesDbDto, LogActivitiesDbDto, QQueryProperty> {
  QueryBuilder<LogActivitiesDbDto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
