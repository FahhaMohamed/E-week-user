import 'package:cloud_firestore/cloud_firestore.dart';

class PointsModel {
  final int e20;
  final int e21;
  final int e22;
  final int e23;
  final int staff;
  
  PointsModel({
    required this.e20,
    required this.e21,
    required this.e22,
    required this.e23,
    required this.staff,
    
  });

  factory PointsModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return PointsModel(
      e20: data['e20'] ?? 0,
      e21: data['e21'] ?? 0,
      e22: data['e22'] ?? 0,
      e23: data['e23'] ?? 0,
      staff: data['staff'] ?? 0,
      
    );
  }
}
