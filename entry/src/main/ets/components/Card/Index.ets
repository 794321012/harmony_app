import { BORDER_REDIUES } from '../../constants/Sizes'
import { rvp } from '../../utils/responsive'
interface padding {
  cardPadding:number
}
@Component
export default struct Card {
  @BuilderParam contentBuilderParam: () => void = this.customBuilder
  @Builder
  customBuilder (){}

  build() {
    Column(){
      this.contentBuilderParam()
    }
    .width('100%')
    .padding(rvp(8))
    .borderRadius(BORDER_REDIUES)
    .backgroundColor($r('app.color.white'))
  }
}