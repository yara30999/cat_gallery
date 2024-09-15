import 'dart:io';
import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../../02_home/view/01_main_breeds/view_model/cubit/cat_breeds_cubit.dart';
import '../../../02_home/view/widgets/images_widgets/cat_network_image.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';
import '../../view_model/cubit/upload_image_cubit.dart';
import 'camera_gallery_buttons.dart';
import 'dotted_img_placeholder.dart';
import 'pick_breed.dart';
import 'pick_category.dart';
import 'upload_img_button.dart';

class AddImageSectionMobile extends StatefulWidget {
  const AddImageSectionMobile({super.key});

  @override
  State<AddImageSectionMobile> createState() => _AddImageSectionMobileState();
}

class _AddImageSectionMobileState extends State<AddImageSectionMobile> {
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
    if (pickedFile != null) {
      if (mounted) {
        BlocProvider.of<UploadImageCubit>(context).imgFile = _imgFile;
      }
    }
  }

  //this function for web only
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
        buildDottedBorderImage(context),
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
        BlocBuilder<CatBreedsCubit, CatBreedsState>(
          builder: (context, state) {
            if (state is CatBreedsSuccess) {
              return PickBreed(
                breeds: BlocProvider.of<CatBreedsCubit>(context).catBreedsList,
              );
            }
            return PickBreed(
              breeds: BlocProvider.of<CatBreedsCubit>(context).catBreedsList,
            );
          },
        ),
        const SizedBox(
          height: AppSize.s20,
        ),
        const PickCategory(),
        const SizedBox(
          height: AppSize.s20,
        ),
        const UploadImgButton(),
        const SizedBox(
          height: AppSize.s60,
        ),
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
