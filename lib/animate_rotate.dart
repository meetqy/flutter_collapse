/*
 * @Author: meetqy
 * @since: 2019-10-22 11:24:46
 * @lastTime: 2019-11-06 11:39:10
 * @LastEditors: meetqy
 */
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimatedRotate extends ImplicitlyAnimatedWidget {
  /// 自定义旋转动画
  /// 参考：自带动画 AnimatedOpacity
  /// 详细注解查看  AnimatedOpacity
  /// ``` dart
  /// @params rotate 计算方式：x * math.pi * 2
  /// ```
  const AnimatedRotate({
    Key key,
    this.child,
    @required this.rotate,
    Curve curve = Curves.linear,
    @required Duration duration,
  })  : assert(rotate != null),
        super(key: key, curve: curve, duration: duration);

  final Widget child;

  final double rotate;

  @override
  _AnimatedRotateState createState() => _AnimatedRotateState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('rotate', rotate));
  }
}

class _AnimatedRotateState
    extends ImplicitlyAnimatedWidgetState<AnimatedRotate> {
  Tween<double> _rotate;
  Animation<double> _rotateAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _rotate = visitor(
        _rotate, widget.rotate, (dynamic value) => Tween<double>(begin: value));
  }

  @override
  void didUpdateTweens() {
    _rotateAnimation = animation.drive(_rotate);
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotateAnimation,
      alignment: Alignment.center,
      child: widget.child,
    );
  }
}
