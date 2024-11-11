
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:user/core/widgets/logo.dart';
import 'package:user/core/widgets/logo_loading_widget.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.width,
    required this.url,
  });

  final double width;
  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      imageUrl: url,
      placeholder: (context, url) => LogoLoadingWidget(
        width: width,
      ),
      errorWidget: (context, url, error) => ourLogo(size: width),
    );
  }
}