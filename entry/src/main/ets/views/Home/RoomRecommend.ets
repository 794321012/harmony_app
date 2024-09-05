import { PADDING } from '../../constants/Sizes'
import { IRoomRecommend,
  IRoomRecommendItem,
  IRoomRecommendList,
  ITagsItem, RoomRecommendDataSource } from '../../model/RoomRecommendData'
import http,{IResponse} from '../../utils/http'
import { rvp } from '../../utils/responsive'

@Component
export default struct RoomRecommend {
  @State List:RoomRecommendDataSource = new RoomRecommendDataSource()
  aboutToAppear(): void {
    this.getRoomRecommendList()
  }

  async getRoomRecommendList (){
    const ret:IResponse<IRoomRecommend> = await http({method:'get',url:'/house/nearbyHouses'})
    Array.isArray((ret?.data)) && this.List.setList(ret?.data)

  }

  build() {
    Column({space:20}){
      this.RoomList()
    }
    .width('100%')
    .backgroundColor($r('app.color.bg_gary'))
    .padding(PADDING)
  }

  @Builder
  RoomList(){
    Grid(){
      LazyForEach(this.List,(item:IRoomRecommendItem) => {
        GridItem() {
          Stack(){
            Column() {
              Image(item.housePicture)
                .width('100%').height(rvp(120))
                .objectFit(ImageFit.Fill)
                .borderRadius({ topLeft: rvp(8), topRight: rvp(8) })
              Row() {
                Text(item.rentPriceListing + item.rentPriceUnit).fontSize(rvp(14)).fontColor('#E03810')
                Text(item.rentArea + 'm')
                  .fontSize(rvp(12))
                  .fontColor($r('app.color.gary'))
                  .flexGrow(1)
                  .flexShrink(1)
                  .flexBasis(1)
                  .textAlign(TextAlign.End)
              }
              .width('100%')
              .padding({
                left: rvp(10),
                right: rvp(10),
                top: rvp(11),
                bottom: rvp(6)
              })
              Text(item.houseTitle)
                .fontSize(rvp(12))
                .fontColor($r('app.color.black'))
                .width('100%')
                .padding({ left: rvp(10), right: rvp(10) })
                .maxLines(1)
              // .textOverflow({ overflow: TextOverflow })
              Row({ space: rvp(6) }) {
                ForEach(item.tags.slice(0, 2), (v: ITagsItem, index: number) => {
                  Text(v.name)
                    .borderRadius(rvp(2))
                    .padding({
                      top: rvp(2),
                      bottom: rvp(2),
                      left: rvp(6),
                      right: rvp(6)
                    })
                    .fontSize(rvp(10))
                    .fontColor(index === 0 ? $r('app.color.white') : '#B3B3B3')
                    .backgroundColor(index === 0 ? '#36D1A1' : $r('app.color.bg_gary'))

                }, (index: number) => index + 'key')
              }.width('100%').padding({ left: rvp(10), right: rvp(10) }).margin({ top: rvp(10), bottom: rvp(10) })
              .justifyContent(FlexAlign.Start)
            }
            Row(){
              Image($r('app.media.location')).width(rvp(12)).height(rvp(12))
                .margin({left:rvp(6)})
              Text(item.address).fontSize(rvp(10)).fontColor($r('app.color.white'))
                .width('100%').margin({left:rvp(4)})
            }.justifyContent(FlexAlign.Start).margin({bottom:rvp(-10)})
          }
        }
        .width(rvp(160))
        .backgroundColor($r('app.color.white'))
        .borderRadius(rvp(8))
      },(item:IRoomRecommendItem) => item.id )
    }
    .columnsGap(rvp(8))
    .rowsGap(rvp(8))
  }

}
