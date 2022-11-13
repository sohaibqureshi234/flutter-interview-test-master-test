
import 'package:flutter/material.dart';

class userAvatar extends StatelessWidget {
   userAvatar({Key? key,required this.useravatar}) : super(key: key);

  dynamic useravatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: FadeInImage.assetNetwork(
          placeholder: "assets/png/place_holder_profile.png",
          image: userAvatar == null
              ? "https://www.salemfive.com/globalassets/bio/male-headshot_400x400.jpg"
              : "${useravatar}",
          fit: BoxFit.cover,
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/png/place_holder_profile.png',
            );
          },
        ),
      ),
    );
  }
}
