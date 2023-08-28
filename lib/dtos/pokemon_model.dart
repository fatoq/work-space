//info asociada obtendia al servicio rest
class Pokemon{
  int id;
  String name;
  String imageUrl;

      Pokemon({
        required this.id,
        required this.name,
        required this.imageUrl,
      });

  factory Pokemon.fromJson(Map<String, dynamic>json){   //indica q el motodo va hacer un constructo de un metodo
    return Pokemon(
      id: json['id'], //tdo esto se lo puede poner directa,emte em el provider 
     name: json['name'],
      imageUrl: json['sprites']['front_default'],
    );
  }

  factory Pokemon.fromFirebaseJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, Object?> toJson() =>{
    'id': id, 
    'name': name, 
    'imageUrl': imageUrl
    };
}
