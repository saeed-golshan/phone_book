import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:phone_book/src/data/constant.dart';
// import 'package:phone_book/src/model/contact.dart';

part 'contact_service.chopper.dart';

@ChopperApi(baseUrl: '/contacts')
abstract class ContactService extends ChopperService {
  @Get(headers: {'x-apikey': apiKey})
  Future<Response> getContacts();

  @Get(path: '/{id}', headers: {'x-apikey': apiKey})
  Future<Response> getContact(@Path('id') String id);

  @Put(path: '/{id}', headers: {'x-apikey': apiKey})
  Future<Response> putContact(@Path('id') String id);

  @Delete(path: '/{id}', headers: {'x-apikey': apiKey})
  Future<Response> deleteContact(@Path('id') String id);

  @Post(headers: {'x-apikey': apiKey})
  Future<Response> postContact(@Body() Map<String, dynamic> body);

  static ContactService create() {
    final client = ChopperClient(
        baseUrl: 'https://contacts-df29.restdb.io/rest',
        services: [_$ContactService()],
        converter: const JsonConverter());
    return _$ContactService(client);
  }
}
