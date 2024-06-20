import 'dart:convert';
import 'dart:developer';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:http/http.dart' as http;
import 'package:ksb/core/helpers/dio_helpers/dio_helpers.dart';

class ApiServices {
  Future<String> sendPostRequest(String message) async 
  {
    final model = GenerativeModel(model: "gemini-1.5-flash", apiKey: 'AIzaSyB_ZnVsOGDChmx59CCOBoUPup_LET57nd4');


    try {
      // final response = await DioHelper.postData(
      //     url: url, data: body,
      //     headers: headers 

      // );
      GenerateContentResponse  response = await model.generateContent([
  Content.text(message),
  // Content.data("image/png", imageBytes),
]);
print(response.candidates[0].content.parts[0].toJson());
return response.candidates[0].content.parts[0].toJson().toString();
      // if (response.statusCode == 200) {
      //   final res = response; // Return the plain text response
      //   final text =  res["candidates"][0]["content"]["parts"][0]["text"];
      //   return text.toString();

      // } else {
      //   return 'Request failed with status: ${response.statusCode}';
      // }
    } catch (e) {
      // log(e.toString());
      return 'Error occurred: $e';
    }
  }
}