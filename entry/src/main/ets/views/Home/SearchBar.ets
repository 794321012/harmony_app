import { PADDING } from '../../constants/Sizes'
import { rvp } from '../../utils/responsive'

@Component
export default struct SearchBar {
  @Prop fontColor:string

  build() {
    Row({ space: PADDING }){
      Text('北京').fontSize(rvp(14)).fontColor(this.fontColor)
      // Text(this.fontColor)
      Stack(){
        TextInput()
          .width(rvp(244)).height('100%').backgroundColor($r('app.color.white'))
          .border({ width:1, color:$r('app.color.gary') })
        Row(){
          Image($r('app.media.search')).imageStyles(rvp(18))
          Text('公司/地铁/小区，马上搜索')
            .fontSize(rvp(10))
            .fontColor($r('app.color.gary'))
            .margin({left:rvp(10), right:rvp(32)})
          Column().width(1).height(rvp(18)).backgroundColor('#7D7D7D').margin({right:PADDING})
          Image($r('app.media.position')).imageStyles(rvp(18))
        }.width(rvp(244)).padding({left:rvp(PADDING),right:rvp(PADDING)})
      }
      Image($r('app.media.message')).imageStyles(rvp(24)).fillColor(this.fontColor)
    }
    .width('100%')
    .height(rvp(38))
    .padding({ left:PADDING, right:PADDING,top:4 ,bottom:4})
  }
}

/*
 * @Styles: 用来定义复用样式
 * @Extend: 用来扩展组件样式（ 只有这个组件可以使用 ）
 *
 * @styles 和 @Extend 都可以用来复用样式，有什么区别
 *  1. @Styles 只支持通用属性和通用事件。@Extend 即通用属性和通用事件，
 *      也支持之定义组件私有属性与事件
 *  2. @Styles 不支持传参。@Extend 支持传参（更灵活）
 *  3. Styles 可以定义组件内或者全局。@Extend 只支持
 *
 * 注意: 全局指的是当前文件内生效。不是真正的全局
 *
 * */

@Extend(Image)
function imageStyles(size: number) {
  .width(size).height(size).objectFit(ImageFit.Fill)
}
@Styles
function textInputStyles() {
.backgroundColor('#fff')
}