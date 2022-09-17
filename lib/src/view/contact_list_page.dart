import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';
import 'package:phone_book/src/data/contact_service.dart';

import 'contact_detail.dart';

class ContatcListPage extends StatelessWidget {
  const ContatcListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phone Book')),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          Map<String, dynamic> contact = {
            "firstName": "Nare",
            "lastName": "Vardanyan",
            "email": "nare@st-dev.com",
            "notes": "Project Manager",
            "picture": [
              "https://api.st-dev.com/media/team/890b1708-2a8f-40c9-ac10-52e98ef3bda8.png"
            ],
            "phone": "+9991234567"
          };
          final response = Provider.of<ContactService>(context, listen: false)
              .postContact(contact);
          // print(response.body);
        },
      ),
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {
    return FutureBuilder<Response>(
      future: Provider.of<ContactService>(context).getContacts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List contacts = json.decode(snapshot.data!.bodyString);
          return _buildContacts(context, contacts);
        } else {
          // Show a loading indicator while waiting for the contacts
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildContacts(BuildContext context, List contacts) {
    return ListView.builder(
      itemCount: contacts.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage("${contacts[index]['picture'][0]}"),
              backgroundColor: Colors.transparent,
            ),
            title: Text(
              '${contacts[index]['firstName']} ${contacts[index]['lastName']}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(contacts[index]['phone']),
            onTap: () => _navigateToPost(context, contacts[index]['_id']),
          ),
        );
      },
    );
  }

  void _navigateToPost(BuildContext context, String id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContactDetailPage(contactId: id),
      ),
    );
  }
}
