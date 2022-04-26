// To parse this JSON data, do
//
//     final userRole = userRoleFromJson(jsonString);

import 'dart:convert';

List<UserRole> userRoleFromJson(String str) => List<UserRole>.from(json.decode(str).map((x) => UserRole.fromJson(x)));

String userRoleToJson(List<UserRole> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserRole {
  UserRole({
    required this.urcverelacion,
    required this.urcvepersonafk,
    required this.urcverolefk,
    required this.role,
    required this.person,
  });

  int urcverelacion;
  String urcvepersonafk;
  int urcverolefk;
  Role role;
  Person person;

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
    urcverelacion: json["urcverelacion"],
    urcvepersonafk: json["urcvepersonafk"],
    urcverolefk: json["urcverolefk"],
    role: Role.fromJson(json["role"]),
    person: Person.fromJson(json["person"]),
  );

  Map<String, dynamic> toJson() => {
    "urcverelacion": urcverelacion,
    "urcvepersonafk": urcvepersonafk,
    "urcverolefk": urcverolefk,
    "role": role.toJson(),
    "person": person.toJson(),
  };
}

class Person {
  Person({
    required this.pcvepersona,
    required this.pnombre,
   required this.pcorreo,
    required this.ppassword,
  });

  String pcvepersona;
  String pnombre;
  String pcorreo;
  String ppassword;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    pcvepersona: json["pcvepersona"],
    pnombre: json["pnombre"],
    pcorreo: json["pcorreo"],
    ppassword: json["ppassword"],
  );

  Map<String, dynamic> toJson() => {
    "pcvepersona": pcvepersona,
    "pnombre": pnombre,
    "pcorreo": pcorreo,
    "ppassword": ppassword,
  };
}

class Role {
  Role({
   required this.rcverole,
   required this.rdescripcion,
  });

  int rcverole;
  String rdescripcion;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    rcverole: json["rcverole"],
    rdescripcion: json["rdescripcion"],
  );

  Map<String, dynamic> toJson() => {
    "rcverole": rcverole,
    "rdescripcion": rdescripcion,
  };
}
