import 'dart:convert';

import 'package:example/Members.dart';
import 'package:example/postMember.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_client/rest_api_client.dart';
import 'package:http/http.dart' as http;
//import 'NetworkResult.dart';

Future main() async {

  List<Member> members;
  var theMember;
  var updateResponse;
  var createResponse;
  var deleteResponse;
  var testing;
  var testing1;
  var status;


  WidgetsFlutterBinding.ensureInitialized();
  //This must be called once per application lifetime
  await RestApiClient.initFlutter();


  IRestApiClient restApiClient = RestApiClient(
    options: RestApiClientOptions(
      //Defines your base API url eg. https://mybestrestapi.com
      baseUrl: 'http://10.2.11.142:8080',

      //Enable caching of response data
      cacheEnabled: true,
    ),
/*    authOptions: AuthOptions(
      //Define refresh token endpoint for RestApiClient
      //instance to use the first time response status code is 401
      refreshTokenEndpoint: '/auth/token-refresh',

      //Define the name of your api parameter name
      //on RefreshToken endpoint eg. 'refreshToken' or 'value' ...
      refreshTokenParameterName: 'token',

      //This method is called on successfull call to refreshTokenEndpoint
      //Provides a way to get a jwt from response, much like
      //resolveValidationErrorsMap callback
      resolveJwt: (response) => response.data['result']['accessToken']['token'],

      //Much like resolveJwt, this method is used to resolve
      //refresh token from response
      resolveRefreshToken: (response) =>
          response.data['result']['refreshToken']['token'],
    ),*/
/*    loggingOptions: LoggingOptions(
      //Toggle logging of your requests and responses
      //to the console while debugging
      logNetworkTraffic: true,
    ),*/
  );

  //init must be called, preferably right after the instantiation
  await restApiClient.init();

  //Use restApiClient from this point on

  //If you are using authentication in you app
  //probably it would look like this
/*  final response = await restApiClient.post(
    '/Authentication/Authenticate',
    data: {'username': 'john', 'password': 'Flutter_is_awesome1!'},
  );

  //Extract the values from response
  var jwt = response.data['jwt'];
  var refreshToken = response.data['refreshToken'];

  //Let's asume that somehow we got jwt and refresh token
  //Probably pinged our api Authentication endpoint to get these two values
  jwt =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwiZmx1dHRlciI6IkZsdXR0ZXIgaXMgYXdlc29tZSIsImNoYWxsZW5nZSI6IllvdSBtYWRlIGl0LCB5b3UgY3JhY2tlZCB0aGUgY29kZS4gWW91J3JlIGF3ZXNvbWUgdG9vLiIsImlhdCI6MTUxNjIzOTAyMn0.5QJz8hhxYsHxShS4hWKdHzcFH_IsQQZAnWSEcHJkspE';
  refreshToken = 'c91c03ea6c46a86cbc019be3d71d0a1a';

  //set the authorization
  restApiClient.authHandler.authorize(jwt: jwt, refreshToken: refreshToken);*/

  //Create authorized requests safely
  final response =
  await http.get(Uri.parse('http://10.2.11.142:8080/NewPhpProject/api/read.php'));
  if(response.statusCode==200){
    final parsed = json.decode(response.body);
    //final parsed1 = json.decode(response.body);
    Members memberList=Members.fromMap(parsed);

    var membersString=memberList.collectName as List;
    //var membersJson=jsonDecode(parsed)['body'] as List;
    List<Member> allMemebers=membersString.map((itemJson)=>Member.fromJson(itemJson)).toList();

  }
  else{
    throw Exception('Failed to load data');
  }
  //Ignore server errors that might happen in the next request
  restApiClient.exceptionHandler.exceptionOptions.showInternalServerErrors =
      false;

  try {
    theMember= await restApiClient.post(
      '/NewPhpProject/api/single_read.php',
      //queryParameters: {'id': 7},
        data:{"id":5,"member_name":"Peter Wang","email_address":"JackLondon@bsg.com.au","point":220,"serviceable":"admin1"},
    );
  } catch (e) {
    print(e);
  }
  String data=' {"id":20,"member_name":"Xingrang147369","email_address":"xingrangl@bsg.com.au","point":320,"serviceable":"Developer","joined_at":"2018"}';

  //final theParsed=jsonDecode(theMember.data);
  Member aMember=   Member.fromJson(jsonDecode(data));

  testing=jsonEncode(theMember.data);
  String data1=' {"id":"10","member_name":"Xingrang147369","email_address":"xingrangl@bsg.com.au","point":320,"serviceable":"Developer","joined_at":"2018"}';
  testing1=data1;

  if(theMember.data!=null){
    testing=jsonEncode(theMember.data);
    Member1 aMember1=   Member1.fromJson(jsonDecode(testing));
  }


  //Ignore all exceptions that might happen in the next request
  restApiClient.exceptionHandler.exceptionOptions.disable();

  updateResponse= await restApiClient.post(
    '/NewPhpProject/api/update.php',
    data: {"id":"10","member_name":"Xingrang147369","email_address":"xingrangl@bsg.com.au","point":"320","serviceable":"Developer","joined_at":"2018"},
  );
  var networkResult1 = updateResponse;

  //final Map parsedMap = json.decode(updateResponse);

  //status=jsonDecode(updateResponse);
   testing =updateResponse;
/*  restApiClient.put(
    '/Products/Reviews/234',
    data: {
      'grade': 5,
      'comment': 'On the other hand throwing dartz is fun',
    },
  );*/

  //restApiClient.delete('/Products/Reviews/234');
  testing =updateResponse.data;

  //codes added on 2022-07-20
  //Ignore server errors that might happen in the next request
  restApiClient.exceptionHandler.exceptionOptions.showInternalServerErrors =
  false;
  restApiClient.exceptionHandler.exceptionOptions.disable();

  try {
    createResponse= await restApiClient.post(
      '/NewPhpProject/api/create.php',
      data: {"member_name":"Bill wang","email_address":"billLi@bsg.com.au","point":"530","serviceable":"admin3"},
    );
  } catch (e) {
    print(e);
  }
  testing=createResponse;
  restApiClient.exceptionHandler.exceptionOptions.disable();
  testing =updateResponse;
  testing =createResponse;

  restApiClient.exceptionHandler.exceptionOptions.showInternalServerErrors =
  false;

  try {
    deleteResponse= await restApiClient.post(
      '/NewPhpProject/api/delete.php',
      data: {"id": 5,"member_name":"Bill wang","email_address":"billLi@bsg.com.au","point":"530","serviceable":"admin3"},
    );
  } catch (e) {
    print(e);
  }
  testing=deleteResponse.data;
  restApiClient.exceptionHandler.exceptionOptions.disable();
}
