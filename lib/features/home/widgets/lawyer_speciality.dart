import 'package:flutter/material.dart';

class LawyerSpecialtyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final specialties = [
      'Civil',
      'Criminal',
      'Divorce',
      'Family',
      'Corporate',
      'Notary',
      'More',
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Lawyer Specialties', style: Theme.of(context).textTheme.headline6),
          SizedBox(height: 8.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: specialties.map((specialty) {
              return Chip(
                label: Text(specialty),
                backgroundColor: Colors.blue.shade100,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
