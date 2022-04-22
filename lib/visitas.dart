class Visitas {
  String? nome;
  String? data;
  String? id;

  Visitas({this.nome, this.data, this.id});

  Visitas.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    data = json['data'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['data'] = this.data;
    data['id'] = this.id;
    return data;
  }
}