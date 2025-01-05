// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VisitorImpl _$$VisitorImplFromJson(Map<String, dynamic> json) =>
    _$VisitorImpl(
      name: json['name'] as String,
      phone: json['phone'] as String,
      purpose: json['purpose'] as String,
      department: json['department'] as String,
      host: json['host'] as String,
      documentType: json['documentType'] as String,
      address: json['address'] as String?,
      vehicleNumber: json['vehicleNumber'] as String?,
      visitorPhotoPath: json['visitorPhotoPath'] as String?,
      documentPath: json['documentPath'] as String?,
      visitorCount: (json['visitorCount'] as num?)?.toInt() ?? 1,
      checkInTime: json['checkInTime'] == null
          ? null
          : DateTime.parse(json['checkInTime'] as String),
      checkOutTime: json['checkOutTime'] == null
          ? null
          : DateTime.parse(json['checkOutTime'] as String),
      isCheckedIn: json['isCheckedIn'] as bool? ?? false,
    );

Map<String, dynamic> _$$VisitorImplToJson(_$VisitorImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'purpose': instance.purpose,
      'department': instance.department,
      'host': instance.host,
      'documentType': instance.documentType,
      'address': instance.address,
      'vehicleNumber': instance.vehicleNumber,
      'visitorPhotoPath': instance.visitorPhotoPath,
      'documentPath': instance.documentPath,
      'visitorCount': instance.visitorCount,
      'checkInTime': instance.checkInTime?.toIso8601String(),
      'checkOutTime': instance.checkOutTime?.toIso8601String(),
      'isCheckedIn': instance.isCheckedIn,
    };
