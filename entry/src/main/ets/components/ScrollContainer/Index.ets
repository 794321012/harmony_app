import { IColor } from '../../model/homeData'

@Component
export default struct Index {
  @StorageProp('topHeight') topHeight:number = 0
  @BuilderParam navBuildParam:($$:IColor) => void = this.customBuilder
  @BuilderParam contentBuildParam:() => void = this.customBuilder

  @Builder
  customBuilder() {}

  scrollY:number = 0
  @State bgColor:string = 'rgba(255, 255, 255, 0)'
  @State fontColor:string = 'rgba(255, 255, 255, 1)'
  handleScroll = (xOffset:number, yOffset:number) => {
    this.scrollY += yOffset
    // console.log('scrollY:', JSON.stringify(this.scrollY));
    if (this.scrollY < 0) {
      this.scrollY = 0
    }
    this.calcColor()
  }
  calcColor = () => {
    if (this.scrollY < 10) {
      // 到达顶部渐变开始
      this.bgColor = 'rgba(255, 255, 255, 0)'
      this.fontColor = 'rgba(255, 255, 255, 1)'
    } else if ( 30 < this.scrollY && this.scrollY < 100) {
      // 渐变中透明度（ 0 -> 1）
      const colorOpacity = (this.scrollY - 10) / (100 - 10)
      this.bgColor = `rgba(255, 255, 255, ${colorOpacity})`
      this.fontColor = `rgba(0, 0, 0, ${colorOpacity})`
    } else {
      // 渐变完成
      // this.bgColor = 'rgba(255, 255, 255,1)'
      this.fontColor = 'rgba(0,0,0,1)'
    }
  }

  build() {
    Stack(){
      Scroll(){
        Column(){
          // SwiperLayout({ bannerList:this.bannerList })
          // Column(){
          //   NavList({navList:this.navList}) // 导航 nav
          //   TitleList({titleList:this.titleList}) // 广告 titleList
          //   PlanList({planList:this.planList}).margin({top:18}) // 计划 planlist
          //   Ad({adPicture:this.adPicture}).margin({top:9}).borderWidth(1) // 广告 adpicture
          //   SubTitle({ title:'周边房源' }).margin({top:23})
          // }.padding({left:PADDING,right:PADDING})
          // RoomRecommend() // 更多房源
          this.contentBuildParam()
        }
      }
      .scrollBar(BarState.Off)
      .onDidScroll(this.handleScroll)
      // SearchBar({bgColor:this.bgColor , fontColor:this.fontColor})
      Column(){
        this.navBuildParam({ fontColor:this.fontColor})
      }.width('100%').backgroundColor(this.bgColor).padding({top:this.topHeight})
    }
    .width('100%')
    .height('100%')
    .alignContent(Alignment.TopStart)
  }
}
