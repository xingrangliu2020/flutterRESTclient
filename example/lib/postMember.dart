import 'dart:convert';

List<Member> postFromJson(String str) =>
    List<Member>.from(json.decode(str).map((x) => Member.fromJson(x)));

class Member {

  int id;
  String member_name;
  String email_address;
  int point;
  String serviceable;
  String joined_at;

  Member(
    this.id,
    this.member_name,
    this.email_address,
    this.point,
    this.serviceable,
    this.joined_at

);

factory Member.fromJson( dynamic json)
{
  return Member(
    json["id"] as int,
    json["member_name"] as String,
    json["email_address"] as String,
    json["point"] as int,
    json["serviceable"] as String,
    json["joined_at"] as String,
  );
}
}

class Member1 {

  String id;
  String member_name;
  String email_address;
  int point;
  String serviceable;
  String joined_at;

  Member1(
      this.id,
      this.member_name,
      this.email_address,
      this.point,
      this.serviceable,
      this.joined_at

      );

  factory Member1.fromJson( dynamic json)
  {
    return Member1(
      json["id"] as String,
      json["member_name"] as String,
      json["email_address"] as String,
      json["point"] as int,
      json["serviceable"] as String,
      json["joined_at"] as String,
    );
  }
}
