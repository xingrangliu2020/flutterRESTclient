import 'package:example/postMember.dart';

class Members {
  Members({required this.collectName});

  var collectName;

  factory Members.fromMap(Map<String, dynamic> json)
  {
     var collectName= json["body"] ;

    return Members(
        collectName: collectName
    );
  }
}