import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:imageproject/features/photo/domain/entities/photo.dart';
import 'package:imageproject/features/photo/presentation/cubit/photo_state.dart';

import '../../../../injection.dart';
import '../cubit/photo_cubit.dart';

class MainPhotoPageView extends StatefulWidget {
  const MainPhotoPageView({super.key});

  @override
  State<MainPhotoPageView> createState() => _MainPhotoPageViewState();
}

class _MainPhotoPageViewState extends State<MainPhotoPageView> {
  final PhotoCubit photoCubit = getIt<PhotoCubit>();

  static List<Photo> data = [];

  final scrollController = ScrollController();
  @override
  void initState() {
    photoCubit.getPhotoListFunc();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        photoCubit.getPhotoListFunc();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _blocBuilder(),
      ),
    );
  }

  BlocBuilder<PhotoCubit, PhotoState> _blocBuilder() {
    return BlocBuilder<PhotoCubit, PhotoState>(
      bloc: photoCubit,
      builder: (context, state) {
        if (state is PhotoDataFailed) {
          return Center(
            child: Text(state.data.message),
          );
        }

        if (state is PhotoDataLoading) {
          data = state.data;
        } else if (state is PhotoDataLoaded) {
          data = state.data;
        }
        return GridView.builder(
            controller: scrollController,
            itemCount: data.length + 1,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 9 / 12,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              if (index < data.length) {
                return GestureDetector(
                  onTap: () {
                    context.pushNamed('photodetails',
                        pathParameters: {"id": data[index].id},
                        extra: [data[index].id, photoCubit]);
                  },
                  child: Column(
                    children: [
                      _image(index),
                      const SizedBox(
                        height: 8,
                      ),
                      _userInformationUnderImage(index)
                    ],
                  ),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            });
      },
    );
  }

  Expanded _image(int index) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: CachedNetworkImage(
            fit: BoxFit.cover, imageUrl: data[index].urls.thumb),
      ),
    );
  }

  Row _userInformationUnderImage(int index) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.transparent,
          child: SizedBox(
            child: ClipOval(
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: data[index].user.profileImage.small)),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(data[index].user.name.length > 15
            ? "${data[index].user.name.substring(0, 15)}..."
            : data[index].user.name),
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        "Images",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      centerTitle: true,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
