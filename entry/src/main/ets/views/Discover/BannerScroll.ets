import { rvp } from '../../utils/responsive';

import type { danMuList1_item, danMuList1_List } from '../../model/DiscoverData';

@Component
export default struct BannerScroll {
  @Prop bannerList: danMuList1_List;

  build() {
    List() {
      ForEach(this.bannerList, (banner: danMuList1_item) => {
        ListItem() {
          Row({ space: rvp(6) }) {
            Image(banner.avatar).width(rvp(24)).height(rvp(24)).objectFit(ImageFit.Fill).borderRadius(rvp(24))
            Text(banner.content).fontSize(rvp(14))
          }
          .padding({
            top: rvp(6),
            left: rvp(6),
            bottom: rvp(6),
            right: rvp(10)
          })
          .borderRadius(rvp(42))
          .backgroundColor('#CDFFD9')
          .margin({ left: rvp(10) })
        }
      }, (banner: danMuList1_item, index) => JSON.stringify(banner) + index)
    }
    .listDirection(Axis.Horizontal) // 排列方向
    .edgeEffect(EdgeEffect.None) // 滑动到边缘无效果
    .width('100%')
    .scrollBar(BarState.Off)
  }
}
