import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class CustomLoader extends StatefulWidget {
  final double height;
  final double width;

  CustomLoader({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  _CustomLoaderState createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader> with SingleTickerProviderStateMixin {
  late GifController _gifController;

  @override
  void initState() {
    super.initState();
    _gifController = GifController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Gif(
        controller: _gifController,
        image: AssetImage("assets/gif/loaderprimary.gif"),
        autostart: Autostart.loop,
        // placeholder: (context) => const Center(child: Text('Loading...')),
        onFetchCompleted: () {
          _gifController.reset();
          _gifController.forward();
        },
      ),
    );
  }

  @override
  void dispose() {
    _gifController.dispose();
    super.dispose();
  }
}
