import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'locations.g.dart';

@JsonSerializable()
class LatLng {

  LatLng({

    this.latitude,
    this.longitude,

  });

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);

  Map<String, dynamic> toJson() => _$LatLngToJson(this);

  final double latitude;
  final double longitude;
}

@JsonSerializable()
class Vehicle {

  Vehicle({
    this.id,
    this.name,
    this.description,
    this.latitude,
    this.longitude,
    this.batteryLevel,
    this.timestamp,
    this.price,
    this.priceTime,
    this.currency,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);

  final String id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;
  final String batteryLevel;
  final String timestamp;
  final String price;
  final String priceTime;
  final String currency;
}

@JsonSerializable()
class Locations {

  Locations({
    this.vehicles,
  });

  factory Locations.fromJson(Map<String, dynamic> json) =>  _$LocationsFromJson(json);

  Map<String, dynamic> toJson() => _$LocationsToJson(this);

  final List<Vehicle> vehicles;

}

Future<Locations> getVehicles() async {

  // the locations of scooters

  const vehicleLocationsURL = 'https://my-json-server.typicode.com/FlashScooters/Challenge/vehicles';

  final response = await http.get(vehicleLocationsURL);

  if (response.statusCode == 200) {

    return Locations.fromJson(json.decode(response.body));

  } else {

    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
            ' ${response.reasonPhrase}',
        uri: Uri.parse(vehicleLocationsURL));

  }
}