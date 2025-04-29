import 'dart:math';
import 'dart:ui';

Color generateColor() => Color.fromRGBO(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextDouble(),
    );
