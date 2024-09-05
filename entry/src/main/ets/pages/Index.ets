import Home from './Home'
import See from './See'
import Service from './Service'
import Discover from './Discover'
import My from './My'

@Entry
@Component
struct Index {
  //当前高亮
  @State currentIndex:number = 2
  // 生成 tab 的函数
  @Builder TabBarBuildr( index:number, text:string, icon:Resource, activeIcon:Resource ){
    Column(){
      // 高频使用的颜色，大小会定义成常量，方便将来管理。不常用的直接写死。
      Image(this.currentIndex === index ? activeIcon:icon).width(28)
      Text(text).fontSize(10).fontColor( this.currentIndex === index ?  $r('app.color.black') :'#a0a0a0').height(15)
    }.width('100%').height('100%').justifyContent(FlexAlign.Center)
  }
  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, index: this.currentIndex }) {
        TabContent() {
          Home()
        }.tabBar(this.TabBarBuildr(0, '首页', $r("app.media.tab_bar_home"), $r("app.media.tab_bar_home_active")))

        TabContent() {
          See()
        }.tabBar(this.TabBarBuildr(1, '想看', $r("app.media.tab_bar_see"), $r("app.media.tab_bar_see_active")))

        TabContent() {
          Service()
        }.tabBar(this.TabBarBuildr(2, '服务', $r("app.media.tab_bar_service"), $r("app.media.tab_bar_service_active")))

        TabContent() {
          Discover()
        }.tabBar(this.TabBarBuildr(3, '发现', $r("app.media.tab_bar_discover"), $r("app.media.tab_bar_discover_active")))

        TabContent() {
          My()
        }.tabBar(this.TabBarBuildr(4, '我的', $r("app.media.tab_bar_my"), $r("app.media.tab_bar_my_active")))
      }
      .vertical(false)
      .barMode(BarMode.Fixed)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .barHeight(50) // 设置 tab 栏的高度，默认是 56
      .scrollable(false) // 禁止左右滑动
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.white'))
    }.height('100%') // 设置外部高度 100%
  }
}

