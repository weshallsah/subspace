import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subspace/Home/bloc/home_bloc.dart';
import 'package:subspace/Model/Blog.dart';

class HomeLoaded extends StatefulWidget {
  final state;
  final HomeBloc homeBloc;
  HomeLoaded(this.state, this.homeBloc, {super.key});

  @override
  State<HomeLoaded> createState() => _HomeLoadedState();
}

class _HomeLoadedState extends State<HomeLoaded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Subspace",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ScreenUtilInit(
        designSize: Size(411.4, 866.3),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: widget.state.blogs.length > 0
              ? ListView.builder(
                  itemCount: widget.state.blogs.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          widget.homeBloc.add(HomeNavEvent(
                            widget.state.blogs[index],
                            () {
                              setState(() {});
                            },
                          ));
                        },
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                            vertical: 5.h,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(0),
                                margin: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  color: Colors.teal.shade50,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.r),
                                  child: Image(
                                    image: widget.state.blogs[index].image ==
                                            null
                                        ? NetworkImage(
                                            widget.state.blogs[index].url,
                                          )
                                        : FileImage(
                                            widget.state.blogs[index].image!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  widget.state.blogs[index].title,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 25,
                                          padding: EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(50.r),
                                          ),
                                          child: Image(
                                            image: AssetImage(
                                                'assets/twitter.png'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text("Username .24h"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            widget.homeBloc.add(AddFavEvent(
                                                widget.state.blogs[index]));
                                          },
                                          icon: Icon(
                                            widget.state.blogs[index].isfav
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color:
                                                widget.state.blogs[index].isfav
                                                    ? Colors.redAccent
                                                    : null,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.share,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                )
              : Center(
                  child: Text(
                    "No Blogs are Here",
                    style: TextStyle(
                      fontSize: 24.sp,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
// Container(
//                         margin: EdgeInsets.symmetric(vertical: 5.h),
//                         // height: 350.h,
//                         padding: EdgeInsets.only(
//                           bottom: 15.h,
//                         ),
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20.r),
//                             color: Colors.blueGrey.shade100),
//                         // color: Colors.amber,
//                         child: Column(
//                           children: [
//                             Container(
//                               width: double.infinity,
//                               height: 220.h,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(20.r),
//                                   topRight: Radius.circular(20.r),
//                                 ),
//                                 // color: Colors.amber,
//                                 image: DecorationImage(
//                                     image: widget.state.blogs[index].image ==
//                                             null
//                                         ? NetworkImage(
//                                             widget.state.blogs[index].url,
//                                           )
//                                         : FileImage(
//                                             widget.state.blogs[index].image),
//                                     fit: BoxFit.cover),
//                               ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 10.w,
//                               ),
//                               child: Text(
//                                 widget.state.blogs[index].title,
//                                 textAlign: TextAlign.start,
//                                 style: TextStyle(
//                                   fontSize: 24.sp,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "Poppins",
//                                   letterSpacing: 0,
//                                   wordSpacing: 0,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),