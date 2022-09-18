// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ContactService extends ContactService {
  _$ContactService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ContactService;

  @override
  Future<Response<dynamic>> getContacts() {
    final $url = '/rest/contacts';
    final $headers = {
      'x-apikey': '660094b3fb56a22799b1bfdeb87a2cfce1a02',
    };

    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getContact(String id) {
    final $url = '/rest/contacts/${id}';
    final $headers = {
      'x-apikey': '660094b3fb56a22799b1bfdeb87a2cfce1a02',
    };

    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> putContact(String id) {
    final $url = '/rest/contacts/${id}';
    final $headers = {
      'x-apikey': '660094b3fb56a22799b1bfdeb87a2cfce1a02',
    };

    final $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteContact(String id) {
    final $url = '/rest/contacts/${id}';
    final $headers = {
      'x-apikey': '660094b3fb56a22799b1bfdeb87a2cfce1a02',
    };

    final $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> postContact(Map<String, dynamic> body) {
    final $url = '/rest/contacts';
    final $headers = {
      'x-apikey': '660094b3fb56a22799b1bfdeb87a2cfce1a02',
    };

    final $body = body;
    final $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
