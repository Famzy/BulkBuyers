class PlatformInfo {
  static String _userAgent;
  static String _deviceId;

  static final PlatformInfo _platformSpecificInfo =
      new PlatformInfo._internal();

  factory PlatformInfo() {
    return _platformSpecificInfo;
  }

  PlatformInfo._internal();
  set userAgent(String value) => _userAgent = value;

  set deviceId(String value) => _deviceId = value;

  String get userAgent {
   // _validateValue(_userAgent);
    return _userAgent;
  }

  String get deviceId {
    //_validateValue(_deviceId);
    return _deviceId;
  }

  _validateValue(String value) {
    if (value == null || value.isEmpty) {
      throw Exception('Pointed to wrong Server');
    }
  }
  @override
  String toString() {
    return '[userAgent = $userAgent, deviceId = $deviceId]';

  }
}
