// ignore_for_file: public_member_api_docs, sort_constructors_first

class Massage {
  final String massage;
  final String id;
  Massage(
     this.massage, this.id,
  );

  factory Massage.fromJson(jsonData){
    return Massage(jsonData!['massage'],jsonData!['id'],);
  }
}
