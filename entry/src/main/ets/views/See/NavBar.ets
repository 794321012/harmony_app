import { PADDING } from '../../constants/Sizes'

@Component
export default struct NavBar {
  @StorageProp('topHeight') topHeight:number = 0
  build() {
    Row(){
      Image($r('app.media.bag')).imageStyles(16)
      Text('填写通勤地址')
        .TextStyles(12, $r('app.color.black'))
        .layoutWeight(1) // web 中 flex：1 的 效果
        // .flexGrow(1).flexShrink(1).flexBasis(1)
        .margin({left:6})
      Column(){
        Image($r('app.media.message')).imageStyles(20)
        Text('消息').TextStyles(10,$r('app.color.black'))
      }
      Column(){
        Image($r('app.media.journey')).imageStyles(20)
        Text('行程').TextStyles(10,$r('app.color.black'))
      }.margin({left:28})
    }
    .width('100%')
    .height(44)
    .padding({left:PADDING, right:PADDING})
    // .margin({top:this.topHeight})
  }
}

@Extend(Image)
function imageStyles (size:number) {
  .width(size).height(size).objectFit(ImageFit.Fill)
}

@Extend(Text)
function TextStyles (size:number,color:Resource) {
  .fontSize(size).fontColor(color)
}