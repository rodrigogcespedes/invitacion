import 'dart:convert';

import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class DropDownResponse {
  dynamic data;

  DropDownResponse({
    this.data,
  });

  String toJson() => json.encode(toMap());

  factory DropDownResponse.fromMap(
      Map<String, dynamic> json, String reference) {
    return DropDownResponse(
      data: json["data"] == []
          ? null
          : List<DropdownMenuItem<String>>.from(
              json["data"].map((x) => DropdownMenuItem<String>(
                  value: x[reference],
                  key: Key(x['id'].toString()),
                  //child: buildDropDownElement.call(x[reference]),
                  child: Text(x[reference],
                      style: DarkModeTheme().bodySmall)
                  //
                  )),
            ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data,
    };
  }
}
