import '../../domain/entities/personal.dart';

class PersonalModel {
  final String id;
  final String name;
  final String bio;
  final List<String> specialties;
  final double rating;
  final String city;
  final String state;
  final String photoUrl;
  final String whatsapp;
  final double price;

  PersonalModel({
    required this.id,
    required this.name,
    required this.bio,
    required this.specialties,
    required this.rating,
    required this.city,
    required this.state,
    required this.photoUrl,
    required this.whatsapp,
    required this.price,
  });

  factory PersonalModel.fromJson(Map<String, dynamic> json) {
    return PersonalModel(
      id: json['id'],
      name: json['name'],
      bio: json['bio'],
      specialties: List<String>.from(json['specialties']),
      rating: (json['rating'] as num).toDouble(),
      city: json['city'],
      state: json['state'],
      photoUrl: json['photoUrl'],
      whatsapp: json['whatsapp'],
      price: (json['price'] as num).toDouble(),
    );
  }
}

extension PersonalModelMapper on PersonalModel {
  Personal toEntity() {
    return Personal(
      id: id,
      name: name,
      bio: bio,
      specialties: specialties,
      rating: rating,
      city: city,
      state: state,
      photoUrl: photoUrl,
      whatsapp: whatsapp,
      price: price,
    );
  }
}
