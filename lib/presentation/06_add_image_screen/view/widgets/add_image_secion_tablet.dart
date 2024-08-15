import 'dart:io';
import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../../02_home/widgets/images_widgets/cat_network_image.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';
import 'camera_gallery_buttons.dart';
import 'dotted_img_placeholder.dart';
import 'pick_breed.dart';
import 'pick_category.dart';
import 'upload_img_button.dart';

class AddImageSectionTablet extends StatefulWidget {
  const AddImageSectionTablet({super.key});

  @override
  State<AddImageSectionTablet> createState() => _AddImageSectionTabletState();
}

class _AddImageSectionTabletState extends State<AddImageSectionTablet> {
  final picker = ImagePicker();
  late DropzoneViewController dropzoneController;
  bool isHighlighted = false;

  File? _imgFile;
  Widget? _image;

  Future pickImage(ImageSource source) async {
    //here i have imgfile
    final pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 80,
    );
    setState(() {
      if (pickedFile != null) {
        _imgFile = File(pickedFile.path);
        _image = kIsWeb
            ? CatNetworkImage(imgUrl: _imgFile!.path)
            : Image.file(
                _imgFile!.absolute,
                fit: BoxFit.cover,
              );
      } else {
        debugPrint('no image yara picked');
      }
    });
  }

  Future<void> handleFileDrop(
      dynamic event, DropzoneViewController controller) async {
    //here i have imgData
    String fileUrl = await controller.createFileUrl(event);
    //Uint8List fileData = await controller.getFileData(event);
    setState(() {
      _image = kIsWeb
          ? CatNetworkImage(imgUrl: fileUrl)
          : null; // Handle non-web case if needed
      isHighlighted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(
              flex: 1,
            ),
            Flexible(
                flex: 2, child: Center(child: buildDottedBorderImage(context))),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
        const SizedBox(
          height: AppSize.s20,
        ),
        CameraGalleryButtons(
          cameraFunc: () async {
            await pickImage(ImageSource.camera);
          },
          galleryFunc: () async {
            await pickImage(ImageSource.gallery);
          },
        ),
        const SizedBox(
          height: AppSize.s20,
        ),
        const PickBreed(),
        const SizedBox(
          height: AppSize.s20,
        ),
        const PickCategory(),
        const SizedBox(
          height: AppSize.s20,
        ),
        const UploadImgButton(),
      ],
    );
  }

  Widget buildDottedBorderImage(BuildContext context) {
    return DottedBorder(
      padding: const EdgeInsets.all(AppPadding.p10),
      color: Theme.of(context).primaryColorDark,
      strokeWidth: 2,
      dashPattern: const [14, 6],
      child: Container(
        constraints: BoxConstraints.fromViewConstraints(ViewConstraints(
            minHeight: AppSize.s100,
            minWidth: AppSize.s160,
            maxHeight: AppSize.s280,
            maxWidth: MediaQuery.sizeOf(context).width * 0.8)),
        color: isHighlighted
            ? Theme.of(context).disabledColor
            : ColorManager.grey3,
        child: Stack(children: [
          if (kIsWeb) buildDropZone(context),
          InkWell(
            onTap: () async {
              await pickImage(ImageSource.gallery);
            },
            child: _image ?? const DottedImagePlaceholer(),
          ),
        ]),
      ),
    );
  }

  Widget buildDropZone(BuildContext context) {
    return Builder(
      builder: (context) => DropzoneView(
        operation: DragOperation.copy,
        cursor: CursorType.grab,
        onCreated: (ctrl) => dropzoneController = ctrl,
        onHover: () {
          setState(() => isHighlighted = true);
        },
        onLeave: () {
          setState(() => isHighlighted = false);
        },
        onDrop: (event) async {
          await handleFileDrop(event, dropzoneController);
        },
      ),
    );
  }
}
