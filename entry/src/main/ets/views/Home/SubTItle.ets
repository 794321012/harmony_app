import { rvp } from '../../utils/responsive'

@Component
export default struct SubTitle {
  @Prop title:string = ''
  build() {
    Row(){
      Text(this.title).fontSize(rvp(16)).fontColor($r('app.color.black'))
      Text('推荐').fontSize(rvp(16)).fontColor('#36D1A1')
      Text('更多推荐')
        .fontSize(rvp(10))
        .fontColor($r('app.color.gary_second'))
        .margin({right:rvp(6)})
        .layoutWeight(1)
        // .flexGrow(1)
        // .flexShrink(1)
        // .flexBasis(1)
        .textAlign(TextAlign.End)
      Image($r('app.media.arrow_right')).width(rvp(4)).height(rvp(8))
    }.width('100%').height(rvp(44))
  }
}