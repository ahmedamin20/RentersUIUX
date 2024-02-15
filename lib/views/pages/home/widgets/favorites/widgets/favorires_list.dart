import 'package:flutter/material.dart';

import 'favorites_list_item.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: ((context, index) {
            return CustomCardCar(function: () {});
          }),
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: 10),
    );
  }
}
