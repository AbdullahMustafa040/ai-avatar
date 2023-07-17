import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CreateAFineTuneCall {
  static Future<ApiCallResponse> call({
    String? title = '',
    String? name = '',
    List<String>? imageUrlsList,
    int? steps,
  }) {
    final imageUrls = _serializeList(imageUrlsList);

    final body = '''
{
  "tune": {
    "callback": "https://us-central1-aiavatar-947dc.cloudfunctions.net/tune_callback",
    "title": "${title}",
    "name": "${name}",
    "branch": "sd15",
    "image_urls": ${imageUrls},
    "steps": ${steps}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createAFineTune',
      apiUrl: 'https://api.astria.ai/tunes',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer sd_NBeuFSXY3FpHofxBpc3mQSckK8wkWP',
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreaatePromptCall {
  static Future<ApiCallResponse> call({
    String? tuneId = '',
    String? text = '',
    bool? faceCorrect,
    String? controlNetImageUrl = '',
    String? negativePrompt = '',
    String? controlnetHint = '',
    double? seed,
    double? cfgScale,
    int? steps,
  }) {
    final body = '''
{
  "prompt": {
    "text": "${text}",
    "callback": "https://us-central1-aiavatar-947dc.cloudfunctions.net/prompt_callback",
    "num_images": 4,
    "face_correct": ${faceCorrect},
    "input_image_url": "${controlNetImageUrl}",
    "negative_prompt": "${negativePrompt}",
    "controlnet": "${controlnetHint}",
    "seed": ${seed},
    "cfg_scale": ${cfgScale},
    "steps": ${steps}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreaatePrompt',
      apiUrl: 'https://api.astria.ai/tunes/${tuneId}/prompts',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer sd_NBeuFSXY3FpHofxBpc3mQSckK8wkWP',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PaymobCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? amount,
    String? orderId = '',
    String? profileId = '',
    String? firstName = '',
    String? lastName = '',
    String? phone = '',
    String? email = '',
    int? integrationId,
    String? type = '',
    String? transactionType = '',
    int? noOfAvatar,
  }) {
    final body = '''
{
  "auth_token": "${authToken}",
  "amount": ${amount},
  "type": "${type}",
  "order_id": "${orderId}",
  "iframe_id": 99735,
  "transaction_type": "${transactionType}",
  "avatars": ${noOfAvatar},
  "payor_info": {
    "id": "${profileId}",
    "first_name": "${firstName}",
    "last_name": "${lastName}",
    "email": "${email}",
    "phone_number": "${phone}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Paymob',
      apiUrl:
          'https://asia-southeast1-aiavatar-947dc.cloudfunctions.net/paymob_test',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic iframeUrl(dynamic response) => getJsonField(
        response,
        r'''$.url''',
      );
}

class TwilioSendSMSCall {
  static Future<ApiCallResponse> call({
    String? to = '',
    String? body = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Twilio Send SMS',
      apiUrl:
          'https://api.twilio.com/2010-04-01/Accounts/ACb983a299f930533770a6257432d185f8exclude/Messages.json',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic QUNiOTgzYTI5OWY5MzA1MzM3NzBhNjI1NzQzMmQxODVmODpiN2NlYWFjMWNjNWIzNzQzYTE1NzdlYWQwNmU4YTliNQ==',
      },
      params: {
        'To': to,
        'Body': body,
        'From': "+15677071749",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
