import 'dart:async';
import 'dart:convert';

import 'package:app_toxicidade/widgets/paciente/paciente.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_toxicidade/widgets/authenticate/login.dart';

Future<http.Response> selectLogin() {
  const url = 'http://18.229.15.89/nexo/toxicidade/paciente';

  return http.get(Uri.parse(url));
}
