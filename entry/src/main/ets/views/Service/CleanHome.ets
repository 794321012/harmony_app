import { ICleaningServiceInfoItem, ICleaningServiceInfoList } from '../../model/ServiceData'
import { rvp } from '../../utils/responsive'

@Component
export default struct cleanHome {
  @Prop cleaningServiceInfo:ICleaningServiceInfoList = []
  build() {
    Column() {
      Text('洁净家').margin({ left:rvp(8), bottom: rvp(8) }).width('100%')
      Row({space:rvp(8)}) {
        ForEach(this.cleaningServiceInfo, (item: ICleaningServiceInfoItem) => {
          Row(){
          Column() {
            Image(item.img).imageStyle(152, 115)
            Text(item.title)
              .width('48%')
              .textAlign(TextAlign.Start)
              .textStyle(14, $r('app.color.black'), 700)
              .margin({ top: rvp(8), bottom: rvp(6) })
            Text(item.subTitle).textStyle(10, $r('app.color.gary_second'), 500)
              .width('48%')
              .textAlign(TextAlign.Start)
              .margin({bottom: rvp(10)})
            Row() {
              Text() {
                Span('到手价').spanStyle(10, $r('app.color.gary'),500)
                Span( '￥' + item.priceAfterDiscounts).spanStyle(10, $r('app.color.gary'),500)
                Span('￥' + item.originalPrice).spanStyle(10, $r('app.color.gary'),500)
              }.width('100%')
            }.width('48%')
          } }
        }, (item: ICleaningServiceInfoItem) => item.title)
      }
    }
    .width('100%')
    .borderRadius(rvp(8))
    .padding(rvp(8))
    .backgroundColor($r('app.color.white'))
    .justifyContent(FlexAlign.SpaceBetween)
  }
}


@Extend(Image)
function imageStyle(w:number,h:number ) {
  .width(rvp(w)).height(rvp(h)).objectFit(ImageFit.Fill)
}
@Extend(Text)
function textStyle(fc:number, color:Resource | string , fw?:string | number | FontWeight) {
  .fontSize(rvp(fc)).fontColor(color).fontWeight(fw)
}

@Extend(Span)
function spanStyle(fc:number, color:Resource | string , fw?:string | number | FontWeight) {
  .fontSize(rvp(fc)).fontColor(color).fontWeight(fw)
}