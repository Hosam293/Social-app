class UserModel
{
  String? email;
  String? phone;
  String? name;
  String? uId;
  String? cover;
  String? bio;
  String? image;

  UserModel({this.email, this.phone, this.name, this.uId,this.bio,this.cover,this.image});

  UserModel.fromJson(dynamic json)
  {
    email=json['email'];
    phone=json['phone'];
    name=json['name'];
    uId=json['uId'];
    cover=json['cover'];
    bio=json['bio'];
    image=json['image'];
  }
 Map<String,dynamic> toMap()
  {
    return {
      'email':email,
      'uId':uId,
      'name':name,
      'phone':phone,
      'image':image,
      'bio':bio,
      'cover':cover,
    };
  }
}