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
class EventMileage {
  final EventMileageRecurrence? _recurrence;
  final int? _value;
  final int? _recurrenceInterval;
  final EventMileageRecurrenceEnds? _recurrenceEnds;
  final int? _recurrenceCount;

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
  
  const EventMileage._internal({required recurrence, required value, required recurrenceInterval, required recurrenceEnds, required recurrenceCount}): _recurrence = recurrence, _value = value, _recurrenceInterval = recurrenceInterval, _recurrenceEnds = recurrenceEnds, _recurrenceCount = recurrenceCount;
  
  factory EventMileage({required EventMileageRecurrence recurrence, required int value, required int recurrenceInterval, required EventMileageRecurrenceEnds recurrenceEnds, required int recurrenceCount}) {
    return EventMileage._internal(
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
    buffer.write("recurrence=" + (_recurrence != null ? enumToString(_recurrence)! : "null") + ", ");
    buffer.write("value=" + (_value != null ? _value!.toString() : "null") + ", ");
    buffer.write("recurrenceInterval=" + (_recurrenceInterval != null ? _recurrenceInterval!.toString() : "null") + ", ");
    buffer.write("recurrenceEnds=" + (_recurrenceEnds != null ? enumToString(_recurrenceEnds)! : "null") + ", ");
    buffer.write("recurrenceCount=" + (_recurrenceCount != null ? _recurrenceCount!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  EventMileage copyWith({EventMileageRecurrence? recurrence, int? value, int? recurrenceInterval, EventMileageRecurrenceEnds? recurrenceEnds, int? recurrenceCount}) {
    return EventMileage._internal(
      recurrence: recurrence ?? this.recurrence,
      value: value ?? this.value,
      recurrenceInterval: recurrenceInterval ?? this.recurrenceInterval,
      recurrenceEnds: recurrenceEnds ?? this.recurrenceEnds,
      recurrenceCount: recurrenceCount ?? this.recurrenceCount);
  }
  
  EventMileage.fromJson(Map<String, dynamic> json)  
    : _recurrence = enumFromString<EventMileageRecurrence>(json['recurrence'], EventMileageRecurrence.values),
      _value = (json['value'] as num?)?.toInt(),
      _recurrenceInterval = (json['recurrenceInterval'] as num?)?.toInt(),
      _recurrenceEnds = enumFromString<EventMileageRecurrenceEnds>(json['recurrenceEnds'], EventMileageRecurrenceEnds.values),
      _recurrenceCount = (json['recurrenceCount'] as num?)?.toInt();
  
  Map<String, dynamic> toJson() => {
    'recurrence': enumToString(_recurrence), 'value': _value, 'recurrenceInterval': _recurrenceInterval, 'recurrenceEnds': enumToString(_recurrenceEnds), 'recurrenceCount': _recurrenceCount
  };
  
  Map<String, Object?> toMap() => {
    'recurrence': _recurrence, 'value': _value, 'recurrenceInterval': _recurrenceInterval, 'recurrenceEnds': _recurrenceEnds, 'recurrenceCount': _recurrenceCount
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "EventMileage";
    modelSchemaDefinition.pluralName = "EventMileages";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'recurrence',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'value',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'recurrenceInterval',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'recurrenceEnds',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'recurrenceCount',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
  });
}