/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the EventMileage type in your schema. */
@immutable
class EventMileage extends Model {
  static const classType = const _EventMileageModelType();
  final String id;
  final EventMileageRecurrence? _recurrence;
  final int? _value;
  final int? _recurrenceInterval;
  final EventMileageRecurrenceEnds? _recurrenceEnds;
  final int? _recurrenceCount;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EventMileageModelIdentifier get modelIdentifier {
      return EventMileageModelIdentifier(
        id: id
      );
  }
  
  EventMileageRecurrence get recurrence {
    try {
      return _recurrence!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get value {
    try {
      return _value!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get recurrenceInterval {
    try {
      return _recurrenceInterval!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  EventMileageRecurrenceEnds get recurrenceEnds {
    try {
      return _recurrenceEnds!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get recurrenceCount {
    try {
      return _recurrenceCount!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const EventMileage._internal({required this.id, required recurrence, required value, required recurrenceInterval, required recurrenceEnds, required recurrenceCount, createdAt, updatedAt}): _recurrence = recurrence, _value = value, _recurrenceInterval = recurrenceInterval, _recurrenceEnds = recurrenceEnds, _recurrenceCount = recurrenceCount, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory EventMileage({String? id, required EventMileageRecurrence recurrence, required int value, required int recurrenceInterval, required EventMileageRecurrenceEnds recurrenceEnds, required int recurrenceCount}) {
    return EventMileage._internal(
      id: id == null ? UUID.getUUID() : id,
      recurrence: recurrence,
      value: value,
      recurrenceInterval: recurrenceInterval,
      recurrenceEnds: recurrenceEnds,
      recurrenceCount: recurrenceCount);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventMileage &&
      id == other.id &&
      _recurrence == other._recurrence &&
      _value == other._value &&
      _recurrenceInterval == other._recurrenceInterval &&
      _recurrenceEnds == other._recurrenceEnds &&
      _recurrenceCount == other._recurrenceCount;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("EventMileage {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("recurrence=" + (_recurrence != null ? enumToString(_recurrence)! : "null") + ", ");
    buffer.write("value=" + (_value != null ? _value!.toString() : "null") + ", ");
    buffer.write("recurrenceInterval=" + (_recurrenceInterval != null ? _recurrenceInterval!.toString() : "null") + ", ");
    buffer.write("recurrenceEnds=" + (_recurrenceEnds != null ? enumToString(_recurrenceEnds)! : "null") + ", ");
    buffer.write("recurrenceCount=" + (_recurrenceCount != null ? _recurrenceCount!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  EventMileage copyWith({EventMileageRecurrence? recurrence, int? value, int? recurrenceInterval, EventMileageRecurrenceEnds? recurrenceEnds, int? recurrenceCount}) {
    return EventMileage._internal(
      id: id,
      recurrence: recurrence ?? this.recurrence,
      value: value ?? this.value,
      recurrenceInterval: recurrenceInterval ?? this.recurrenceInterval,
      recurrenceEnds: recurrenceEnds ?? this.recurrenceEnds,
      recurrenceCount: recurrenceCount ?? this.recurrenceCount);
  }
  
  EventMileage.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _recurrence = enumFromString<EventMileageRecurrence>(json['recurrence'], EventMileageRecurrence.values),
      _value = (json['value'] as num?)?.toInt(),
      _recurrenceInterval = (json['recurrenceInterval'] as num?)?.toInt(),
      _recurrenceEnds = enumFromString<EventMileageRecurrenceEnds>(json['recurrenceEnds'], EventMileageRecurrenceEnds.values),
      _recurrenceCount = (json['recurrenceCount'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'recurrence': enumToString(_recurrence), 'value': _value, 'recurrenceInterval': _recurrenceInterval, 'recurrenceEnds': enumToString(_recurrenceEnds), 'recurrenceCount': _recurrenceCount, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'recurrence': _recurrence, 'value': _value, 'recurrenceInterval': _recurrenceInterval, 'recurrenceEnds': _recurrenceEnds, 'recurrenceCount': _recurrenceCount, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<EventMileageModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<EventMileageModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField RECURRENCE = QueryField(fieldName: "recurrence");
  static final QueryField VALUE = QueryField(fieldName: "value");
  static final QueryField RECURRENCEINTERVAL = QueryField(fieldName: "recurrenceInterval");
  static final QueryField RECURRENCEENDS = QueryField(fieldName: "recurrenceEnds");
  static final QueryField RECURRENCECOUNT = QueryField(fieldName: "recurrenceCount");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "EventMileage";
    modelSchemaDefinition.pluralName = "EventMileages";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: EventMileage.RECURRENCE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: EventMileage.VALUE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: EventMileage.RECURRENCEINTERVAL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: EventMileage.RECURRENCEENDS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: EventMileage.RECURRENCECOUNT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _EventMileageModelType extends ModelType<EventMileage> {
  const _EventMileageModelType();
  
  @override
  EventMileage fromJson(Map<String, dynamic> jsonData) {
    return EventMileage.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'EventMileage';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [EventMileage] in your schema.
 */
@immutable
class EventMileageModelIdentifier implements ModelIdentifier<EventMileage> {
  final String id;

  /** Create an instance of EventMileageModelIdentifier using [id] the primary key. */
  const EventMileageModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'EventMileageModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EventMileageModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}