import { IServiceActivity } from '../../model/ServiceData'
import { rvp } from '../../utils/responsive'
import { getMonth,month }  from '../../utils/calender'
@Component
export default struct ServiceCalendar {
  @Prop serviceActivity:IServiceActivity = {}
  month:number = new Date().getMonth() + 1
  build() {
    Column(){
      Row(){
        Text('服务日历').textStyle(16,$r('app.color.black')).layoutWeight(1).fontWeight(700)
        Text('全部服务').textStyle(12,$r('app.color.gary')).margin({right:rvp(10)})
        Image($r('app.media.arrow_right')).imageStyle(rvp(4),rvp(9))
      }
      Row(){
        ForEach(getMonth,(item:number) => {
          Text(item < 10 ? `0${item}月`:`${item}月`)
            .padding({left:rvp(6),top:rvp(7),right:rvp(6),bottom:rvp(7)})
            .backgroundColor( item === month ? '#CDFFD9' : '')
            .borderRadius(rvp(4))
            .fontWeight(700)
        }, (item:number) => item + '')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({top:rvp(10), bottom:rvp(12)})
      Column(){
        Text(this.serviceActivity.name)
          .textStyle(14, $r('app.color.black'))
          .width('100%')
          .textAlign(TextAlign.Start)
          .margin({bottom:rvp(8), top:rvp(6)})
          .fontWeight(700)
        Row(){
          Image(this.serviceActivity.img).imageStyle(100,100)
          Column(){
            Text(this.serviceActivity.title).textStyle(14, $r('app.color.black'))
              .margin({bottom:rvp(8), top:rvp(8)}).fontWeight(500)
            Text(this.serviceActivity.subTitle).textStyle(12, $r('app.color.black'))
              .margin({left:rvp(-26)}).fontWeight(500)
          }.margin({left:rvp(10)})
          Row(){
            Text('立即参与').textStyle(12, '#1F632F')
          }
          .padding({left:rvp(11), top:rvp(5), right:rvp(11) ,bottom:rvp(5)})
          .backgroundColor('#CDFFD9').borderRadius(rvp(4))
          .margin({top:rvp(66)})
        }
        .alignItems(VerticalAlign.Top)
        .linearGradient({
          angle:210,
          colors:[['#D0FFDB', 0],['#FFFFFF', 0.3]]
        })
      }
    }
    .backgroundColor($r('app.color.white'))
    .padding(rvp(8))
    .margin({top:rvp(8)})
    .borderRadius(rvp(8))
  }
}

@Extend(Image)
function imageStyle(w:number,h:number ) {
  .width(rvp(w)).height(rvp(h)).objectFit(ImageFit.Fill)
}
@Extend(Text)
function textStyle(fc:number, color:Resource | string) {
  .fontSize(rvp(fc)).fontColor(color)
}