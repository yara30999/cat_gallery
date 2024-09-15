import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/di.dart';
import '../../../app/functions.dart';
import '../../../route_observer.dart';
import '../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../02_home_screen/view/03_uploads/view_model/get_uploads_cubit/uploads_cubit.dart';
import '../../resources/platform_manager.dart';
import '../view_model/cubit/upload_image_cubit.dart';
import 'add_image_body_desktop.dart';
import 'add_image_body_mobile.dart';
import 'add_image_body_tablet.dart';

class AddImageBody extends StatefulWidget {
  const AddImageBody({super.key});

  @override
  State<AddImageBody> createState() => _AddImageBodyState();
}

class _AddImageBodyState extends State<AddImageBody> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    MyRouteObservers.uploadsViewObserver
        .subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    MyRouteObservers.uploadsViewObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPop() {
    var uid = BlocProvider.of<AuthCubit>(context).authObj!.uid;
    BlocProvider.of<UploadsCubit>(context)
        .getUploads(uid: uid, pageNum: 0, isFirstCall: true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadImageCubit(instance()),
      child: BlocListener<UploadImageCubit, UploadImageState>(
        listener: (context, state) {
          if (state is UploadImageFailure) {
            showSnakBar(context, state.errMessage);
          } else if (state is UploadImageEmpty) {
            showSnakBar(context, state.errMessage);
          } else if (state is UploadImageSuccess) {
            Navigator.pop(context);
          }
        },
        child: MiniAdaptiveLayout(
          mobileLayout: (context) => const AddImageBodyMobile(),
          tabletLayout: (context) => const AddImageBodyTablet(),
          desktopLayout: (context) => const AddImageBodyDesktop(),
        ),
      ),
    );
  }
}
