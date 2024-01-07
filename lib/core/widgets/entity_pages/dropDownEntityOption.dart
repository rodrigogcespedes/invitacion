import 'dart:convert';

@Deprecated('this class has been and substituted byDropdownMenuItem<String>')
class DropDownEntityOption {
  String? id;
  String? reference;

  DropDownEntityOption({
    this.id,
    this.reference,
  });

  DropDownEntityOption copyWith({
    String? id,
    String? reference,
  }) =>
      DropDownEntityOption(
        id: id ?? this.id,
        reference: reference ?? this.reference,
      );

  String toJson() => json.encode(toMap());

  factory DropDownEntityOption.fromMap(
          Map<String, dynamic> json, String referenceName) =>
      DropDownEntityOption(
        id: json["id"],
        reference: json[referenceName],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "reference": reference,
      };
}
