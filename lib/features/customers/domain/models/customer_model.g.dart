// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      profilePic: json['profile_pic'] as String,
      mobileNumber: (json['mobile_number'] as num).toInt(),
      email: json['email'] as String,
      street: json['street'] as String,
      streetTwo: json['street_two'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_pic': instance.profilePic,
      'mobile_number': instance.mobileNumber,
      'email': instance.email,
      'street': instance.street,
      'street_two': instance.streetTwo,
      'city': instance.city,
      'country': instance.country,
      'state': instance.state,
    };
