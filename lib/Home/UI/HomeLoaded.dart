import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subspace/Home/bloc/home_bloc.dart';

class HomeLoaded extends StatefulWidget {
  final HomeLoadedstate state;
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
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ScreenUtilInit(
        designSize: Size(411.4, 866.3),
        child: Container(
          margin: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: widget.state.blogs.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  widget.homeBloc.add(HomeNavEvent(widget.state.blogs[index]));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  // height: 350.h,
                  padding: EdgeInsets.only(
                    bottom: 15.h,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.blueGrey.shade100),
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 220.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                          // color: Colors.amber,
                          image: DecorationImage(
                              image: NetworkImage(
                                widget.state.blogs[index].url,
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: Text(
                          widget.state.blogs[index].title,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
