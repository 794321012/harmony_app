import { IHomeServiceItem, IHomeServiceList } from '../../model/ServiceData'
import { rvp } from '../../utils/responsive'
import { rcp } from '@kit.RemoteCommunicationKit'

@Component
export default struct Family {
  @Prop homeServiceList:IHomeServiceList = []

  build() {
    Column(){
      Row(){
        Text('家庭服务').textStyle(16, $r('app.color.black')).lineHeight(rvp(19)).layoutWeight(1).fontWeight(700)
        Text('全部服务').textStyle(12, $r('app.color.gary')).lineHeight(rvp(19))
      }.width('100%').margin({top:rvp(2) ,bottom:rvp(20)})
      .padding({left:rvp(8), right:rvp(8)})
      Grid(){
        ForEach(this.homeServiceList, (item:IHomeServiceItem) => {
          GridItem(){
            Column(){
              Image(item.icon).imageStyle(24, 24)
              Text(item.title).textStyle(12, $r('app.color.black')).margin({top:10})
            }
          }
        },(item:IHomeServiceItem) => item.title)
      }
      .width('100%')
      .height(rvp(185))
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr')
      .rowsGap(rvp(10))
    }
    .borderRadius(rvp(8))
    .backgroundColor($r('app.color.white'))
    .padding({top:rvp(8), right:rvp(8), bottom:rvp(18), left:rvp(8)})
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