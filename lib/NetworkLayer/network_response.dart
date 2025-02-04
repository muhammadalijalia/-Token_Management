import 'package:freezed_annotation/freezed_annotation.dart';
part 'network_response.freezed.dart';
@freezed
class NetworkResponse with _$NetworkResponse {
  const factory NetworkResponse.success(Map<String, dynamic> data) = OK;
  const factory NetworkResponse.successList(List data) = OKK;
  const factory NetworkResponse.error(String message)= ERROR;
  const factory NetworkResponse.loading(String message)= LOADING;
}