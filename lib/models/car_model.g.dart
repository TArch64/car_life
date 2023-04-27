// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class CarCollectionReference
    implements
        CarQuery,
        FirestoreCollectionReference<CarModel, CarQuerySnapshot> {
  factory CarCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$CarCollectionReference;

  static CarModel fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$CarModelFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    CarModel value,
    SetOptions? options,
  ) {
    return {..._$CarModelToJson(value)}..remove('id');
  }

  @override
  CollectionReference<CarModel> get reference;

  @override
  CarDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<CarDocumentReference> add(CarModel value);
}

class _$CarCollectionReference extends _$CarQuery
    implements CarCollectionReference {
  factory _$CarCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$CarCollectionReference._(
      firestore.collection('cars').withConverter(
            fromFirestore: CarCollectionReference.fromFirestore,
            toFirestore: CarCollectionReference.toFirestore,
          ),
    );
  }

  _$CarCollectionReference._(
    CollectionReference<CarModel> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<CarModel> get reference =>
      super.reference as CollectionReference<CarModel>;

  @override
  CarDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return CarDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<CarDocumentReference> add(CarModel value) {
    return reference.add(value).then((ref) => CarDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$CarCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class CarDocumentReference
    extends FirestoreDocumentReference<CarModel, CarDocumentSnapshot> {
  factory CarDocumentReference(DocumentReference<CarModel> reference) =
      _$CarDocumentReference;

  DocumentReference<CarModel> get reference;

  /// A reference to the [CarCollectionReference] containing this document.
  CarCollectionReference get parent {
    return _$CarCollectionReference(reference.firestore);
  }

  late final EventCollectionReference events = _$EventCollectionReference(
    reference,
  );

  @override
  Stream<CarDocumentSnapshot> snapshots();

  @override
  Future<CarDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String userId,
    FieldValue userIdFieldValue,
    String name,
    FieldValue nameFieldValue,
    int mileage,
    FieldValue mileageFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String userId,
    FieldValue userIdFieldValue,
    String name,
    FieldValue nameFieldValue,
    int mileage,
    FieldValue mileageFieldValue,
  });
}

class _$CarDocumentReference
    extends FirestoreDocumentReference<CarModel, CarDocumentSnapshot>
    implements CarDocumentReference {
  _$CarDocumentReference(this.reference);

  @override
  final DocumentReference<CarModel> reference;

  /// A reference to the [CarCollectionReference] containing this document.
  CarCollectionReference get parent {
    return _$CarCollectionReference(reference.firestore);
  }

  late final EventCollectionReference events = _$EventCollectionReference(
    reference,
  );

  @override
  Stream<CarDocumentSnapshot> snapshots() {
    return reference.snapshots().map(CarDocumentSnapshot._);
  }

  @override
  Future<CarDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(CarDocumentSnapshot._);
  }

  @override
  Future<CarDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(CarDocumentSnapshot._);
  }

  Future<void> update({
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? mileage = _sentinel,
    FieldValue? mileageFieldValue,
  }) async {
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      mileage == _sentinel || mileageFieldValue == null,
      "Cannot specify both mileage and mileageFieldValue",
    );
    final json = {
      if (userId != _sentinel) _$CarModelFieldMap['userId']!: userId as String,
      if (userIdFieldValue != null)
        _$CarModelFieldMap['userId']!: userIdFieldValue,
      if (name != _sentinel) _$CarModelFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$CarModelFieldMap['name']!: nameFieldValue,
      if (mileage != _sentinel) _$CarModelFieldMap['mileage']!: mileage as int,
      if (mileageFieldValue != null)
        _$CarModelFieldMap['mileage']!: mileageFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? mileage = _sentinel,
    FieldValue? mileageFieldValue,
  }) {
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      mileage == _sentinel || mileageFieldValue == null,
      "Cannot specify both mileage and mileageFieldValue",
    );
    final json = {
      if (userId != _sentinel) _$CarModelFieldMap['userId']!: userId as String,
      if (userIdFieldValue != null)
        _$CarModelFieldMap['userId']!: userIdFieldValue,
      if (name != _sentinel) _$CarModelFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$CarModelFieldMap['name']!: nameFieldValue,
      if (mileage != _sentinel) _$CarModelFieldMap['mileage']!: mileage as int,
      if (mileageFieldValue != null)
        _$CarModelFieldMap['mileage']!: mileageFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is CarDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class CarQuery implements QueryReference<CarModel, CarQuerySnapshot> {
  @override
  CarQuery limit(int limit);

  @override
  CarQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  CarQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    CarDocumentSnapshot? startAtDocument,
    CarDocumentSnapshot? endAtDocument,
    CarDocumentSnapshot? endBeforeDocument,
    CarDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  CarQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  CarQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  CarQuery whereUserId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  CarQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  CarQuery whereMileage({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });

  CarQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CarDocumentSnapshot? startAtDocument,
    CarDocumentSnapshot? endAtDocument,
    CarDocumentSnapshot? endBeforeDocument,
    CarDocumentSnapshot? startAfterDocument,
  });

  CarQuery orderByUserId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CarDocumentSnapshot? startAtDocument,
    CarDocumentSnapshot? endAtDocument,
    CarDocumentSnapshot? endBeforeDocument,
    CarDocumentSnapshot? startAfterDocument,
  });

  CarQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CarDocumentSnapshot? startAtDocument,
    CarDocumentSnapshot? endAtDocument,
    CarDocumentSnapshot? endBeforeDocument,
    CarDocumentSnapshot? startAfterDocument,
  });

  CarQuery orderByMileage({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    CarDocumentSnapshot? startAtDocument,
    CarDocumentSnapshot? endAtDocument,
    CarDocumentSnapshot? endBeforeDocument,
    CarDocumentSnapshot? startAfterDocument,
  });
}

class _$CarQuery extends QueryReference<CarModel, CarQuerySnapshot>
    implements CarQuery {
  _$CarQuery(
    this._collection, {
    required Query<CarModel> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<CarQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(CarQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<CarQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(CarQuerySnapshot._fromQuerySnapshot);
  }

  @override
  CarQuery limit(int limit) {
    return _$CarQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CarQuery limitToLast(int limit) {
    return _$CarQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  CarQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CarDocumentSnapshot? startAtDocument,
    CarDocumentSnapshot? endAtDocument,
    CarDocumentSnapshot? endBeforeDocument,
    CarDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$CarQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CarQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$CarQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  CarQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CarQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  CarQuery whereUserId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CarQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CarModelFieldMap['userId']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  CarQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CarQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CarModelFieldMap['name']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  CarQuery whereMileage({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$CarQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CarModelFieldMap['mileage']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  CarQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CarDocumentSnapshot? startAtDocument,
    CarDocumentSnapshot? endAtDocument,
    CarDocumentSnapshot? endBeforeDocument,
    CarDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CarQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CarQuery orderByUserId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CarDocumentSnapshot? startAtDocument,
    CarDocumentSnapshot? endAtDocument,
    CarDocumentSnapshot? endBeforeDocument,
    CarDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$CarModelFieldMap['userId']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CarQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CarQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CarDocumentSnapshot? startAtDocument,
    CarDocumentSnapshot? endAtDocument,
    CarDocumentSnapshot? endBeforeDocument,
    CarDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$CarModelFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CarQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CarQuery orderByMileage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CarDocumentSnapshot? startAtDocument,
    CarDocumentSnapshot? endAtDocument,
    CarDocumentSnapshot? endBeforeDocument,
    CarDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CarModelFieldMap['mileage']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CarQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$CarQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class CarDocumentSnapshot extends FirestoreDocumentSnapshot<CarModel> {
  CarDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<CarModel> snapshot;

  @override
  CarDocumentReference get reference {
    return CarDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final CarModel? data;
}

class CarQuerySnapshot
    extends FirestoreQuerySnapshot<CarModel, CarQueryDocumentSnapshot> {
  CarQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory CarQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<CarModel> snapshot,
  ) {
    final docs = snapshot.docs.map(CarQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        CarDocumentSnapshot._,
      );
    }).toList();

    return CarQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<CarDocumentSnapshot> _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    CarDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<CarDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<CarModel> snapshot;

  @override
  final List<CarQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<CarDocumentSnapshot>> docChanges;
}

class CarQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<CarModel>
    implements CarDocumentSnapshot {
  CarQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<CarModel> snapshot;

  @override
  final CarModel data;

  @override
  CarDocumentReference get reference {
    return CarDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class EventCollectionReference
    implements
        EventQuery,
        FirestoreCollectionReference<EventModel, EventQuerySnapshot> {
  factory EventCollectionReference(
    DocumentReference<CarModel> parent,
  ) = _$EventCollectionReference;

  static EventModel fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$EventModelFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    EventModel value,
    SetOptions? options,
  ) {
    return {..._$EventModelToJson(value)}..remove('id');
  }

  @override
  CollectionReference<EventModel> get reference;

  /// A reference to the containing [CarDocumentReference] if this is a subcollection.
  CarDocumentReference get parent;

  @override
  EventDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<EventDocumentReference> add(EventModel value);
}

class _$EventCollectionReference extends _$EventQuery
    implements EventCollectionReference {
  factory _$EventCollectionReference(
    DocumentReference<CarModel> parent,
  ) {
    return _$EventCollectionReference._(
      CarDocumentReference(parent),
      parent.collection('events').withConverter(
            fromFirestore: EventCollectionReference.fromFirestore,
            toFirestore: EventCollectionReference.toFirestore,
          ),
    );
  }

  _$EventCollectionReference._(
    this.parent,
    CollectionReference<EventModel> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final CarDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<EventModel> get reference =>
      super.reference as CollectionReference<EventModel>;

  @override
  EventDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return EventDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<EventDocumentReference> add(EventModel value) {
    return reference.add(value).then((ref) => EventDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$EventCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class EventDocumentReference
    extends FirestoreDocumentReference<EventModel, EventDocumentSnapshot> {
  factory EventDocumentReference(DocumentReference<EventModel> reference) =
      _$EventDocumentReference;

  DocumentReference<EventModel> get reference;

  /// A reference to the [EventCollectionReference] containing this document.
  EventCollectionReference get parent {
    return _$EventCollectionReference(
      reference.parent.parent!.withConverter<CarModel>(
        fromFirestore: CarCollectionReference.fromFirestore,
        toFirestore: CarCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<EventDocumentSnapshot> snapshots();

  @override
  Future<EventDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String name,
    FieldValue nameFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String name,
    FieldValue nameFieldValue,
  });
}

class _$EventDocumentReference
    extends FirestoreDocumentReference<EventModel, EventDocumentSnapshot>
    implements EventDocumentReference {
  _$EventDocumentReference(this.reference);

  @override
  final DocumentReference<EventModel> reference;

  /// A reference to the [EventCollectionReference] containing this document.
  EventCollectionReference get parent {
    return _$EventCollectionReference(
      reference.parent.parent!.withConverter<CarModel>(
        fromFirestore: CarCollectionReference.fromFirestore,
        toFirestore: CarCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<EventDocumentSnapshot> snapshots() {
    return reference.snapshots().map(EventDocumentSnapshot._);
  }

  @override
  Future<EventDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(EventDocumentSnapshot._);
  }

  @override
  Future<EventDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(EventDocumentSnapshot._);
  }

  Future<void> update({
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
  }) async {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    final json = {
      if (name != _sentinel) _$EventModelFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$EventModelFieldMap['name']!: nameFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    final json = {
      if (name != _sentinel) _$EventModelFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$EventModelFieldMap['name']!: nameFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is EventDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class EventQuery
    implements QueryReference<EventModel, EventQuerySnapshot> {
  @override
  EventQuery limit(int limit);

  @override
  EventQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  EventQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  EventQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  EventQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  EventQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  EventQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });
}

class _$EventQuery extends QueryReference<EventModel, EventQuerySnapshot>
    implements EventQuery {
  _$EventQuery(
    this._collection, {
    required Query<EventModel> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<EventQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(EventQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<EventQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(EventQuerySnapshot._fromQuerySnapshot);
  }

  @override
  EventQuery limit(int limit) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  EventQuery limitToLast(int limit) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$EventModelFieldMap['name']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$EventModelFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$EventQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class EventDocumentSnapshot extends FirestoreDocumentSnapshot<EventModel> {
  EventDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<EventModel> snapshot;

  @override
  EventDocumentReference get reference {
    return EventDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final EventModel? data;
}

class EventQuerySnapshot
    extends FirestoreQuerySnapshot<EventModel, EventQueryDocumentSnapshot> {
  EventQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory EventQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<EventModel> snapshot,
  ) {
    final docs = snapshot.docs.map(EventQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        EventDocumentSnapshot._,
      );
    }).toList();

    return EventQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<EventDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    EventDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<EventDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<EventModel> snapshot;

  @override
  final List<EventQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<EventDocumentSnapshot>> docChanges;
}

class EventQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<EventModel>
    implements EventDocumentSnapshot {
  EventQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<EventModel> snapshot;

  @override
  final EventModel data;

  @override
  EventDocumentReference get reference {
    return EventDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarModel _$CarModelFromJson(Map<String, dynamic> json) => CarModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      mileage: json['mileage'] as int? ?? 0,
      userId: json['userId'] as String? ?? '',
    );

const _$CarModelFieldMap = <String, String>{
  'id': 'id',
  'userId': 'userId',
  'name': 'name',
  'mileage': 'mileage',
};

Map<String, dynamic> _$CarModelToJson(CarModel instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'mileage': instance.mileage,
    };

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      mileage: json['mileage'] == null
          ? null
          : EventMileageModel.fromJson(json['mileage'] as Map<String, dynamic>),
    );

const _$EventModelFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'mileage': 'mileage',
};

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mileage': instance.mileage?.toJson(),
    };

EventMileageModel _$EventMileageModelFromJson(Map<String, dynamic> json) =>
    EventMileageModel(
      recurrence: $enumDecodeNullable(
              _$EventMileageRecurrenceEnumMap, json['recurrence']) ??
          EventMileageRecurrence.single,
      value: json['value'] as int? ?? 0,
      recurrenceInterval: json['recurrenceInterval'] as int? ?? 500,
      recurrenceCount: json['recurrenceCount'] as int? ?? 1,
      recurrenceEnds: $enumDecodeNullable(
              _$EventMileageRecurrenceEndsEnumMap, json['recurrenceEnds']) ??
          EventMileageRecurrenceEnds.never,
    );

const _$EventMileageModelFieldMap = <String, String>{
  'recurrence': 'recurrence',
  'value': 'value',
  'recurrenceInterval': 'recurrenceInterval',
  'recurrenceEnds': 'recurrenceEnds',
  'recurrenceCount': 'recurrenceCount',
};

Map<String, dynamic> _$EventMileageModelToJson(EventMileageModel instance) =>
    <String, dynamic>{
      'recurrence': _$EventMileageRecurrenceEnumMap[instance.recurrence]!,
      'value': instance.value,
      'recurrenceInterval': instance.recurrenceInterval,
      'recurrenceEnds':
          _$EventMileageRecurrenceEndsEnumMap[instance.recurrenceEnds]!,
      'recurrenceCount': instance.recurrenceCount,
    };

const _$EventMileageRecurrenceEnumMap = {
  EventMileageRecurrence.single: 'single',
  EventMileageRecurrence.recurring: 'recurring',
};

const _$EventMileageRecurrenceEndsEnumMap = {
  EventMileageRecurrenceEnds.never: 'never',
  EventMileageRecurrenceEnds.after: 'after',
};
