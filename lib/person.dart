

class Person {
  String nome;
  String apartamento;
  String telefone;
  String email;
  String senha;
  String id;
  Person({
      required this.id,
      required this.nome,
      required this.apartamento,
      required this.telefone,
      required this.email,
      required this.senha});

  factory Person.fromJson(Map<String, dynamic> json) {
   return Person (
    id : json['id'],
    nome : json['nome'],
    apartamento : json['apartamento'],
    telefone : json['telefone'],
    email : json['email'],
    senha : json['senha'],
   );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['apartamento'] = this.apartamento;
    data['telefone'] = this.telefone;
    data['email'] = this.email;
    data['senha'] = this.senha;
    return data;
  }

}