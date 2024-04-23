import web_webview from '@ohos.web.webview';

@Entry
@Component
struct WebComponent {
  build() {
    Column() {
      Web({ src: $rawfile('local_map.html'), controller: new web_webview.WebviewController()})
        .backgroundColor(Color.Orange)
        .javaScriptAccess(true)
        .zoomAccess(false)
      Text("hello world")
        .backgroundColor(Color.Blue)
    }

  }
}