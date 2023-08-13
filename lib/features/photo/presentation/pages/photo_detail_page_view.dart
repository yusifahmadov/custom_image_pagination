import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:imageproject/features/photo/presentation/cubit/photo_cubit.dart';
import 'package:imageproject/features/photo/presentation/cubit/photo_state.dart';

class PhotoDetailPageView extends StatefulWidget {
  final String id;
  final PhotoCubit photoCubit;
  const PhotoDetailPageView(
      {super.key, required this.id, required this.photoCubit});

  @override
  State<PhotoDetailPageView> createState() => _PhotoDetailPageViewState();
}

class _PhotoDetailPageViewState extends State<PhotoDetailPageView> {
  @override
  void initState() {
    widget.photoCubit.getOnePhotoFunc(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        children: [_blocBuilder()],
      ),
    );
  }

  BlocBuilder<PhotoCubit, PhotoState> _blocBuilder() {
    return BlocBuilder<PhotoCubit, PhotoState>(
      bloc: widget.photoCubit,
      builder: (context, state) {
        if (state is OnePhotoDataFailed) {
          return Center(
            child: Text(state.data.message),
          );
        } else if (state is OnePhotoDataLoaded) {
          return _image(state);
        }
        return Container();
      },
    );
  }

  Expanded _image(OnePhotoDataLoaded state) {
    return Expanded(
      child: CachedNetworkImage(
          fit: BoxFit.fill,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          imageUrl: state.data.urls.full),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          )),
      title: Text(
        "Image details",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      centerTitle: true,
    );
  }
}
