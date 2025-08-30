import 'dart:ui';

import 'package:flutter/material.dart';

final BorderRadiusGeometry _borderRadius = BorderRadiusGeometry.circular(25);

class GlassBox extends StatelessWidget {

  final Widget child;
  final double width;
  final double height;

  const GlassBox({
    super.key, 
    required this.child, 
    required this.width, 
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _borderRadius,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 25 ,
                sigmaY: 25 ,
              ),  
              child: Container(),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withValues(alpha: 0.1,),),
                borderRadius: _borderRadius,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors:[
                    Colors.grey.shade500.withValues(alpha: 0.2,),
                    Colors.grey.shade500.withValues(alpha: 0.2,),
                  ],
                )
              ),
            ),

            Container(
              padding: const EdgeInsets.all(25),
              alignment: Alignment.topCenter,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}