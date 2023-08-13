// Mocks generated by Mockito 5.4.2 from annotations
// in imageproject/test/features/photo/data/repositories/photo_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:imageproject/features/photo/data/data_sources/photo_remote_data_source.dart'
    as _i3;
import 'package:imageproject/features/photo/data/models/photo_model.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePhotoModel_0 extends _i1.SmartFake implements _i2.PhotoModel {
  _FakePhotoModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PhotoRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPhotoRemoteDataSource extends _i1.Mock
    implements _i3.PhotoRemoteDataSource {
  MockPhotoRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i2.PhotoModel>> getPhotoList(int? page) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPhotoList,
          [page],
        ),
        returnValue: _i4.Future<List<_i2.PhotoModel>>.value(<_i2.PhotoModel>[]),
      ) as _i4.Future<List<_i2.PhotoModel>>);
  @override
  _i4.Future<_i2.PhotoModel> getOnePhoto(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getOnePhoto,
          [id],
        ),
        returnValue: _i4.Future<_i2.PhotoModel>.value(_FakePhotoModel_0(
          this,
          Invocation.method(
            #getOnePhoto,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.PhotoModel>);
}
