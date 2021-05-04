import 'dart:convert';

class Expert {
  final int expertId;
  final String expertName;
  final String key;
  final String expertLogo;
  final String url;

  Expert({this.expertId, this.expertName, this.key, this.expertLogo, this.url});

  Expert fromMap(Map<String, dynamic> map) {
    return Expert(
        expertId: map['expert_id'],
        expertName: map['expert_name'],
        key: map['key'],
        expertLogo: map['expert_logo'],
        url: map['url']);
  }

  Expert fromJson(String jsonString) {
    Map<String, dynamic> map = jsonDecode(jsonString);
    return fromMap(map);
  }

  String toStringJson() {
    return '{"expert_id": ${this.expertId}, "expert_name": "${this.expertName}", "key": "${this.key}", "expert_logo": "${this.expertLogo}", "url": "${this.url}"}';
  }
}
