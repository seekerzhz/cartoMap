import UserPrivacyDialog from '../view/welcome/UerPrivacyDialog';
import common from '@ohos.app.ability.common';
import preferences from '@ohos.data.preferences';
import PreferenceUtil from '../common/utils/PreferenceUtil';
//import Router from '@system.router';
import router from '@ohos.router';

const PREF_KEY = 'userPrivacyKey'
@Entry
@Component
struct WelcomePage {
  @State message: string = 'Hello World'
  context = getContext(this) as common.UIAbilityContext;
  controller:CustomDialogController = new CustomDialogController({
    builder: UserPrivacyDialog({
      confirm:()=>this.onConfirm(),
      cancel:() => this.ExApp()
    })
  })

  async aboutToAppear() {
    // 加载
    let isAgree = await PreferenceUtil.getPreferenceValue(PREF_KEY,false);
    if(isAgree) {
      // 跳转首页
      this.jumpToIndex();
    } else {
      this.controller.open()
    }
  }

  jumpToIndex() {
    setTimeout(() => {
      router.replaceUrl({
        url:'pages/Index'
      })
    },1000);
  }
  onConfirm() {
    // 保存
    PreferenceUtil.putPreferenceValue(PREF_KEY,true);
    // 跳转首页
    this.jumpToIndex();
  }

  ExApp() {
    //exit
    this.context.terminateSelf()
  }

  build() {
    Column({space:10}) {
      // 1. 中央slogan
      Row() {
        Image($r('app.media.home_slogan')).width(260);
      }
      .layoutWeight(1)
      // 2. logo
      Row(){
        Image($r('app.media.icon'))
          .width(30).opacity(0.8)
          .border({style:BorderStyle.Solid,radius:15 , color:Color.Black , width:3});
        Image($r('app.media.home_logo')).width(150);
      }
      // 3.文字描述
      Row() {
        // 卡图carto支持ipv6网络
        Text("卡图carto支持").fontSize(12).opacity(0.8).fontColor(Color.White)
        Text("IPv6")
          .fontSize(12).opacity(0.8).fontColor(Color.White)
          .border({style:BorderStyle.Solid,width:1,color:Color.White,radius:15})
          .padding({left:5,right:5})
        Text("网络").fontSize(12).opacity(0.8).fontColor(Color.White)
      }
      // 用户应自行负责确保他们的旅行计划符合目的地国家的法律要求和入境规定。
      Text("用户应自行负责确保他们的旅行计划符合目的地国家的法律要求和入境规定。")
        .fontSize(10).opacity(0.8).fontColor(Color.White)
      // 应用对于参与者因未遵守当地法律或规定而可能遭受的任何法律后果不承担责任。
      Text("应用对于参与者因未遵守当地法律规定而可能遭受的任何法律后果不承担责任。")
        .fontSize(10).opacity(0.8).fontColor(Color.White)
        .margin({bottom:35})
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.welcome_page_background'));
  }
}