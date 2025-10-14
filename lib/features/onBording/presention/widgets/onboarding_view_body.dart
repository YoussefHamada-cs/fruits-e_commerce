import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/features/onBording/presention/widgets/next_button.dart';
import 'package:fruits_hub/features/onBording/presention/widgets/skip_button.dart';

import '../../data/onboarding_data.dart';
import '../../data/onboarding_item.dart';
import 'onboarding_page.dart';
import 'page_indicators.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<OnboardingItem> _items = OnboardingData.items;

  @override
  Widget build(BuildContext context) {
    // الحصول على أبعاد الشاشة
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.height < 600;
    final bool isTablet = screenSize.width > 600;

    // تحديد المسافات بناءً على حجم الشاشة
    final double topPadding = isSmallScreen
        ? 10.0
        : isTablet
        ? 30.0
        : 20.0;
    final double bottomPadding = isSmallScreen
        ? 20.0
        : isTablet
        ? 40.0
        : 30.0;
    final double sidePadding = isSmallScreen
        ? 10.0
        : isTablet
        ? 30.0
        : 20.0;

    return Scaffold(
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            // تعديل الواجهة بناءً على اتجاه الشاشة
            final bool isPortrait = orientation == Orientation.portrait;

            return LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SvgPicture.asset(
                        _items[_currentPage].backgroundImage,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.45,
                        fit: BoxFit.fill,
                      ),
                    ),
                    // PageView في الخلفية
                    PageView.builder(
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return OnboardingPage(
                          item: _items[index],
                          isLastPage: index == _items.length - 1,
                        );
                      },
                    ),

                    // Skip button
                    Positioned(
                      top: topPadding,
                      right: sidePadding,
                      child: SkipButton(currentPage: _currentPage),
                    ),

                    // Page indicators
                    Positioned(
                      bottom: isPortrait
                          ? bottomPadding + 60
                          : bottomPadding + 10,
                      left: 0,
                      right: 0,
                      child: PageIndicators(
                        currentPage: _currentPage,
                        pageCount: _items.length,
                      ),
                    ),
                    _currentPage == 1
                        ? Positioned(
                            bottom: bottomPadding,
                            left: sidePadding,
                            right: sidePadding,
                            child: NextButton(),
                          )
                        : Container(),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
