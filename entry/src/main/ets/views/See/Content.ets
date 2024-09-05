import { rvp } from '../../utils/responsive'

@Component
export default struct Content {
  build() {
    Column(){
      Row(){
        Image($r('app.media.find_room')).imageStyles(60, 30)
          .margin({ top: rvp(49),left: rvp(14),bottom:rvp(20) })
      }.width('100%')
      .justifyContent(FlexAlign.Start)
      Text("发现你想看的房子").TextStyles(rvp(12), $r('app.color.black'))
        .width('100%')
        .margin({left:rvp(20),bottom:7})
      Image($r('app.media.blank')).imageStyles(234,221)
      Text("暂无想看房源，试试如下找房方式").TextStyles(16, $r('app.color.black'))
        .margin({top:rvp(10),bottom:rvp(20)})
      Row(){
        Row(){
          Column(){
            Image($r('app.media.bus')).imageStyles(34,34)
          }
          Column(){
            Text("通勤找房").TextStyles(14,$r('app.color.black'))
            Text("按公司通勤时长找房").TextStyles(10,$r('app.color.gary'))
          }
        }
        Row(){
          Column(){
            Image($r('app.media.map')).imageStyles(34,34)
          }
          Column(){
            Text("地图找房").TextStyles(14,$r('app.color.black'))
            Text("在你想住的地方找房").TextStyles(10,$r('app.color.gary'))
          }
        }
      }.width(rvp(328)).height(rvp(80)).border({width:1,radius:rvp(6)})
      .justifyContent(FlexAlign.SpaceEvenly)
    }.width('100%').height('100%')
    // .backgroundColor($r('app.color.white'))
    // .alignItems(HorizontalAlign.Center)
  }
}

@Extend(Image)
function imageStyles (width:number, height:number) {
  .width(rvp(width)).height(rvp(height)).objectFit(ImageFit.Fill)
}

@Extend(Text)
function TextStyles (size:number,color:Resource) {
  .fontSize(rvp(size)).fontColor(color)
}