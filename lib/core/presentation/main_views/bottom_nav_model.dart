// lib/core/presentation/view_model/bottom_nav_item.dart



import 'package:fruits_hub/core/router/app_routes.dart';
import 'package:fruits_hub/core/utils/app_images.dart';

class BottomNavModel {
  final String label;
  final String iconPathActive;
  final String iconPathInactive;
  final String route;

  const BottomNavModel({
    required this.label,
    required this.iconPathActive,
    required this.iconPathInactive,
    required this.route,
  });
}

class BottomNavList {
  static List<BottomNavModel> get items => [
    BottomNavModel(
      label: 'الرئيسية',
      iconPathActive: AppImages.homeActive,
      iconPathInactive: AppImages.homeIcon,
      route: AppRoutes.home,
    ),
    BottomNavModel(
      label: 'المنتجات',
      iconPathActive: AppImages.productsActive,
      iconPathInactive: AppImages.productsIcon,
      route: AppRoutes.products,
    ),
    BottomNavModel(
      label: 'سله التسوق',
      iconPathActive: AppImages.cartActive,
      iconPathInactive: AppImages.cartIcon,
      route: AppRoutes.cart,
    ),
    
    BottomNavModel(
      label: 'حسابى',
      iconPathActive: AppImages.userActive,
      iconPathInactive: AppImages.userIcon,
      route: AppRoutes.profile,
    ),
  ];
}