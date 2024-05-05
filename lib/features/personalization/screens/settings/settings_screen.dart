import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secure/common/widgets/appbar/appbar.dart';
import 'package:secure/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:secure/common/widgets/list_title/settings_menu_tile.dart';
import 'package:secure/common/widgets/text/section_heading.dart';
import 'package:secure/data/repositories/authentication/authentication_repository.dart';
import 'package:secure/features/authentication/controllers/user/user_controller.dart';
import 'package:secure/features/personalization/screens/profile/profile_screen.dart';
import 'package:secure/utils/constants/size.dart';

import '../../../../common/widgets/list_title/profile_title.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationRepository());
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            SePrimaryHeaderContainer(child: Column(children: [
              SeAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),),),

              // user profile card
              SeUserProfileTile(onPressed: () => Get.to(()=> const ProfileScreen()),),

              const SizedBox(height: SecuriteSize.spaceBtwSection,),

            ],)),

            // body
            Padding(
              padding: const EdgeInsets.all(SecuriteSize.defaultSpace),
              child: Column(
                children: [
                  const SeSectionHeading(title: 'Account Settings', showActionButton: false,),
                  const SizedBox(height: SecuriteSize.spaceBtwItem,),

                  SeSettingsMenuTile(icon: Iconsax.safe_home, title: 'My Address', subtitle: 'Set your address', onTap: (){}, trailing: const Icon(Iconsax.arrow_right),),
                  SeSettingsMenuTile(icon: Iconsax.logout, title: 'Logout', subtitle: 'Logout of your accout', onTap: () => controller.signOut(),),
                ],
              ),
              ),
          ],
        ),
      ),

      
    );
  }
}

