import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String bio;
  final String email;
  final String uid;
  final String photoUrl;
  final List followers;
  final List following;

  const User({
    required this.username,
    required this.bio,
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'bio': bio,
        'email': email,
        'uid': uid,
        'followers': [],
        'following': [],
        'photoUrl': photoUrl,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot['username'],
      bio: snapshot['bio'],
      email: snapshot['email'],
      uid: snapshot['uid'],
      photoUrl: snapshot['photoUrl'],
      followers: snapshot['followers'],
      following: snapshot['following'],
    );
  }
}
