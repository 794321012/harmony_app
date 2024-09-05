import { PADDING } from '../../constants/Sizes'
import { rvp } from '../../utils/responsive'

@Component
export default struct NavBar {
  @StorageProp('topHeight') topHeight:number = 0

  build() {
    Row(){
      Text('请选择地址')
        .TextStyles(16, $r('app.color.white'))
        .margin({left:rvp(6), right:rvp(3)})
      Image($r('app.media.arrow_down')).imageStyles(6)
      Blank() // 填充剩余位置
      Column(){
        Image($r('app.media.message')).imageStyles(20).fillColor($r('app.color.white'))
        Text('消息').TextStyles(10,$r('app.color.white'))
      }
      Column(){
        Image($r('app.media.customer')).imageStyles(20).fillColor($r('app.color.white'))
        Text('行程').TextStyles(10,$r('app.color.white'))
      }.margin({left:rvp(28)})
    }
    .width('100%')
    .height(rvp(44))
    .padding({left:PADDING, right:PADDING})
    // .backgroundColor('red')
    // .margin({top:this.topHeight})
  }
}

@Extend(Image)
function imageStyles (size:number) {
  .width(rvp(size)).height(rvp(size)).objectFit(ImageFit.Fill)
}

@Extend(Text)
function TextStyles (size:number,color:Resource) {
  .fontSize(rvp(size)).fontColor(color)
}