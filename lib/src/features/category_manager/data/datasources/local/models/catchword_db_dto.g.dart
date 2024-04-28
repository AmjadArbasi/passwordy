// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catchword_db_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCatchwordDbDtoCollection on Isar {
  IsarCollection<CatchwordDbDto> get catchwordDbDtos => this.collection();
}

const CatchwordDbDtoSchema = CollectionSchema(
  name: r'CatchwordDbDto',
  id: -2481107596034860745,
  properties: {
    r'accountId': PropertySchema(
      id: 0,
      name: r'accountId',
      type: IsarType.string,
    ),
    r'dateTime': PropertySchema(
      id: 1,
      name: r'dateTime',
      type: IsarType.dateTime,
    ),
    r'isVisibile': PropertySchema(
      id: 2,
      name: r'isVisibile',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'passcode': PropertySchema(
      id: 4,
      name: r'passcode',
      type: IsarType.string,
    ),
    r'whenUsed': PropertySchema(
      id: 5,
      name: r'whenUsed',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _catchwordDbDtoEstimateSize,
  serialize: _catchwordDbDtoSerialize,
  deserialize: _catchwordDbDtoDeserialize,
  deserializeProp: _catchwordDbDtoDeserializeProp,
  idName: r'id',
  indexes: {
    r'dateTime': IndexSchema(
      id: -138851979697481250,
      name: r'dateTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'dateTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _catchwordDbDtoGetId,
  getLinks: _catchwordDbDtoGetLinks,
  attach: _catchwordDbDtoAttach,
  version: '3.1.0+1',
);

int _catchwordDbDtoEstimateSize(
  CatchwordDbDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.accountId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.passcode.length * 3;
  return bytesCount;
}

void _catchwordDbDtoSerialize(
  CatchwordDbDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accountId);
  writer.writeDateTime(offsets[1], object.dateTime);
  writer.writeBool(offsets[2], object.isVisibile);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.passcode);
  writer.writeDateTime(offsets[5], object.whenUsed);
}

CatchwordDbDto _catchwordDbDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CatchwordDbDto(
    accountId: reader.readString(offsets[0]),
    dateTime: reader.readDateTime(offsets[1]),
    id: id,
    isVisibile: reader.readBool(offsets[2]),
    name: reader.readString(offsets[3]),
    passcode: reader.readString(offsets[4]),
    whenUsed: reader.readDateTimeOrNull(offsets[5]),
  );
  return object;
}

P _catchwordDbDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _catchwordDbDtoGetId(CatchwordDbDto object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _catchwordDbDtoGetLinks(CatchwordDbDto object) {
  return [];
}

void _catchwordDbDtoAttach(
    IsarCollection<dynamic> col, Id id, CatchwordDbDto object) {
  object.id = id;
}

extension CatchwordDbDtoQueryWhereSort
    on QueryBuilder<CatchwordDbDto, CatchwordDbDto, QWhere> {
  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterWhere> anyDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'dateTime'),
      );
    });
  }
}

extension CatchwordDbDtoQueryWhere
    on QueryBuilder<CatchwordDbDto, CatchwordDbDto, QWhereClause> {
  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterWhereClause> idBetween(
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

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterWhereClause>
      dateTimeEqualTo(DateTime dateTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'dateTime',
        value: [dateTime],
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterWhereClause>
      dateTimeNotEqualTo(DateTime dateTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dateTime',
              lower: [],
              upper: [dateTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dateTime',
              lower: [dateTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dateTime',
              lower: [dateTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dateTime',
              lower: [],
              upper: [dateTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterWhereClause>
      dateTimeGreaterThan(
    DateTime dateTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dateTime',
        lower: [dateTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterWhereClause>
      dateTimeLessThan(
    DateTime dateTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dateTime',
        lower: [],
        upper: [dateTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterWhereClause>
      dateTimeBetween(
    DateTime lowerDateTime,
    DateTime upperDateTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dateTime',
        lower: [lowerDateTime],
        includeLower: includeLower,
        upper: [upperDateTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CatchwordDbDtoQueryFilter
    on QueryBuilder<CatchwordDbDto, CatchwordDbDto, QFilterCondition> {
  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      accountIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      accountIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      accountIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      accountIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      accountIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      accountIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      accountIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      accountIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      accountIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountId',
        value: '',
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      accountIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountId',
        value: '',
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      dateTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      dateTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      dateTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      dateTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
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

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
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

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      isVisibileEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isVisibile',
        value: value,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      passcodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      passcodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'passcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      passcodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'passcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      passcodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'passcode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      passcodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'passcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      passcodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'passcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      passcodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'passcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      passcodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'passcode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      passcodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passcode',
        value: '',
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      passcodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'passcode',
        value: '',
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      whenUsedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'whenUsed',
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      whenUsedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'whenUsed',
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      whenUsedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'whenUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      whenUsedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'whenUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      whenUsedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'whenUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterFilterCondition>
      whenUsedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'whenUsed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CatchwordDbDtoQueryObject
    on QueryBuilder<CatchwordDbDto, CatchwordDbDto, QFilterCondition> {}

extension CatchwordDbDtoQueryLinks
    on QueryBuilder<CatchwordDbDto, CatchwordDbDto, QFilterCondition> {}

extension CatchwordDbDtoQuerySortBy
    on QueryBuilder<CatchwordDbDto, CatchwordDbDto, QSortBy> {
  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy> sortByAccountId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.asc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy>
      sortByAccountIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.desc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy> sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy>
      sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy>
      sortByIsVisibile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVisibile', Sort.asc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy>
      sortByIsVisibileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVisibile', Sort.desc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy> sortByPasscode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passcode', Sort.asc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy>
      sortByPasscodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passcode', Sort.desc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy> sortByWhenUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whenUsed', Sort.asc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy>
      sortByWhenUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whenUsed', Sort.desc);
    });
  }
}

extension CatchwordDbDtoQuerySortThenBy
    on QueryBuilder<CatchwordDbDto, CatchwordDbDto, QSortThenBy> {
  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy> thenByAccountId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.asc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy>
      thenByAccountIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.desc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy> thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy>
      thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy>
      thenByIsVisibile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVisibile', Sort.asc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy>
      thenByIsVisibileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVisibile', Sort.desc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy> thenByPasscode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passcode', Sort.asc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy>
      thenByPasscodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passcode', Sort.desc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy> thenByWhenUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whenUsed', Sort.asc);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QAfterSortBy>
      thenByWhenUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whenUsed', Sort.desc);
    });
  }
}

extension CatchwordDbDtoQueryWhereDistinct
    on QueryBuilder<CatchwordDbDto, CatchwordDbDto, QDistinct> {
  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QDistinct> distinctByAccountId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QDistinct> distinctByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateTime');
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QDistinct>
      distinctByIsVisibile() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isVisibile');
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QDistinct> distinctByPasscode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'passcode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CatchwordDbDto, CatchwordDbDto, QDistinct> distinctByWhenUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'whenUsed');
    });
  }
}

extension CatchwordDbDtoQueryProperty
    on QueryBuilder<CatchwordDbDto, CatchwordDbDto, QQueryProperty> {
  QueryBuilder<CatchwordDbDto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CatchwordDbDto, String, QQueryOperations> accountIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountId');
    });
  }

  QueryBuilder<CatchwordDbDto, DateTime, QQueryOperations> dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateTime');
    });
  }

  QueryBuilder<CatchwordDbDto, bool, QQueryOperations> isVisibileProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isVisibile');
    });
  }

  QueryBuilder<CatchwordDbDto, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<CatchwordDbDto, String, QQueryOperations> passcodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'passcode');
    });
  }

  QueryBuilder<CatchwordDbDto, DateTime?, QQueryOperations> whenUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'whenUsed');
    });
  }
}
