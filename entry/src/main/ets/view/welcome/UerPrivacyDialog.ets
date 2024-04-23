@Preview
@CustomDialog
export default struct UserPrivacyDialog {
  controller:CustomDialogController
  @State statement : string ="欢迎来到我们的应用！在您开始使用之前，请先阅读我们的隐私政策和用户条款。您的使用行为将被视为对以下内容的同意：我们非常重视用户的隐私和数据安全。我们的隐私政策详细说明了我们如何收集、使用、共享和保护您的个人信息。我们承诺采取一切合理的措施保护您的隐私。同时，请您了解并同意，在您使用本应用的过程中，我们可能会收集您的个人信息，如姓名、电子邮件地址、地理位置等，用于提供和改进我们的服务。我们将严格遵守相关法律法规，仅在必要的范围内使用您的个人信息，并保证不会向任何第三方透露您的个人信息。如果您对我们的隐私政策或用户条款有任何疑问或建议，请随时联系我们。点击“同意并继续”按钮即表示您已阅读并同意我们的隐私政策和用户条款，并允许我们收集和处理您的个人信息。"
  confirm :()=>void;
  cancel:()=>void;
  build() {
    Column({space:10}) {
      Text("欢迎使用卡图carto")
        .fontSize(20)
        .fontWeight(700)
      ;
      Text(this.statement)
      Row({space:5}){
        Button("同意")
          .width(150)
          .backgroundColor('#2474b5')
          .onClick(()=>{
            this.confirm();
            this.controller.close()
          })
        Button("拒绝")
          .width(150)
          .backgroundColor('#2474b5')
          .onClick(()=>{
            this.cancel();
            this.controller.close()
          })
      }
    }
    .width('100%')
    .padding(10)
  }
}