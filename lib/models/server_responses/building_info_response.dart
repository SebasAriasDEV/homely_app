// To parse this JSON data, do
//
//     final buildingInfoReponse = buildingInfoReponseFromJson(jsonString);
import 'dart:convert';

import 'package:homely_app/models/building_model.dart';

BuildingInfoReponse buildingInfoReponseFromJson(String str) => BuildingInfoReponse.fromJson(json.decode(str));

String buildingInfoReponseToJson(BuildingInfoReponse data) => json.encode(data.toJson());

class BuildingInfoReponse {
    BuildingInfoReponse({
        required this.foundBuilding,
    });

    final Building foundBuilding;

    factory BuildingInfoReponse.fromJson(Map<String, dynamic> json) => BuildingInfoReponse(
        foundBuilding: Building.fromJson(json["foundBuilding"]),
    );

    Map<String, dynamic> toJson() => {
        "foundBuilding": foundBuilding.toJson(),
    };
}
