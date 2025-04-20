import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizesScreen extends StatefulWidget {
  @override
  State<QuizesScreen> createState() => _QuizesScreenState();
}

class _QuizesScreenState extends State<QuizesScreen> {
  List<String> answers = ['A) 1991', 'B) 1985', 'C) 1993', 'D) 1999'];
  String? selectedAnswer;
  String text = "Python is a popular programming language.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity.w,
                height: 100.h,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(40),
                  ),
                  border: Border.all(color: Colors.black, width: 1.2.w),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 40),
                  child: Center(
                    child: Text(
                      "Python . Introduction",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Center(
                child: Container(
                  width: 350.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Solve",
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              text.isNotEmpty
                  ? Center(
                    child: Container(
                      width: 350.w,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          text,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                  : SizedBox.shrink(),
              SizedBox(height: 20.h),
              ListView.builder(
                shrinkWrap:
                    true, // Allows ListView to take only necessary space
                physics: NeverScrollableScrollPhysics(), // Prevent scrolling
                itemCount: answers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: RadioListTile<String>(
                      value: answers[index],
                      groupValue: selectedAnswer,
                      onChanged: (String? value) {
                        setState(() {
                          selectedAnswer = value;
                        });
                      },
                      title: Text(
                        answers[index],
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color:
                              selectedAnswer == answers[index]
                                  ? Colors.black
                                  : Colors.white,
                        ),
                      ),
                      activeColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      tileColor:
                          selectedAnswer == answers[index]
                              ? Color.fromARGB(200, 65, 8, 70)
                              : Colors.deepPurple,
                      //9C27B0FF
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: -20,
                      ),
                    ),
                  );
                },
              ), // To avoid overlap with bottomNavigationBar
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 40,
          horizontal: 110,
        ),
        child: SizedBox(
          height: 40.h,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Submit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
          ),
        ),
      ),
    );
  }
}
