import 'dart:core';

import '../../../../../core/utils/cache.dart';
import '../../../models/user_model.dart';
import '../local_data_source.dart';

class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl(this._cache);

  static const _userCacheKey = '__user_cache_key__';
  final Cache _cache;

  @override
  UserModel? getUser() {
    return _cache.read<UserModel>(key: _userCacheKey);
  }

  @override
  void saveUser(UserModel? userModel) {
    _cache.write<UserModel>(key: _userCacheKey, value: userModel);
  }
}
