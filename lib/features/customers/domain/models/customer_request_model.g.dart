// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerRequestModel _$CustomerRequestModelFromJson(
        Map<String, dynamic> json) =>
    CustomerRequestModel(
      name: json['name'] as String,
      profilePic: json['profile_pic'] as String,
      mobileNumber: (json['mobile_number'] as num).toInt(),
      email: json['email'] as String,
      street: json['street'] as String,
      streetTwo: json['street_two'] as String,
      city: json['city'] as String,
      pincode: (json['pincode'] as num).toInt(),
      country: json['country'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$CustomerRequestModelToJson(
        CustomerRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profile_pic': instance.profilePic,
      'mobile_number': instance.mobileNumber,
      'email': instance.email,
      'street': instance.street,
      'street_two': instance.streetTwo,
      'city': instance.city,
      'pincode': instance.pincode,
      'country': instance.country,
      'state': instance.state,
    };
