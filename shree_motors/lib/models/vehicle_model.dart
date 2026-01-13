// lib/models/vehicle_model.dart
class VehicleModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String priceText;
  final int kmRange;
  final int modelCount;
  final int colorCount;
  final List<String> images;
  final VehicleSpecs specs;
  final List<String> availableColors;
  final List<String> features;

  VehicleModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.priceText,
    required this.kmRange,
    required this.modelCount,
    required this.colorCount,
    required this.images,
    required this.specs,
    required this.availableColors,
    required this.features,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      priceText: json['priceText'] ?? '',
      kmRange: json['kmRange'] ?? 0,
      modelCount: json['modelCount'] ?? 0,
      colorCount: json['colorCount'] ?? 0,
      images: List<String>.from(json['images'] ?? []),
      specs: VehicleSpecs.fromJson(json['specs'] ?? {}),
      availableColors: List<String>.from(json['availableColors'] ?? []),
      features: List<String>.from(json['features'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'priceText': priceText,
      'kmRange': kmRange,
      'modelCount': modelCount,
      'colorCount': colorCount,
      'images': images,
      'specs': specs.toJson(),
      'availableColors': availableColors,
      'features': features,
    };
  }
}

class VehicleSpecs {
  final int modelYear;
  final int seatingCapacity;
  final String chargingTime;
  final String cargoBedSize;
  final String motorPower;
  final String loadCapacity;
  final String steering;
  final String cabinType;
  final bool sunVisor;
  final bool airConditioning;
  final bool usbChargingPort;
  final String dashboard;
  final String interiorMaterial;
  final String cabinLights;

  VehicleSpecs({
    required this.modelYear,
    required this.seatingCapacity,
    required this.chargingTime,
    required this.cargoBedSize,
    required this.motorPower,
    required this.loadCapacity,
    required this.steering,
    required this.cabinType,
    required this.sunVisor,
    required this.airConditioning,
    required this.usbChargingPort,
    required this.dashboard,
    required this.interiorMaterial,
    required this.cabinLights,
  });

  factory VehicleSpecs.fromJson(Map<String, dynamic> json) {
    return VehicleSpecs(
      modelYear: json['modelYear'] ?? 2024,
      seatingCapacity: json['seatingCapacity'] ?? 2,
      chargingTime: json['chargingTime'] ?? '8-10 hrs',
      cargoBedSize: json['cargoBedSize'] ?? '10FT',
      motorPower: json['motorPower'] ?? '70 KW',
      loadCapacity: json['loadCapacity'] ?? '1.5 Tons',
      steering: json['steering'] ?? 'Power Steering',
      cabinType: json['cabinType'] ?? 'Enclosed Ventilated Cabin',
      sunVisor: json['sunVisor'] ?? true,
      airConditioning: json['airConditioning'] ?? false,
      usbChargingPort: json['usbChargingPort'] ?? true,
      dashboard: json['dashboard'] ?? 'Digital Meter Display',
      interiorMaterial: json['interiorMaterial'] ?? 'Durable Plastic Finish',
      cabinLights: json['cabinLights'] ?? 'LED Interior Light',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'modelYear': modelYear,
      'seatingCapacity': seatingCapacity,
      'chargingTime': chargingTime,
      'cargoBedSize': cargoBedSize,
      'motorPower': motorPower,
      'loadCapacity': loadCapacity,
      'steering': steering,
      'cabinType': cabinType,
      'sunVisor': sunVisor,
      'airConditioning': airConditioning,
      'usbChargingPort': usbChargingPort,
      'dashboard': dashboard,
      'interiorMaterial': interiorMaterial,
      'cabinLights': cabinLights,
    };
  }
}
