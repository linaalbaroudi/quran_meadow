import 'package:flutter/material.dart';
import 'package:quran_meadows/app_theme.dart';
import '../widgets/circle_image.dart';
import '../models/user.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(133,78,155,1),
        image: DecorationImage(
          image: AssetImage('assets/morocco-tiles-background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          CircleImage(imageUrl: User.sample.imageUrl,),
          const SizedBox(height: 50),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                  ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey))),
                        child: Column(
                          children: [
                            Text(
                                'Student Name',
                              style: AppTheme.lightTextTheme.headline6
                            ),
                            Text(
                                'Lina Albaroudi',
                                style: AppTheme.lightTextTheme.subtitle1
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      // Text(
                      //   "Forgot Password?",
                      //   style: TextStyle(color: Colors.grey),
                      // ),
                      // SizedBox(
                      //   height: 40,
                      // ),
                      // Container(
                      //   height: 50,
                      //   margin: EdgeInsets.symmetric(horizontal: 50),
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(50),
                      //       color: Colors.orange[900]),
                      //   child: Center(
                      //     child: Text(
                      //       "Login",
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 50,
                      // ),
                      // Text(
                      //   "Continue with social media",
                      //   style: TextStyle(color: Colors.grey),
                      // ),
                      // SizedBox(
                      //   height: 30,
                      // ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue),
                              child: const Center(
                                child: Text(
                                  "Facebook",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.black),
                              child: const Center(
                                child: Text(
                                  "Github",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
