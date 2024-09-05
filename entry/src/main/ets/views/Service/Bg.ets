import { rvp } from '../../utils/responsive'

@Component
export default struct Bg {
  @StorageProp('topHeight') topHeight:number = 0
  build() {
    Stack(){
        Image($r('app.media.service_bg')).width('100%')
          // .height(rvp(211 - 36) + this.topHeight)
          .height(rvp(211 - 36))
          .objectFit(ImageFit.Fill)
        Image($r('app.media.arrow_down_2')).imageStyle(10, 3).margin({bottom:rvp(12)})
    }
    .width('100%')
    .alignContent(Alignment.Bottom)
    // .backgroundColor('red')
  }
}

@Extend(Image)
function imageStyle(w:number,h:number ) {
  .width(rvp(w)).height(rvp(h)).objectFit(ImageFit.Fill)
}