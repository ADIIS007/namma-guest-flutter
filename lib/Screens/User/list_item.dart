import 'package:flutter/material.dart';
import 'package:namma_guest/Model/paying_guest_list_model.dart';

class ListGuestItem extends StatelessWidget {
  final PayingGuestListModel model;

  const ListGuestItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(
              color: Colors.grey.withOpacity(0.4)
          ), // Border color and width
        ),
        elevation: 2.0,
        child: Stack(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              leading: CircleAvatar(
                // Background color if needed
                radius: 30.0,
                child: Icon(
                  model.guestType == 'PG' ? Icons.apartment : Icons.home,
                  size: 30.0,
                  color: Colors.blue, // Color of the icon
                ),
              ),
              title: Text(
                model.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Row(
                children: [
                  Text(
                    'Rating: ${model.rating.toStringAsFixed(1)}',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                  ),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${model.distance.toStringAsFixed(1)} km',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            if (model.isVerified)
              Positioned(
                bottom: 8.0,
                right: 8.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Text(
                    'Verified',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
