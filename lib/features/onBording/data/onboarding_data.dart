
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';

import 'onboarding_item.dart';

class OnboardingData {
  static final List<OnboardingItem> items = [
    OnboardingItem(
      title: AppStrings.onboardingScreenTitle1,
      description: AppStrings.onboardingScreenDescription1,
      image: AppImages.fruitBasket,
      backgroundImage: AppImages.backgroundImage1,
    ),
    OnboardingItem(
      title: AppStrings.onboardingScreenTitle2,
      description: AppStrings.onboardingScreenDescription2,
      image: AppImages.pineapple,
      backgroundImage: AppImages.backgroundImage2,
    ),
   
  ];
}
