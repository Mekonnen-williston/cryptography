// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secret_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecretBox _$SecretBoxFromJson(Map<String, dynamic> json) => SecretBox(
      (json['cipherText'] as List<dynamic>).map((e) => e as int).toList(),
      nonce: (json['nonce'] as List<dynamic>).map((e) => e as int).toList(),
      mac: Mac.fromJson(json['mac'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SecretBoxToJson(SecretBox instance) => <String, dynamic>{
      'cipherText': instance.cipherText,
      'mac': instance.mac,
      'nonce': instance.nonce,
    };
