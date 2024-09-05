import { ITitleList,ITitleItem } from '../../model/homeData'
import { rvp } from '../../utils/responsive'

@Component
export default struct TitleList {
  @Prop titleList:ITitleList = []
  build() {
    Row({space:rvp(34)}){
      ForEach(this.titleList,(item:ITitleItem)=>{
        Column(){
          Image(item.imageURL).width(rvp(148)).height(rvp(57))
          Row(){
            Text(item.title)
              .fontSize(rvp(10))
              .fontColor($r('app.color.black'))
              .margin({right:5}).backgroundColor('blue')
            Text(item.sub_title)
              .fontSize(rvp(10))
              .fontColor($r('app.color.gary')).backgroundColor('red')
          }.margin({top: rvp(10)}).justifyContent(FlexAlign.Start)
        }
      },(item:ITitleItem)=>item.id+'')
    }
    .width('100%')
    .margin({top:rvp(12)})
  }
}