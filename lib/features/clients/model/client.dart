import 'package:equatable/equatable.dart';

class Client extends Equatable {
  final String? sharedKey;
  final String businessId;
  final String email;
  final String phone;
  final String? addedDate;

  const Client(
      {this.sharedKey,
      this.addedDate,
      required this.businessId,
      required this.email,
      required this.phone});

  factory Client.fromJson(Map<String, dynamic> json) => Client(
      sharedKey: json['sharedKey'],
      addedDate: json['addedDate'],
      businessId: json['businessId'],
      email: json['email'],
      phone: json['phone']);

  @override
  List<Object?> get props => [sharedKey, addedDate, businessId, email, phone];
}
