import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../app/functions.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../../widgets/states_widgets/empty_state_widget.dart';
import '../../../widgets/states_widgets/error_state_widget.dart';
import '../../view_model/get_uploads_cubit/uploads_cubit.dart';
import '../widgets/uploads_pagination_grid_builder.dart';

class UploadsBlocConsumer extends StatefulWidget {
  const UploadsBlocConsumer({super.key});

  @override
  State<UploadsBlocConsumer> createState() => _UploadsBlocConsumerState();
}

class _UploadsBlocConsumerState extends State<UploadsBlocConsumer> {
  @override
  void initState() {
    var uid = BlocProvider.of<AuthCubit>(context).authObj!.uid;
    BlocProvider.of<UploadsCubit>(context)
        .getUploads(uid: uid, pageNum: 0, isFirstCall: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadsCubit, UploadsState>(
      listener: (context, state) {
        if (state is UploadsPaginationFailure) {
          showSnakBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is UploadsFailure) {
          return SliverToBoxAdapter(
            child: ErrorStateWidget(
              errorText: state.errMessage,
            ),
          );
        } else if (state is UploadsSuccessFirstPageEmpty) {
          return SliverToBoxAdapter(
            child: EmptyStateWidget(
              text: S.current.no_uploads_yet,
            ),
          );
        } else {
          return SliverSkeletonizer(
            enabled: state.isLoading,
            child: SliverToBoxAdapter(
              //trigger the request at some points
              child: UploadsPaginationGridBuilder(
                catImages: state.imageItems,
              ),
            ),
          );
        }
      },
    );
  }
}
