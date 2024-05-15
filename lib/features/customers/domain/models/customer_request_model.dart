import 'package:json_annotation/json_annotation.dart';
part 'customer_request_model.g.dart';

@JsonSerializable()
class CustomerRequestModel {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "profile_pic")
  final String? profilePic;
  @JsonKey(name: "mobile_number")
  final String mobileNumber;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "street")
  final String street;
  @JsonKey(name: "street_two")
  final String streetTwo;
  @JsonKey(name: "city")
  final String city;
  @JsonKey(name: "pincode")
  final int pincode;
  @JsonKey(name: "country")
  final String country;
  @JsonKey(name: "state")
  final String state;

  CustomerRequestModel({
    required this.name,
    required this.profilePic,
    required this.mobileNumber,
    required this.email,
    required this.street,
    required this.streetTwo,
    required this.city,
    required this.pincode,
    required this.country,
    required this.state,
  });

  factory CustomerRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerRequestModelToJson(this);
}
