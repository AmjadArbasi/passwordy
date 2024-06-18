// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_local_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserLocalDtoCollection on Isar {
  IsarCollection<UserLocalDto> get userLocalDtos => this.collection();
}

const UserLocalDtoSchema = CollectionSchema(
  name: r'UserLocalDto',
  id: 4055612880800338000,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'displayName': PropertySchema(
      id: 1,
      name: r'displayName',
      type: IsarType.string,
    ),
    r'iv': PropertySchema(
      id: 2,
      name: r'iv',
      type: IsarType.string,
    ),
    r'lastSuccessfulSignIn': PropertySchema(
      id: 3,
      name: r'lastSuccessfulSignIn',
      type: IsarType.dateTime,
    ),
    r'lastUnuccessfulSignIn': PropertySchema(
      id: 4,
      name: r'lastUnuccessfulSignIn',
      type: IsarType.dateTime,
    ),
    r'masterPassword': PropertySchema(
      id: 5,
      name: r'masterPassword',
      type: IsarType.string,
    ),
    r'onboardingCompleted': PropertySchema(
      id: 6,
      name: r'onboardingCompleted',
      type: IsarType.bool,
    ),
    r'secret': PropertySchema(
      id: 7,
      name: r'secret',
      type: IsarType.string,
    ),
    r'securityQuestion': PropertySchema(
      id: 8,
      name: r'securityQuestion',
      type: IsarType.string,
    ),
    r'username': PropertySchema(
      id: 9,
      name: r'username',
      type: IsarType.string,
    )
  },
  estimateSize: _userLocalDtoEstimateSize,
  serialize: _userLocalDtoSerialize,
  deserialize: _userLocalDtoDeserialize,
  deserializeProp: _userLocalDtoDeserializeProp,
  idName: r'id',
  indexes: {
    r'username': IndexSchema(
      id: -2899563114555695793,
      name: r'username',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'username',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _userLocalDtoGetId,
  getLinks: _userLocalDtoGetLinks,
  attach: _userLocalDtoAttach,
  version: '3.1.0+1',
);

int _userLocalDtoEstimateSize(
  UserLocalDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.displayName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.iv;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.masterPassword;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.secret;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.securityQuestion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.username;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userLocalDtoSerialize(
  UserLocalDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.displayName);
  writer.writeString(offsets[2], object.iv);
  writer.writeDateTime(offsets[3], object.lastSuccessfulSignIn);
  writer.writeDateTime(offsets[4], object.lastUnuccessfulSignIn);
  writer.writeString(offsets[5], object.masterPassword);
  writer.writeBool(offsets[6], object.onboardingCompleted);
  writer.writeString(offsets[7], object.secret);
  writer.writeString(offsets[8], object.securityQuestion);
  writer.writeString(offsets[9], object.username);
}

UserLocalDto _userLocalDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserLocalDto(
    createdAt: reader.readDateTimeOrNull(offsets[0]),
    displayName: reader.readStringOrNull(offsets[1]),
    id: id,
    iv: reader.readStringOrNull(offsets[2]),
    lastSuccessfulSignIn: reader.readDateTimeOrNull(offsets[3]),
    lastUnuccessfulSignIn: reader.readDateTimeOrNull(offsets[4]),
    masterPassword: reader.readStringOrNull(offsets[5]),
    onboardingCompleted: reader.readBoolOrNull(offsets[6]),
    secret: reader.readStringOrNull(offsets[7]),
    securityQuestion: reader.readStringOrNull(offsets[8]),
    username: reader.readStringOrNull(offsets[9]),
  );
  return object;
}

P _userLocalDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userLocalDtoGetId(UserLocalDto object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _userLocalDtoGetLinks(UserLocalDto object) {
  return [];
}

void _userLocalDtoAttach(
    IsarCollection<dynamic> col, Id id, UserLocalDto object) {
  object.id = id;
}

extension UserLocalDtoByIndex on IsarCollection<UserLocalDto> {
  Future<UserLocalDto?> getByUsername(String? username) {
    return getByIndex(r'username', [username]);
  }

  UserLocalDto? getByUsernameSync(String? username) {
    return getByIndexSync(r'username', [username]);
  }

  Future<bool> deleteByUsername(String? username) {
    return deleteByIndex(r'username', [username]);
  }

  bool deleteByUsernameSync(String? username) {
    return deleteByIndexSync(r'username', [username]);
  }

  Future<List<UserLocalDto?>> getAllByUsername(List<String?> usernameValues) {
    final values = usernameValues.map((e) => [e]).toList();
    return getAllByIndex(r'username', values);
  }

  List<UserLocalDto?> getAllByUsernameSync(List<String?> usernameValues) {
    final values = usernameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'username', values);
  }

  Future<int> deleteAllByUsername(List<String?> usernameValues) {
    final values = usernameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'username', values);
  }

  int deleteAllByUsernameSync(List<String?> usernameValues) {
    final values = usernameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'username', values);
  }

  Future<Id> putByUsername(UserLocalDto object) {
    return putByIndex(r'username', object);
  }

  Id putByUsernameSync(UserLocalDto object, {bool saveLinks = true}) {
    return putByIndexSync(r'username', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUsername(List<UserLocalDto> objects) {
    return putAllByIndex(r'username', objects);
  }

  List<Id> putAllByUsernameSync(List<UserLocalDto> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'username', objects, saveLinks: saveLinks);
  }
}

extension UserLocalDtoQueryWhereSort
    on QueryBuilder<UserLocalDto, UserLocalDto, QWhere> {
  QueryBuilder<UserLocalDto, UserLocalDto, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserLocalDtoQueryWhere
    on QueryBuilder<UserLocalDto, UserLocalDto, QWhereClause> {
  QueryBuilder<UserLocalDto, UserLocalDto, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterWhereClause> idBetween(
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

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterWhereClause> usernameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'username',
        value: [null],
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterWhereClause>
      usernameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'username',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterWhereClause> usernameEqualTo(
      String? username) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'username',
        value: [username],
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterWhereClause>
      usernameNotEqualTo(String? username) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'username',
              lower: [],
              upper: [username],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'username',
              lower: [username],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'username',
              lower: [username],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'username',
              lower: [],
              upper: [username],
              includeUpper: false,
            ));
      }
    });
  }
}

extension UserLocalDtoQueryFilter
    on QueryBuilder<UserLocalDto, UserLocalDto, QFilterCondition> {
  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      displayNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'displayName',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      displayNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'displayName',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      displayNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      displayNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      displayNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      displayNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      displayNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      displayNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      displayNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      displayNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      displayNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      displayNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition> ivIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'iv',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      ivIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'iv',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition> ivEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition> ivGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition> ivLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition> ivBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iv',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition> ivStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition> ivEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition> ivContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition> ivMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iv',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition> ivIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iv',
        value: '',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      ivIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iv',
        value: '',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      lastSuccessfulSignInIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSuccessfulSignIn',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      lastSuccessfulSignInIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSuccessfulSignIn',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      lastSuccessfulSignInEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSuccessfulSignIn',
        value: value,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      lastSuccessfulSignInGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSuccessfulSignIn',
        value: value,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      lastSuccessfulSignInLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSuccessfulSignIn',
        value: value,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      lastSuccessfulSignInBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSuccessfulSignIn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      lastUnuccessfulSignInIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUnuccessfulSignIn',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      lastUnuccessfulSignInIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUnuccessfulSignIn',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      lastUnuccessfulSignInEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUnuccessfulSignIn',
        value: value,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      lastUnuccessfulSignInGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUnuccessfulSignIn',
        value: value,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      lastUnuccessfulSignInLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUnuccessfulSignIn',
        value: value,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      lastUnuccessfulSignInBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUnuccessfulSignIn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      masterPasswordIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'masterPassword',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      masterPasswordIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'masterPassword',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      masterPasswordEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'masterPassword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      masterPasswordGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'masterPassword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      masterPasswordLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'masterPassword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      masterPasswordBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'masterPassword',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      masterPasswordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'masterPassword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      masterPasswordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'masterPassword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      masterPasswordContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'masterPassword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      masterPasswordMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'masterPassword',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      masterPasswordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'masterPassword',
        value: '',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      masterPasswordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'masterPassword',
        value: '',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      onboardingCompletedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'onboardingCompleted',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      onboardingCompletedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'onboardingCompleted',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      onboardingCompletedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'onboardingCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      secretIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'secret',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      secretIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'secret',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition> secretEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'secret',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      secretGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'secret',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      secretLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'secret',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition> secretBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'secret',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      secretStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'secret',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      secretEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'secret',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      secretContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'secret',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition> secretMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'secret',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      secretIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'secret',
        value: '',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      secretIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'secret',
        value: '',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      securityQuestionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'securityQuestion',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      securityQuestionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'securityQuestion',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      securityQuestionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'securityQuestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      securityQuestionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'securityQuestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      securityQuestionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'securityQuestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      securityQuestionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'securityQuestion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      securityQuestionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'securityQuestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      securityQuestionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'securityQuestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      securityQuestionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'securityQuestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      securityQuestionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'securityQuestion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      securityQuestionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'securityQuestion',
        value: '',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      securityQuestionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'securityQuestion',
        value: '',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      usernameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'username',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      usernameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'username',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      usernameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      usernameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      usernameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      usernameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'username',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      usernameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      usernameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      usernameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      usernameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'username',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      usernameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'username',
        value: '',
      ));
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterFilterCondition>
      usernameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'username',
        value: '',
      ));
    });
  }
}

extension UserLocalDtoQueryObject
    on QueryBuilder<UserLocalDto, UserLocalDto, QFilterCondition> {}

extension UserLocalDtoQueryLinks
    on QueryBuilder<UserLocalDto, UserLocalDto, QFilterCondition> {}

extension UserLocalDtoQuerySortBy
    on QueryBuilder<UserLocalDto, UserLocalDto, QSortBy> {
  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> sortByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      sortByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> sortByIv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iv', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> sortByIvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iv', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      sortByLastSuccessfulSignIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSuccessfulSignIn', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      sortByLastSuccessfulSignInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSuccessfulSignIn', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      sortByLastUnuccessfulSignIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUnuccessfulSignIn', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      sortByLastUnuccessfulSignInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUnuccessfulSignIn', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      sortByMasterPassword() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masterPassword', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      sortByMasterPasswordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masterPassword', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      sortByOnboardingCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onboardingCompleted', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      sortByOnboardingCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onboardingCompleted', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> sortBySecret() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secret', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> sortBySecretDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secret', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      sortBySecurityQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'securityQuestion', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      sortBySecurityQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'securityQuestion', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> sortByUsername() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> sortByUsernameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.desc);
    });
  }
}

extension UserLocalDtoQuerySortThenBy
    on QueryBuilder<UserLocalDto, UserLocalDto, QSortThenBy> {
  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> thenByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      thenByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> thenByIv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iv', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> thenByIvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iv', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      thenByLastSuccessfulSignIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSuccessfulSignIn', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      thenByLastSuccessfulSignInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSuccessfulSignIn', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      thenByLastUnuccessfulSignIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUnuccessfulSignIn', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      thenByLastUnuccessfulSignInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUnuccessfulSignIn', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      thenByMasterPassword() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masterPassword', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      thenByMasterPasswordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masterPassword', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      thenByOnboardingCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onboardingCompleted', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      thenByOnboardingCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onboardingCompleted', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> thenBySecret() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secret', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> thenBySecretDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secret', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      thenBySecurityQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'securityQuestion', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy>
      thenBySecurityQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'securityQuestion', Sort.desc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> thenByUsername() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.asc);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QAfterSortBy> thenByUsernameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.desc);
    });
  }
}

extension UserLocalDtoQueryWhereDistinct
    on QueryBuilder<UserLocalDto, UserLocalDto, QDistinct> {
  QueryBuilder<UserLocalDto, UserLocalDto, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QDistinct> distinctByDisplayName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QDistinct> distinctByIv(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iv', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QDistinct>
      distinctByLastSuccessfulSignIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSuccessfulSignIn');
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QDistinct>
      distinctByLastUnuccessfulSignIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUnuccessfulSignIn');
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QDistinct> distinctByMasterPassword(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'masterPassword',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QDistinct>
      distinctByOnboardingCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onboardingCompleted');
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QDistinct> distinctBySecret(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'secret', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QDistinct>
      distinctBySecurityQuestion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'securityQuestion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserLocalDto, UserLocalDto, QDistinct> distinctByUsername(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'username', caseSensitive: caseSensitive);
    });
  }
}

extension UserLocalDtoQueryProperty
    on QueryBuilder<UserLocalDto, UserLocalDto, QQueryProperty> {
  QueryBuilder<UserLocalDto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserLocalDto, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<UserLocalDto, String?, QQueryOperations> displayNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayName');
    });
  }

  QueryBuilder<UserLocalDto, String?, QQueryOperations> ivProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iv');
    });
  }

  QueryBuilder<UserLocalDto, DateTime?, QQueryOperations>
      lastSuccessfulSignInProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSuccessfulSignIn');
    });
  }

  QueryBuilder<UserLocalDto, DateTime?, QQueryOperations>
      lastUnuccessfulSignInProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUnuccessfulSignIn');
    });
  }

  QueryBuilder<UserLocalDto, String?, QQueryOperations>
      masterPasswordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'masterPassword');
    });
  }

  QueryBuilder<UserLocalDto, bool?, QQueryOperations>
      onboardingCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onboardingCompleted');
    });
  }

  QueryBuilder<UserLocalDto, String?, QQueryOperations> secretProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'secret');
    });
  }

  QueryBuilder<UserLocalDto, String?, QQueryOperations>
      securityQuestionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'securityQuestion');
    });
  }

  QueryBuilder<UserLocalDto, String?, QQueryOperations> usernameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'username');
    });
  }
}
