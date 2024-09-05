import { INavItem, INavList } from '../../model/homeData'
import { rvp } from '../../utils/responsive'

@Component
export default struct NavList {
  @Prop navList: INavList

  build() {
    Column({  }) {
      Grid() {
          ForEach(this.navList, (nav: INavItem) => {
            GridItem() {
              Column(){
                Image(nav.imageURL).imageStyles(58,56)
                Text(nav.title).fontSize(rvp(12)).margin({top:rvp(6)})
              }
            }.height(58)
          }, (day: INavItem) => day.id + '')
      }
      .width('100%').height(rvp(190))
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .columnsGap(rvp(32))
    }
  }
}

@Extend(Image)
function imageStyles (w:number, h:number){
  .width(rvp(w)).height(rvp(h)).objectFit(ImageFit.Fill)
}