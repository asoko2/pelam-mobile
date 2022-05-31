import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class API {
  final String _url = 'http://10.0.2.2:3333/';
  var storage = const FlutterSecureStorage();

  var token;

  _getToken() async {
    token = await storage.read(key: 'token');
  }

  checkLoggedIn() async {
    Uri url = Uri.parse('${_url}auth/check');
    await _getToken();
    var res = await http.get(url, headers: _setHeaders());
    var body = jsonDecode(res.body);
    return body;
  }

  auth(String username, String password) async {
    Uri fullUrl = Uri.parse('${_url}auth/login');
    var res = await http.post(fullUrl,
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
        headers: _setHeaders());

    var body = jsonDecode(res.body);
    await storage.write(key: 'token', value: body['data']['token']);

    return body;
  }

  register(data) async {
    Uri fullUrl = Uri.parse('${_url}auth/register');
    var res = await http.post(fullUrl,
        body: jsonEncode({
          'username': data['username'],
          'password': data['password'],
          'nama': data['nama'],
          'nik': data['nik'],
          'level': 4,
        }),
        headers: _setHeaders());

    var body = jsonDecode(res.body);
    return body;
  }

  updateUser(data) async {
    Uri fullUrl = Uri.parse('${_url}pemohon/${data['nik']}');
    await _getToken();
    var res =
        await http.put(fullUrl, body: jsonEncode(data), headers: _setHeaders());

    if (res.statusCode == 200) {
      return res.statusCode;
    } else {
      return jsonDecode(res.body);
    }
  }

  getSurat(nik) async {
    Uri fullUrl = Uri.parse('${_url}pemohon/getSurat/$nik');
    await _getToken();
    var res = await http.get(fullUrl, headers: _setHeaders());
    var body = jsonDecode(res.body);
    return body;
  }

  uploadSurat(data, apiURL) async {
    Uri fullUrl = Uri.parse(_url + apiURL);
    await _getToken();
    var res = await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
    return res;
  }

  getData(apiURL) async {
    Uri fullUrl = Uri.parse(_url + apiURL);
    await _getToken();
    var res = await http.get(
      fullUrl,
      headers: _setHeaders(),
    );

    var body = jsonDecode(res.body);
    return body;
  }

  getPemohonData(id) async {
    Uri url = Uri.parse('${_url}pemohon/byId/$id');
    await _getToken();
    var res = await http.get(
      url,
      headers: _setHeaders(),
    );

    var body = jsonDecode(res.body);
    return body;
  }

  uploadKK(file, String nik) async {
    await _getToken();
    print(nik);
    var request =
        http.MultipartRequest('POST', Uri.parse('${_url}pemohon/upload-kk'));
    print(request.url);
    request.headers['Content-type'] = 'application/json';
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['nik'] = nik;
    request.files.add(await http.MultipartFile.fromPath('file_kk', file));
    var response = await request.send();
    print(response.statusCode);
    return response.statusCode;
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
      };
}
