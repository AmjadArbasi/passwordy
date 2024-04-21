/// An in-memory cache client
class CacheClient {
  final Map<String, Object> _cache;

  CacheClient() : _cache = <String, Object>{};

  void write<T extends Object>({required String key, required T value}) {
    _cache[key] = value;
  }

  T? read<T extends Object>({required String key}) {
    final value = _cache[key];

    if (value is T) return value;
    return null;
  }
}
