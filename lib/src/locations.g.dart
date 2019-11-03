// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatLng _$LatLngFromJson(Map<String, dynamic> json) {
  return LatLng(
      latitude: (json['latitude'] as num)?.toDouble(),
      longitude: (json['longitude'] as num)?.toDouble());
}

Map<String, dynamic> _$LatLngToJson(LatLng instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude
    };

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return Vehicle(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      latitude: (json['latitude'] as num)?.toDouble(),
      longitude: (json['longitude'] as num)?.toDouble(),
      batteryLevel: json['batteryLevel'] as String,
      timestamp: json['timestamp'] as String,
      price: json['price'] as String,
      priceTime: json['priceTime'] as String,
      currency: json['currency'] as String);
}

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'batteryLevel': instance.batteryLevel,
      'timestamp': instance.timestamp,
      'price': instance.price,
      'priceTime': instance.priceTime,
      'currency': instance.currency
    };

Locations _$LocationsFromJson(Map<String, dynamic> json) {
  return Locations(
      vehicles: (json['vehicles'] as List)
          ?.map((e) =>
              e == null ? null : Vehicle.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$LocationsToJson(Locations instance) =>
    <String, dynamic>{'vehicles': instance.vehicles};
