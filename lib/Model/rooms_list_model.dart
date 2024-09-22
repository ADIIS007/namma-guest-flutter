import 'package:namma_guest/Model/sharing.dart';

class RoomsListModel {
  final String id;
  final String roomNumber;
  final String roomImage;
  final String roomStatus;
  final Sharing shared;
  final int rent;
  final int deposit;
  final int maintenance;
  final int floor;
  final bool availableStatus;
  final DateTime availableFrom;

  RoomsListModel({
    required this.id,
    required this.roomNumber,
    required this.roomImage,

    required this.roomStatus,
    required this.availableStatus,
    required this.availableFrom,

    required this.shared,
    required this.floor,

    required this.rent,
    required this.deposit,
    required this.maintenance,
  });
}