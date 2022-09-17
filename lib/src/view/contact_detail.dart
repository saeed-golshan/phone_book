import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:phone_book/src/data/contact_service.dart';

class ContactDetailPage extends StatelessWidget {
  final String contactId;

  const ContactDetailPage({
    super.key,
    required this.contactId,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Response>(
        future: Provider.of<ContactService>(context).getContact(contactId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final Map contact = json.decode(snapshot.data!.bodyString);
            return Scaffold(
                appBar: AppBar(
                  title: Text('${contact['firstName']} ${contact['lastName']}'),
                ),
                body: _buildContact(contact));
          } else {
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Contact Detail'),
                ),
                body: const Center(
                  child: CircularProgressIndicator(),
                ));
          }
        });
  }

  Padding _buildContact(Map contact) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            '${contact['firstName']} ${contact['lastName']}',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(contact['phone']),
        ],
      ),
    );
  }
}
