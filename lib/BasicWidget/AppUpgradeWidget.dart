import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/DDLog.dart';
import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:styled_widget/styled_widget.dart';

///
/// des:app升级提示控件
///
class AppUpgradeWidget extends StatefulWidget {
  const AppUpgradeWidget(
      {required this.title,
        this.titleStyle,
        required this.content,
        this.contentStyle,
        this.cancelText = "取消",
        this.cancelTextStyle,
        this.okText = "确定",
        this.okTextStyle,
        this.borderRadius = 15,
        this.force = false,
      });

  ///
  /// 升级标题
  ///
  final String? title;

  ///
  /// 标题样式
  ///
  final TextStyle? titleStyle;

  ///
  /// 升级提示内容
  ///
  final String content;

  ///
  /// 提示内容样式
  ///
  final TextStyle? contentStyle;

  ///
  /// 确认控件
  ///
  final String? okText;

  ///
  /// 确认控件样式
  ///
  final TextStyle? okTextStyle;

  ///
  /// 取消控件
  ///
  final String? cancelText;

  ///
  /// 取消控件样式
  ///
  final TextStyle? cancelTextStyle;

  ///
  /// 圆角半径
  ///
  final double borderRadius;

  ///
  /// 是否强制升级,设置true没有取消按钮
  ///
  final bool force;

  @override
  State<StatefulWidget> createState() => _AppUpgradeWidget();
}

class _AppUpgradeWidget extends State<AppUpgradeWidget> {
  static final String _downloadApkName = 'temp.apk';

  ///
  /// 下载进度
  ///
  double _downloadProgress = 0.0;

  // DownloadStatus _downloadStatus = DownloadStatus.none;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          _buildInfoWidget(context),
          // _downloadProgress > 0
              // ? Positioned.fill(child: _buildDownloadProgress())
          //     : Container(
          //   height: 10,
          // )
        ],
      ),
    );
  }

  ///
  /// 信息展示widget
  ///
  Widget _buildInfoWidget(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //标题
          _buildTitle(),
          //更新信息
          _buildAppInfo(),
          //操作按钮
          _buildAction()
        ],
      ),
    );
  }

  ///
  /// 构建标题
  ///
  _buildTitle() {
    return Padding(
        padding: EdgeInsets.only(top: 20),
        child: Text(widget.title ?? '',
            style: widget.titleStyle ?? TextStyle(fontSize: 22))
    ).backgroundColor(Colors.white);
  }

  ///
  /// 构建版本更新信息
  ///
  _buildAppInfo() {
    return Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 8),
        // height: 200,
        child:
            Text(
              widget.content,
              style: widget.contentStyle ?? TextStyle(fontSize: 15),
              
            ).backgroundColor(Colors.white)
            ,
    );
  }

  ///
  /// 构建取消或者升级按钮
  ///
  _buildAction() {
    return Column(
      children: <Widget>[
        Divider(
          height: 1,
          color: Colors.grey,
        ),
        Row(
          children: <Widget>[
            widget.force
                ? Container()
                : Expanded(
              child: _buildCancelActionButton(),
            ),
            Expanded(
              child: _buildOkActionButton(),
            ),
          ],
        ),
      ],
    );
  }

  ///
  /// 取消按钮
  ///
  _buildCancelActionButton() {
    return Material(
        child: Ink(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(widget.borderRadius))),

          child: InkWell(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(widget.borderRadius)),
            child: Container(
              height: 45,
              alignment: Alignment.center,
              child: Text(widget.cancelText ?? '以后再说',
                  style: widget.cancelTextStyle ?? TextStyle()),
            ),
            onTap: () {
              // widget.onCancel?.call();
              Navigator.of(context).pop();
            }
          ),
        ),
    );
  }

  ///
  /// 确定按钮
  ///
  _buildOkActionButton() {
    var borderRadius =
    BorderRadius.only(bottomRight: Radius.circular(widget.borderRadius));
    if (widget.force) {
      borderRadius = BorderRadius.only(
          bottomRight: Radius.circular(widget.borderRadius),
          bottomLeft: Radius.circular(widget.borderRadius));
    }
    var _okBackgroundColors = [
        Theme.of(context).primaryColor,
        Theme.of(context).primaryColor
      ];

    return Material(
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [_okBackgroundColors[0], _okBackgroundColors[1]]),
              borderRadius: borderRadius),

          child: InkWell(
            borderRadius: borderRadius,
            child: Container(
              height: 45,
              alignment: Alignment.center,
              child: Text(widget.okText ?? '立即体验',
                  style: widget.okTextStyle ?? TextStyle(color: Colors.white)),
            ),
            onTap: () {
              DDLog(widget.okText ?? '立即体验');
              // _clickOk();
            },
          ),
        ),
    );
  }

  ///
  /// 点击确定按钮
  ///
  _clickOk() async {
    // widget.onOk?.call();
    // if (Platform.isIOS) {
    //   //ios 需要跳转到app store更新，原生实现
    //   return;
    // }
    // if (widget.downloadUrl == null || widget.downloadUrl.isEmpty) {
    //   //没有下载地址，跳转到第三方渠道更新，原生实现
    //   return;
    // }
  }
}
