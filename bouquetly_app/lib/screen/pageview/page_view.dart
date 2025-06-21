import 'package:bouquetly_app/extension/app_size.dart';
import 'package:bouquetly_app/screen/pageview/bloc/pageview_bloc.dart';
import 'package:bouquetly_app/screen/pageview/page_view_one.dart';
import 'package:bouquetly_app/screen/pageview/page_view_three.dart';
import 'package:bouquetly_app/screen/pageview/page_view_two.dart';
import 'package:bouquetly_app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewBasic extends StatelessWidget {
  const PageViewBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageviewBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<PageviewBloc>();
          int currentPage = 0;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.darkBeige,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            body: BlocBuilder<PageviewBloc, PageviewState>(
              builder: (context, state) {
                if (state is PageviewInitial) currentPage = state.currentPage;
                return Column(
                  children: [
                    SizedBox(
                      height: context.getHight() * 0.7,
                      child: PageView(
                        controller: PageController(initialPage: currentPage),
                        onPageChanged: (index) {
                          bloc.add(GoToPageEvent(index: index));
                        },
                        children: [
                          Center(child: PageviewOne()),
                          Center(child: PageViewTwo()),
                          Center(child: PageViewThree()),
                        ],
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: PageController(initialPage: currentPage),
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: const Color.fromARGB(
                          255,
                          194,
                          190,
                          187,
                        ),
                        dotColor: Colors.grey,
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
