<!--
 * @Author: meetqy
 * @since: 2019-11-05 17:45:28
 * @lastTime: 2019-11-05 18:04:23
 * @LastEditors: meetqy
 -->
# flutter_collapse

flutter_collapse折叠面板

## 目录

- [使用](#使用)
- [参数说明](#参数说明)
- [如何贡献](#如何贡献)
- [使用许可](#使用许可)

## 使用说明

```dart
Collapse(
  title: Container(
    child: Text('折叠面板 - 默认')
  ),
  body: Text('这就是一个demo'),
  value: true,
),
```

## 参数说明

参数 | 说明
---- | ----
title\<Widget> | 标题,
icon\<Widget> | 右侧图标。默认值：Icon(Icons.expand_more, size: 24,)
value\<bool> | 是否展开。 默认值：true
body\<Widget> | 内容
onChange\<Function(bool)> | 状态改变 返回当前value
showBorder\<bool> | 是否显示border 默认：true
padding\<EdgeInsets> | 内边距 默认值：EdgeInsets.symmetric(vertical: 10, horizontal: 15),

## 维护者

[@meetqy](https://github.com/meetqy).

## 如何贡献

非常欢迎你的加入! [提一个Issue](https://github.com/meetqy/flutter_collapse/issues/new) 或者提交一个 Pull R equest.

## 使用许可

[MIT](LICENSE) © MEETQY
