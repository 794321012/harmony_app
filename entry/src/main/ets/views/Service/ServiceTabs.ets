import { rvp } from '../../utils/responsive'
import { INewcomerZone } from '../../model/ServiceData'
@Component
export default struct ServiceTabs {
  tabs:ITabs[] = [
    { name:'会员精选', des:'专业服务' },
    { name:'居家保洁', des:'解放双手' },
    { name:'深层清洗', des:'高温蒸洗' },
    { name:'新居乔迁', des:'一站搬家' },
  ]
  @State active:number = 0
  @Prop newcomerZone:INewcomerZone = {}
  build() {
    Column(){
      Row() {
        ForEach(this.tabs, (item: ITabs, index:number) => {
          Column() {
            Text(item.name).textStyle(14, $r('app.color.black'),700)
            Text(item.des).textStyle(12, $r('app.color.gary_second'),500).margin({top:rvp(4),bottom:rvp(2)})
            Column() {}
            .width( index === this.active ? rvp(20): 0)
            .height(rvp(4))
            .borderRadius(rvp(9))
            .backgroundColor('#51BB9E')
          }.onClick(() => {
            this.active = index
          })
        }, (item: ITabs) => item.name)
      }.width('100%').justifyContent(FlexAlign.SpaceAround)
      Column(){
        Text(){
          Span('新人').spanStyle(16, $r('app.color.black'),700)
          Span('专区').spanStyle(16, '#36D1A1',700)
        }.width('100%').padding({bottom:rvp(8)})
        Image(this.newcomerZone.img).imageStyle(312, 90)
      }
      .borderRadius(rvp(8))
      .backgroundColor($r('app.color.white'))
      .padding(rvp(8))
    }
  }
}

interface ITabs {
  name:string,
  des:string
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