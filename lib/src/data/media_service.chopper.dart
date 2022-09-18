// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$MediaService extends MediaService {
  _$MediaService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MediaService;

  @override
  Future<Response<dynamic>> postPicture(Multipart picture) {
    final $url = '/media';
    final $parts = <PartValue>[
      PartValueFile<Multipart>(
        'image',
        picture,
      )
    ];
    final $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
