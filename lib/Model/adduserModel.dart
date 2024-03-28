class adduserModel {
  String name;
  String  emailCondroller;
  String password;

  adduserModel({
    /// add to fire base
    required this.name,
    required this.emailCondroller,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    ///add map to fire base
    ///
    return {
      "name": name,
      "email": emailCondroller,
      "password": password,
    };
  }

  factory adduserModel.fromMap(Map<String, dynamic> map) {
    ///factory to get data form firbase(to create the index and update index in fire base
    ///user model to trns fire base from map


    return adduserModel(
      name: map['name'] as String,
      emailCondroller: map['name']as String,
      password: map['uld'] as String,
    );
  }
  adduserModel copyWith({
    String? name,
    String?emailCondroller,
    String? password,



  }){
    return adduserModel(name: name??this.name,emailCondroller: emailCondroller??this.emailCondroller,password: password?? this.password);
  }
}
