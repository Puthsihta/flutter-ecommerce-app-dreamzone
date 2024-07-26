import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:transparent_image/transparent_image.dart';

class TransparentImage extends StatelessWidget {
  const TransparentImage({
    super.key,
    required this.url,
    this.borderRadius = 0,
    this.local = false,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    this.borderColor,
    this.enableCache = false,
    this.errorUrl,
    this.memCacheHeight,
    this.placeHolderAspectRatio,
  });

  final String? url;
  final bool local;
  final double borderRadius;
  final BoxFit fit;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool enableCache;
  final String? errorUrl;
  final int? memCacheHeight;
  final double? placeHolderAspectRatio;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: 0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: local
            ? Image.file(
                File(url!),
                fit: fit,
                errorBuilder: (context, _, __) => Image.asset(
                  errorUrl ?? "assets/images/logo.png",
                  fit: BoxFit.cover,
                ),
              )
            : enableCache
                ? CachedNetworkImage(
                    imageUrl: url ?? "",
                    memCacheHeight: memCacheHeight,
                    errorWidget: (context, _, __) => Image.asset(
                      errorUrl ?? "assets/images/logo.png",
                      fit: BoxFit.cover,
                    ),
                    placeholder: (_, __) => placeHolderAspectRatio != null
                        ? AspectRatio(
                            aspectRatio: placeHolderAspectRatio!,
                            child: Container(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.1),
                            ),
                          )
                        : Container(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.1),
                          ),
                    fit: fit,
                    cacheManager: CacheManager(
                      Config(
                        "post_image",
                        stalePeriod: const Duration(days: 3),
                        //one week cache period
                      ),
                    ),
                  )
                : FadeInImage.memoryNetwork(
                    fit: fit,
                    placeholder: kTransparentImage,
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Image.asset(
                      errorUrl ?? "assets/images/logo.png",
                      fit: BoxFit.cover,
                    ),
                    image: url ?? "",
                  ),
      ),
    );
  }
}
