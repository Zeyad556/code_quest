import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'certfication_cubit.dart';

class CerteficationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CertficationCubit, CertficationState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CerteficationLoading) {
          return Center(child: CircularProgressIndicator());
        }else if (state is CerteficationLoaded) {
          return Scaffold(
            backgroundColor: Color(0xFFF1EAFF),
            body: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        top: 20.0,
                      ),
                      child: Text(
                        'Your Certefications',
                        style: TextStyle(
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0.h),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.Certefication.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Container(
                                width: 340.w,
                                height: 160.h,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 6,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    // Creates space for the floating image
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                        top: 20,
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional.only(
                                              bottom: 40,
                                              start: 25,
                                            ),
                                            child: Text(
                                              state.Certefication[index].courseTitle,
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Image.asset(
                                            'assets/images/certified_logo.png',
                                            width: 100.w,
                                            height: 100.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsetsDirectional.only(
                                    //     end: 40,
                                    //   ),
                                    //   child: Container(
                                    //     width: 200.w,
                                    //     height: 40.h,
                                    //     child: ElevatedButton(
                                    //       onPressed: () {},
                                    //       style: ElevatedButton.styleFrom(
                                    //         backgroundColor: Colors.grey[300],
                                    //         shadowColor: Colors.transparent,
                                    //         shape: RoundedRectangleBorder(
                                    //           borderRadius: BorderRadius.circular(20),
                                    //         ),
                                    //       ),
                                    //       child: Text(
                                    //         'Show',
                                    //         style: TextStyle(
                                    //           color: Colors.deepPurple,
                                    //           fontSize: 20.0.sp,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return Container();
        print(state);

      },
    );
  }
}
