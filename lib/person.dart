

class Person {
  
  String? nome;
  String? apartamento;
  String? telefone;
  String? email;
  String? id;
  
  Person({
     this.nome,
     this.apartamento,
     this.telefone,
     this.email,
     this.id,
      });

  Person.fromJson(Map<String, dynamic> json) {
  
    nome = json['nome'];
    apartamento = json['apartamento'];
    telefone = json['telefone'];
    email = json['email'];
     id = json['id'];
     
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    
    data['nome'] = this.nome;
    data['apartamento'] = this.apartamento;
    data['telefone'] = this.telefone;
    data['email'] = this.email;
    data['id'] = this.id;
    
    return data;
  }

}