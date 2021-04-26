import 'package:timer/model/count.dart';

class CountStream {
  double _radius = 1;
  bool _isActive = true;
  Duration _currentTime;
  Duration _fullTime;

  Stream<Count> stream() async* {
    yield* Stream.periodic(Duration(seconds: 1), (int segundos) {
      if (_isActive) {
        print("en el stream 2");
        print("$_currentTime - $_radius");
        _currentTime -= Duration(seconds: 1);
        _radius = _currentTime.inSeconds / _fullTime.inSeconds;
        if (_currentTime.inSeconds <= 0) {
          _isActive = false;
        }
      }
      return Count(_currentTime.inSeconds.toString(), _radius);
    });
  }

  void start() {
    _isActive = true;
  }

  void stop() {
    _isActive = false;
  }

  void setTime(int seconds) {
    _currentTime = Duration(seconds: seconds);
    _fullTime = Duration(seconds: seconds);
  }

  bool getActive() => _isActive;

  void reset() {
    _currentTime = Duration(seconds: _fullTime.inSeconds);
  }
}
