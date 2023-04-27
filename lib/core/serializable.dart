import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

export 'package:json_annotation/json_annotation.dart';

const Serializable = JsonSerializable(
  converters: firestoreJsonConverters,
  explicitToJson: true,
  createFieldMap: true,
);

class JsonIgnore extends JsonKey {
  const JsonIgnore(): super(includeToJson: false, includeFromJson: false);
}
