import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CashedImage extends StatelessWidget {
  const CashedImage({super.key, required this.img});
final String img;
  @override
  Widget build(BuildContext context) {
    return   CachedNetworkImage(
      imageUrl: img ?? '',
      imageBuilder: (context, imageProvider) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius:
            BorderRadiusDirectional.circular(8),
            image: DecorationImage(image: imageProvider)),
      ),
      placeholder: (context, url) => Scaffold(body: Center(child: CircularProgressIndicator())),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
