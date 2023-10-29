import 'package:flutter/material.dart';

class ScalableHome extends StatefulWidget {
  const ScalableHome({super.key});

  @override
  State<ScalableHome> createState() => _ScalableHomeState();
}

class _ScalableHomeState extends State<ScalableHome> {
  Offset _currentOffset = Offset.zero;
  Offset _startLastOffset = Offset.zero;
  Offset _lastOffset = Offset.zero;
  double _currentScale = 1.0;
  double _lastScale = 1.0;

  void _onScaleStart(ScaleStartDetails details) {
    print("Scale start details: $details");
    _startLastOffset = details.focalPoint;
    _lastOffset = _currentOffset;
    _lastScale = _currentScale;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    print("Scale update details: $details, scale: ${details.scale}");
    if (details.scale != 1.0) {
      double curScale = _lastScale * details.scale;
      if (curScale < 0.5) {
        curScale = 0.5;
      }
      setState(() {
        _currentScale = curScale;
      });
    } else {
      Offset offsetAdjustedForScale =
          (_startLastOffset - _lastOffset) / _lastScale;
      Offset curOffset =
          details.focalPoint - (offsetAdjustedForScale * _currentScale);
      setState(() {
        _currentOffset = curOffset;
      });
    }
  }

  void _onDoubleTap() {
    print("Double tap");

    double curScale = _lastScale * 2.0;
    if (curScale > 16.0) {
      curScale = 1.0;
      _resetState();
    }
    _lastScale = curScale;
    setState(() {
      _currentScale = curScale;
    });
  }

  void _onLongPress() {
    print("long press");
    setState(() {
      _resetState();
    });
  }

  void _resetState() {
    _currentOffset = Offset.zero;
    _startLastOffset = Offset.zero;
    _lastOffset = Offset.zero;
    _currentScale = 1.0;
    _lastScale = 1.0;
  }

  Transform _transformScaleAndTranslate() => Transform.scale(
        scale: _currentScale,
        child: Transform.translate(
          offset: _currentOffset,
          child: const Image(image: AssetImage("assets/images/mountains.jpeg")),
        ),
      );
  void _setScaleSmall() {
    setState(() {
      _currentScale = 0.5;
    });
  }

  void _setScaleBig() {
    setState(() {
      _currentScale = 8.0;
    });
  }

  Positioned _buildInkStuff(BuildContext context) => Positioned(
        top: 50.0,
        width: MediaQuery.of(context).size.width,
        child: Container(
          color: Colors.white54,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            IconButton(
              onPressed: () => print("lolkek"),
              icon: Icon(Icons.cake),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                  splashColor: Colors.lightGreenAccent,
                  highlightColor: Colors.lightBlueAccent,
                  onTap: _setScaleSmall,
                  hoverColor: Colors.amber,
                  onHover: (val) {
                    print(val);
                  },
                  onDoubleTap: _setScaleBig,
                  onLongPress: _onLongPress,
                  child: Container(
                    color: Colors.black12,
                    width: 128.0,
                    height: 48.0,
                    child: const Icon(Icons.touch_app),
                  )),
            ),
            InkResponse(
                splashColor: Colors.lightGreenAccent,
                highlightColor: Colors.lightBlueAccent,
                onTap: _setScaleSmall,
                onDoubleTap: _setScaleBig,
                onLongPress: _onLongPress,
                child: Container(
                  color: Colors.black12,
                  width: 128.0,
                  height: 48.0,
                  child: const Icon(Icons.touch_app),
                ))
          ]),
        ),
      );

  Positioned _positionedStatusBar(BuildContext context) => Positioned(
      top: 0.0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.white54,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Scale: ${_currentScale.toStringAsFixed(4)}"),
            Text("Offset:  $_currentOffset")
          ],
        ),
      ));
  Transform _transformMatrix4() => Transform(
        transform: Matrix4.identity()
          ..scale(_currentScale, _currentScale)
          ..translate(_currentOffset.dx, _currentOffset.dy),
        alignment: FractionalOffset.center,
        child: const Image(image: AssetImage("assets/images/mountains.jpeg")),
      );
  Widget _buildBody(BuildContext context) => GestureDetector(
        onScaleStart: _onScaleStart,
        onScaleUpdate: _onScaleUpdate,
        onDoubleTap: _onDoubleTap,
        onLongPress: _onLongPress,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildInkStuff(context),
            // _transformScaleAndTranslate(),
            Positioned(
                top: 100,
                left: 1024,
                child: Center(child: _transformMatrix4())),
            _positionedStatusBar(context)
          ],
        ),
      );
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Scalable Element"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: _buildBody(context),
        ),
      );
}
