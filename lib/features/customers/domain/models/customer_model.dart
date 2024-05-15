import 'package:json_annotation/json_annotation.dart';
part 'customer_model.g.dart';

@JsonSerializable()
class CustomerModel {
  @JsonKey(name: "id")
  final int id;
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
  @JsonKey(name: "country")
  final String country;
  @JsonKey(name: "state")
  final String state;
  @JsonKey(name: "pincode")
  final int pincode;

  CustomerModel({
    required this.id,
    required this.name,
    this.profilePic,
    required this.mobileNumber,
    required this.email,
    required this.street,
    required this.streetTwo,
    required this.city,
    required this.country,
    required this.state,
    required this.pincode,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
