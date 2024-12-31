// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:siansa_app/ui/widgets/my_app_bar.dart';
// import 'package:siansa_app/ui/widgets/app_widgets/animations/loading_animation.dart';

// class AppOpenWebView extends StatelessWidget {
//   final String url;
//   final String text;
//   final String text2;
//   final Color textColor;
//   final double fontSize;
//   final FontWeight fontWeight;
//   final String appBarTitle;

//   const AppOpenWebView({
//     super.key,
//     this.url = 'https://google.com',
//     this.text = 'Tap to Web View',
//     this.text2 = '',
//     this.textColor = const Color.fromRGBO(0, 0, 0, 1),
//     // this.fontSize = 16,
//     // this.fontWeight = FontWeight.w600,
//     this.fontSize = 24,
//     this.fontWeight = FontWeight.w100,
//     this.appBarTitle = '',
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         InkWell(
//           onTap: () {
//             _openWebView(
//               context,
//               url,
//               appBarTitle,
//             );
//           },
//           child: Container(
//               // margin: const EdgeInsets.symmetric(vertical: 20),
//               padding: const EdgeInsets.all(5),
//               alignment: Alignment.bottomCenter,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     text,
//                     style: TextStyle(
//                       color: textColor,
//                       fontSize: fontSize,
//                       fontWeight: fontWeight,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     text2,
//                     style: TextStyle(
//                       color: Colors.blue[900],
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               )),
//         ),
//       ],
//     );
//   }

//   void _openWebView(BuildContext context, String url, title) {
//     final controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             AppLoadingAnimation();
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           onWebResourceError: (WebResourceError error) {
//             debugPrint('''
// Page resource error:
//   code: ${error.errorCode}
//   description: ${error.description}
//   errorType: ${error.errorType}
//   isForMainFrame: ${error.isForMainFrame}
//           ''');
//           },
//           onNavigationRequest: (NavigationRequest request) {
//             // if (request.url.startsWith(url)) {
//             //   return NavigationDecision.prevent;
//             // }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(url));

//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => Scaffold(
//           appBar: MyAppBar(title: title),
//           body: WebViewWidget(controller: controller),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_app_bar.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_animations/app_loading_animation.dart';

class AppOpenWebView extends StatelessWidget {
  final String url;
  final String text;
  final String text2;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String appBarTitle;

  const AppOpenWebView({
    Key? key,
    this.url = 'https://google.com',
    this.text = 'Tap to Web View',
    this.text2 = '',
    this.textColor = const Color.fromRGBO(0, 0, 0, 1),
    this.fontSize = 24,
    this.fontWeight = FontWeight.w100,
    this.appBarTitle = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => _openWebView(context, url, appBarTitle),
          child: Container(
            padding: const EdgeInsets.all(5),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                  ),
                ),
                const SizedBox(width: 5),
                if (text2.isNotEmpty) // Conditionally show the second text
                  Text(
                    text2,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _openWebView(BuildContext context, String url, String title) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // You can show a loading animation here, if needed
            AppLoadingAnimation();
          },
          onPageStarted: (String url) {
            // Optionally handle when the page starts loading
          },
          onPageFinished: (String url) {
            // Optionally handle when the page finishes loading
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
            ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            // Here you can control whether to allow navigation
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: MyAppBar(title: title),
          body: WebViewWidget(controller: controller),
        ),
      ),
    );
  }
}
