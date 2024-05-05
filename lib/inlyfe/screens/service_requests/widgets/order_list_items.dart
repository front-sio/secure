import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secure/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:secure/utils/constants/colors.dart';
import 'package:secure/utils/constants/size.dart';
import 'package:secure/utils/helpers/helper_functions.dart';

class SeOrderListItems extends StatelessWidget {
  const SeOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SecuriteHelperFunction.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(height: SecuriteSize.spaceBtwItem,),
      itemBuilder: (_, index) => SeRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(SecuriteSize.md),
        backgroundColor: dark ? SecuriteColors.dark : SecuriteColors.white,
        child: Column(children: [
          Row(children: [
            const Icon(Iconsax.ship),
            const SizedBox(width: SecuriteSize.spaceBtwItem / 2,),


            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Processing', style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.blueAccent.shade700, fontWeightDelta: 1),),

                Text('Nov 20, 2024', style: Theme.of(context).textTheme.headlineSmall,)
              ],
            )
          ],)
        ],),
      ),
    );
  }
}