import type { bannerItem,BannerListDataSource } from '../../model/homeData'
import { rvp } from '../../utils/responsive'

@Component
export default struct SwiperLayout {
  @StorageProp('topHeight') topHeight:number = 0
  @ObjectLink bannerList:BannerListDataSource
  build() {
    Column() {
      Swiper() {
        LazyForEach(this.bannerList, (banner:bannerItem) => {
          Image(banner.imageURL).width('100%').height('100%').objectFit(ImageFit.Fill)
        },(item:bannerItem) => '' + item.id )
      }.loop(true).width('100%').height(rvp(211-36) + rvp(this.topHeight))
      .indicator(Indicator.dot().color('#CCCBCB').selectedColor('#000'))
    }
  }
}
