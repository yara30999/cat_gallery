import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../route_observer.dart';
import '../../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../../../resources/platform_manager.dart';
import '../view_model/get_uploads_cubit/uploads_cubit.dart';
import 'uploads_view_body_desktop.dart';
import 'uploads_view_body_mobile.dart';
import 'uploads_view_body_tablet.dart';

class UploadsViewBody extends StatefulWidget {
  const UploadsViewBody({super.key});

  @override
  State<UploadsViewBody> createState() => _UploadsViewBodyState();
}

class _UploadsViewBodyState extends State<UploadsViewBody> with RouteAware {
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
  void didPopNext() {
    var uid = BlocProvider.of<AuthCubit>(context).authObj!.uid;
    BlocProvider.of<UploadsCubit>(context)
        .getUploads(uid: uid, pageNum: 0, isFirstCall: false);
  }

  @override
  Widget build(BuildContext context) {
    return MiniAdaptiveLayout(
      mobileLayout: (context) => const UploadsViewBodyMobile(),
      tabletLayout: (context) => const UploadsViewBodyTablet(),
      desktopLayout: (context) => const UploadsViewBodyDesktop(),
    );
  }
}
