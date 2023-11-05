class User{
  int Id;
  String name;
  String email;
  String password;

  User(this.Id, this.name, this.email, this.password);
  factory User.fromJson(dynamic json) =>
      User(int.parse(json['id']), json['Name'] as String, json['Email'] as String, json['Password'] as String);
  Map<String,dynamic> toJson() =>
      {
        'id': Id.toString(),
        'Name': name,
        'Email': email,
        'Password': password,
      };
}