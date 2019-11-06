library flutter_collapse;

import 'package:flutter/material.dart';
import 'package:flutter_collapse/animate_rotate.dart';

class Collapse extends StatelessWidget {
  /// 折叠面板
  const Collapse({
    Key key,
    this.title,
    this.icon = const Icon(
      Icons.expand_more,
      size: 24,
    ),
    this.value = true,
    this.body,
    this.onChange,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
  }) : super(key: key);

  /// 标题
  final Widget title;

  /// 是否展开 true:展开 false:收起 默认值:true
  final bool value;

  /// 内容
  final Widget body;

  /// 回调 返回当前value
  final Function(bool) onChange;

  /// icon 默认值：Icon(Icons.expand_more, size: 24,),
  final Widget icon;

  /// padding 默认值：EdgeInsets.symmetric(vertical: 10, horizontal: 15)
  final EdgeInsets padding;

  /// 是否显示border
  final bool showBorder;

  static const Color borderColor = Color.fromRGBO(235, 237, 240, 1);
  static const Duration sleep = const Duration(milliseconds: 120);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      key: key,
      child: Column(
        children: <Widget>[
          /// title
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color:
                              showBorder ? borderColor : Colors.transparent))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: title,
                  ),
                  AnimatedRotate(
                    duration: sleep,
                    child: icon,
                    rotate: value ? 0.5 : 1,
                  )
                ],
              ),
            ),
            onTap: () => onChange == null ? () {} : onChange(!value),
          ),

          _Body(
            child: Container(padding: padding, child: body),
            sleep: sleep,
            value: value,
          )
        ],
      ),
    );
  }
}

/// 内容区域
/// 为了获取当前内容的高度 实现展开收起动画，所以拆成状态组件
class _Body extends StatefulWidget {
  _Body({
    this.child,
    this.value,
    @required this.sleep,
    Key key,
  }) : super(key: key);

  final Widget child;
  final bool value;
  final Duration sleep;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> with TickerProviderStateMixin {
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedSize(
          vsync: this,
          duration: widget.sleep,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: !widget.value ? 0 : double.infinity,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: widget.child,
                )
              ],
            ),
          )),
    );
  }
}
