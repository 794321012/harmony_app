import { IAd } from '../../model/homeData'
import { rvp } from '../../utils/responsive'

@Component
export default struct Ad {
  @Prop adPicture:IAd = ''
  build() {
    Row(){
      Image(this.adPicture).width('100%').height('100%')
    }.width(rvp(328)).height(rvp(61))

  }
}