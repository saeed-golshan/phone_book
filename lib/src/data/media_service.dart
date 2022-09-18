import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:phone_book/src/data/constant.dart';

part 'media_service.chopper.dart';

@ChopperApi(baseUrl: mediaPrefix)
abstract class MediaService extends ChopperService {
  @Post(headers: {'x-apikey': apiKey})
  @multipart
  Future<Response> postPicture(
    @PartFile('image') Multipart picture,
  );

  static MediaService create() {
    final client = ChopperClient(
        baseUrl: serverAddress,
        services: [_$MediaService()],
        converter: const JsonConverter());
    return _$MediaService(client);
  }
}
