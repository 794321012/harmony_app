import { IVipServiceList, IVipServiceItem,units} from '../../model/ServiceData'
import { rvp } from '../../utils/responsive'

@Component
export default struct Vip {
  @Prop vipServiceList:IVipServiceList = []
  build() {
    Column(){
      Row(){
        Image($r('app.media.crown')).imageStyle(18,18).margin({
          left: rvp(39),
          right: rvp(19)
        })
        Text('开通谷粒卡享特权').textStyle(16, $r('app.color.white')).layoutWeight(1)
        Image($r('app.media.vip')).imageStyle(42, 18).margin({right:rvp(41)})
      }.margin({top:rvp(13),bottom:rvp(16)})

      Row(){
        ForEach(this.vipServiceList,(item:IVipServiceItem, index:number) => {
          Column(){
            Text(item.name).textStyle(12,$r('app.color.white'))
            Text(){
              Span(item.content + '').fontSize(rvp(16)).fontColor($r('app.color.white'))
              Span(units[index]).fontSize(rvp(10)).fontColor($r('app.color.white'))
            }.margin({
              top:rvp(4)
            })
          }
        },(item:IVipServiceItem,index) => index + '_' +item.name )
      }.width('100%').justifyContent(FlexAlign.SpaceEvenly)
    }
    .width(rvp(328)).height(rvp(99)).backgroundImage($r('app.media.vip_bg'))
  }
}

@Extend(Image)
function imageStyle(w:number,h:number ) {
  .width(rvp(w)).height(rvp(h)).objectFit(ImageFit.Fill)
}
@Extend(Text)
function textStyle(fc:number, color:Resource) {
  .fontSize(rvp(fc)).fontColor(color)
}
@Extend(Text)
function spanStyle(fc:number, color:Resource) {
  .fontSize(rvp(fc)).fontColor(color)
}