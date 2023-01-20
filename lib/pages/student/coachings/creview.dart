import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';

class Review extends StatefulWidget {
  Review({Key? key}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final _formKey = GlobalKey<FormState>();

  var cname = "";
  var review = "";
  var stars = "";
  var username = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final cnameController = TextEditingController();
  final reviewController = TextEditingController();
  final starsController = TextEditingController();
  final userController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    cnameController.dispose();
    reviewController.dispose();
    starsController.dispose();
    userController.dispose();
    super.dispose();
  }

  clearText() {
    cnameController.clear();
    reviewController.clear();
    starsController.clear();
    userController.clear();
  }

  // Adding Student
  CollectionReference students =
      FirebaseFirestore.instance.collection('coachingreview');

  Future<void> addUser() {
    return students
        .add({
          'cname': cname,
          'review': review,
          'stars': stars,
          'username': username
        })
        .then((value) => print('Review Added'))
        .catchError((error) => print('Failed to Review user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              RatingBar(
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
                onRatingChanged: (value) {
                  starsController.text = value.toString();
                  // print(stars);
                },
                initialRating: 3,
                filledColor: const Color.fromARGB(255, 255, 0, 0),
                maxRating: 10,
                alignment: Alignment.center,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: 'Coaching Name: ',
                    labelStyle: TextStyle(fontSize: 15.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: cnameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Coaching Name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: 'Review: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: reviewController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Review';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: 'Stars: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: starsController,
                  // validator: (stars) {
                  //   if (stars == null || stars.isEmpty) {
                  //     return 'Please Enter stars';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: 'Username: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: userController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter user';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            cname = cnameController.text;
                            review = reviewController.text;
                            stars = starsController.text;
                            username = userController.text;
                            addUser();
                            clearText();
                          });
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
