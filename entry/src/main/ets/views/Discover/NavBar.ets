import { rvp } from '../../utils/responsive'
@Component
export default struct NavBar {
  @StorageProp('topHeight') topHeight:number = 0
  @Prop bgColor:string = ''
  build() {
    Row(){
      Text('家庭服务')
        .TextStyles(18, $r('app.color.black'), 700)
        .layoutWeight(1)
      Image($r('app.media.autoboxing')).imageStyles(30)
    }
    .width('100%')
    .height(rvp(44))
    .padding({left:rvp(18), right:rvp(18)})
    .backgroundColor(this.bgColor)
  }
}

@Extend(Image)
function imageStyles (size:number) {
  .width(rvp(size)).height(rvp(size)).objectFit(ImageFit.Fill)
}

@Extend(Text)
function TextStyles (size:number,color:Resource,ft:number) {
  .fontSize(rvp(size)).fontColor(color).fontWeight(ft)
}