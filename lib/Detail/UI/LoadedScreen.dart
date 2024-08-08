import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subspace/Detail/bloc/details_bloc.dart';
import 'package:subspace/Model/Blog.dart';

class LoadedScreen extends StatefulWidget {
  Blog blog;
  DetailsBloc detailsBloc;
  LoadedScreen(this.blog, this.detailsBloc, {super.key});

  @override
  State<LoadedScreen> createState() => _LoadedScreenState();
}

class _LoadedScreenState extends State<LoadedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leadingWidth: 40.w,
        title: Text(
          "Subspace",
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ScreenUtilInit(
        designSize: Size(411.4, 866.3),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.blog.title,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          widget.detailsBloc.add(AddFav());
                        },
                        icon: Icon(
                          !widget.blog.isfav
                              ? Icons.favorite_border_outlined
                              : Icons.favorite,
                          color:
                              !widget.blog.isfav ? Colors.blueGrey : Colors.red,
                          size: 35.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image(
                      image: widget.blog.image == null
                          ? NetworkImage(
                              widget.blog.url,
                            )
                          : FileImage(widget.blog.image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Container(
                // padding: EdgeInsets.symmetric(
                // horizontal: 15.w,
                // ),
                // child: Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     IconButton(
                //       onPressed: () {
                //         widget.detailsBloc.add(AddFav());
                //       },
                //       icon: Icon(
                //         !widget.blog.isfav
                //             ? Icons.favorite_border_outlined
                //             : Icons.favorite,
                //         color:
                //             !widget.blog.isfav ? Colors.blueGrey : Colors.red,
                //         size: 35.sp,
                //       ),
                //     ),
                //     Container(
                //       child: Row(
                //         children: [
                //           // Icon(),
                //           InkWell(
                //             borderRadius: BorderRadius.circular(10),
                //             onTap: () {
                //               widget.detailsBloc.add(Tiwtter());
                //             },
                //             child: Container(
                //               margin: EdgeInsets.symmetric(
                //                   horizontal: 5.w, vertical: 5.h),
                //               height: 35.h,
                //               width: 35.w,
                //               decoration: const BoxDecoration(
                //                 // color: Colors.amber,
                //                 image: DecorationImage(
                //                   image: AssetImage("assets/twitter.png"),
                //                 ),
                //               ),
                //             ),
                //           ),
                //           InkWell(
                //             borderRadius: BorderRadius.circular(10),
                //             onTap: () {
                //               widget.detailsBloc.add(Instagram());
                //             },
                //             child: Container(
                //               margin: EdgeInsets.symmetric(
                //                   horizontal: 5.w, vertical: 5.h),
                //               height: 35.h,
                //               width: 35.w,
                //               decoration: const BoxDecoration(
                //                 // color: Colors.amber,
                //                 image: DecorationImage(
                //                   image: AssetImage("assets/instagram.png"),
                //                 ),
                //               ),
                //             ),
                //           ),
                //           InkWell(
                //             borderRadius: BorderRadius.circular(100),
                //             onTap: () {
                //               widget.detailsBloc.add(Facebook());
                //             },
                //             child: Container(
                //               margin: EdgeInsets.symmetric(
                //                   horizontal: 5.w, vertical: 5.h),
                //               height: 35.h,
                //               width: 35.w,
                //               decoration: const BoxDecoration(
                //                 // color: Colors.amber,
                //                 image: DecorationImage(
                //                   image: AssetImage("assets/facebook.png"),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     )
                //   ],
                // ),
                // ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    // vertical: 5.h,
                  ),
                  child: Text(
                    "In the Superflow Demo 2024 YouTube video, Joy, the co-founder of Superflow, demonstrates how to use the open-source tool to create business rules for various applications, including identifying spam messages in a WhatsApp message table. Superflow enables users to create rules with simple commands and supports over 100 data sources, including databases like PostgreSQL and data APIs like Razorpay. Users can host Superflow in their system or access it through the chat icon without signing in. The demo shows how to authenticate a user, enter credentials for a PostgreSQL database, and create a business rule that collects user information and stores it in a WhatsApp micro KYC database. Superflow also supports external data APIs, such as UK Basic, and allows users to create dashboards or tables to display data from business rules. All data generated by Superflow is in Json format and can be easily customized. The speaker announces that users will soon be able to customize and run business rules directly from their dashboards.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
