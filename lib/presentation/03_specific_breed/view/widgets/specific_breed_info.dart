import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../app/functions.dart';
import '../../../../domain/entities/cat_breed_entity.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class SpecificBreedInformation extends StatefulWidget {
  const SpecificBreedInformation({super.key, required this.catBreedEntity});
  final CatBreedEntity catBreedEntity;

  @override
  State<SpecificBreedInformation> createState() =>
      _SpecificBreedInformationState();
}

class _SpecificBreedInformationState extends State<SpecificBreedInformation> {
  Future<void>? _launched;

  Future<void> _launchInBrowserView(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
      throw Exception('Could not launch ${url.toString()}');
    }

    // final bool nativeAppLaunchSucceeded = await launchUrl(
    //   uri,
    //   mode: LaunchMode.externalNonBrowserApplication,
    // );
    // if (!nativeAppLaunchSucceeded) {
    //   await launchUrl(
    //     uri,
    //     mode: LaunchMode.inAppBrowserView,
    //   );
    // }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle baseTextStyle = Styles.style22Medium().copyWith(
        color: isLightTheme(context) ? ColorManager.black : ColorManager.white);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s20),
        child: Column(
          children: [
            RichText(
              maxLines: 70,
              text: TextSpan(
                style: baseTextStyle,
                children: [
                  TextSpan(text: widget.catBreedEntity.description),
                  const TextSpan(text: '\n\n'),
                  TextSpan(
                    text: S.current.cat_weight_range(
                        widget.catBreedEntity.name,
                        widget.catBreedEntity.weight.imperial,
                        widget.catBreedEntity.weight.metric),
                  ),
                  const TextSpan(text: '\n\n'),
                  TextSpan(
                    text: S.current
                        .cat_temperament(widget.catBreedEntity.temperament),
                  ),
                  const TextSpan(text: '\n\n'),
                  TextSpan(
                    text: S.current.cat_lifespan(widget.catBreedEntity.lifeSpan
                        .replaceAll(RegExp(r'-'), S.current.to)),
                  ),
                  const TextSpan(text: '\n\n'),
                  TextSpan(
                    text: S.current.cat_origin(widget.catBreedEntity.origin),
                  ),
                  const TextSpan(text: '\n\n'),
                  TextSpan(
                    text: S.current.more_information,
                  ),
                  TextSpan(
                    text: S.current.vetstreet_page,
                    style: isLightTheme(context)
                        ? const TextStyle(color: ColorManager.blue)
                        : const TextStyle(color: ColorManager.orange4),
                    mouseCursor: SystemMouseCursors.click,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          _launched = _launchInBrowserView(
                              widget.catBreedEntity.vetstreetUrl);
                        });
                      },
                  ),
                  TextSpan(
                    text: S.current.or,
                  ),
                  TextSpan(
                    text: S.current.wikipedia_page,
                    style: isLightTheme(context)
                        ? const TextStyle(color: ColorManager.blue)
                        : const TextStyle(color: ColorManager.orange4),
                    mouseCursor: SystemMouseCursors.click,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          _launched = _launchInBrowserView(
                              widget.catBreedEntity.wikipediaUrl);
                        });
                      },
                  ),
                ],
              ),
            ),
            FutureBuilder<void>(future: _launched, builder: _launchStatus),
          ],
        ),
      ),
    );
  }
}
