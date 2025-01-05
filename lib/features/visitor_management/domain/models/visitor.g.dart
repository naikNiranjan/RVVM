// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VisitorImpl _$$VisitorImplFromJson(Map<String, dynamic> json) =>
    _$VisitorImpl(
      name: json['name'] as String,
      address: json['address'] as String,
      contactNumber: json['contactNumber'] as String,
      vehicleNumber: json['vehicleNumber'] as String?,
      purposeOfVisit: json['purposeOfVisit'] as String,
      photoUrl: json['photoUrl'] as String?,
      numberOfVisitors: (json['numberOfVisitors'] as num).toInt(),
      whomToMeet: json['whomToMeet'] as String,
      department: json['department'] as String,
      documentType: json['documentType'] as String,
      documentUrl: json['documentUrl'] as String?,
      sendNotification: json['sendNotification'] as bool? ?? false,
      isApproved: json['isApproved'] as bool? ?? false,
      entryTime: json['entryTime'] == null
          ? null
          : DateTime.parse(json['entryTime'] as String),
      exitTime: json['exitTime'] == null
          ? null
          : DateTime.parse(json['exitTime'] as String),
    );

Map<String, dynamic> _$$VisitorImplToJson(_$VisitorImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'contactNumber': instance.contactNumber,
      'vehicleNumber': instance.vehicleNumber,
      'purposeOfVisit': instance.purposeOfVisit,
      'photoUrl': instance.photoUrl,
      'numberOfVisitors': instance.numberOfVisitors,
      'whomToMeet': instance.whomToMeet,
      'department': instance.department,
      'documentType': instance.documentType,
      'documentUrl': instance.documentUrl,
      'sendNotification': instance.sendNotification,
      'isApproved': instance.isApproved,
      'entryTime': instance.entryTime?.toIso8601String(),
      'exitTime': instance.exitTime?.toIso8601String(),
    };
