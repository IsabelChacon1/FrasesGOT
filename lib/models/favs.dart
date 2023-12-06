class Favorito {
  String? frase;
  String? email;

  Favorito({this.frase, this.email});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['frase'] = this.frase;
    data['email'] = this.email;
    return data;
  }
}
