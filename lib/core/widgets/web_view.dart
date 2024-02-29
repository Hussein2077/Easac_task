import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class WebView extends StatefulWidget {
  final String url ;
  final String title ;
  const WebView({required this.url,required this.title, Key? key}) : super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView>  with AutomaticKeepAliveClientMixin{
  WebViewController?  controller;


  @override
  bool get wantKeepAlive => false;
  @override
  void initState() {
    super.initState();


    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {

          },
          onPageFinished: (String url) {
          },
          onWebResourceError: (WebResourceError error) {},
          onUrlChange: (UrlChange){
            if (UrlChange.url!.contains('reference_id')) {
              controller!.
              runJavaScriptReturningResult("(function(){Flutter.postMessage(window.document.body.innerText)})();");
            }
          },
          onNavigationRequest: (NavigationRequest request) {
            //todo handle that
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )..addJavaScriptChannel('Flutter',
          onMessageReceived: (JavaScriptMessage message) {
            final pageBody = jsonDecode(message.message);
            if(pageBody['status'] == 'SUCCESS'){
            }
            else if (pageBody['status'] =='FAIL'){

            }
            else{

            }
          })
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  void dispose() {
    controller?.clearCache(); // Clear the WebView cache.
    controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:Text(widget.title ),
        backgroundColor:Colors.purpleAccent ,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: WebViewWidget(controller: controller!),
    );
  }


}
