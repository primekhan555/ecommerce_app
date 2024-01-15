import 'package:ecommerceapp/navigation/navigation.dart';
import 'package:ecommerceapp/presentation/views/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../providers/cart_provider.dart';
import '../../providers/search_provider.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final bool showSearch;
  final bool showBackArrow;
  const CustomAppBar(
      {super.key, this.showSearch = true, this.showBackArrow = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchPro = ref.read(searchProvider);
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: showBackArrow
          ? IconButton(
              icon: SvgPicture.asset("assets/icons/back.svg"),
              onPressed: () => Navigation.pop(),
            )
          : null,
      actions: <Widget>[
        if (showSearch)
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              colorFilter: const ColorFilter.mode(AppColors.kTextColor, BlendMode.srcIn),
            ),
            onPressed: () => searchPro.activateSearch(),
          ),
        Stack(
          alignment: Alignment.topRight,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/cart.svg",
                colorFilter:
                    const ColorFilter.mode(AppColors.kTextColor, BlendMode.srcIn),
              ),
              onPressed: () => Navigation.pushNamed(CartScreen.routeName),
            ),
            CircleAvatar(
              radius: 10,
              child: Consumer(builder: (context, ref, child) {
                final cartLength = ref.watch(cartProvider).cart.length;
                return Text(
                  cartLength.toString(),
                  style: const TextStyle(fontSize: 12),
                );
              }),
            )
          ],
        ),
        const SizedBox(width: AppConstants.kDefaultPaddin / 2)
      ],
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
