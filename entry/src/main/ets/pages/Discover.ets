import { DiscoverInfo ,danMuList1_List,danMuList2_List,IPostZone,IBenefitsList } from '../model/DiscoverData'
import http, { IResponse } from '../utils/http'
import { rvp } from '../utils/responsive'
import { IColor } from '../model/homeData'
import ScrollContainer from '../components/ScrollContainer/Index'
import NavBar from '../views/Discover/NavBar'
import Bg from '../views/Discover/Bd'
import BannerScroll from '../views/Discover/BannerScroll'
import Ad from '../views/Discover/Ad'
import welfare from '../views//Discover/welfare'
@Component
export default struct Discover{
  // @StorageProp('topHeight') topHeight:string = 0
  // @State bannerList:danMuList1_List = []
  @State danMuList1:danMuList1_List = []
  @State danMuList2:danMuList2_List = []
  @State postZone:IPostZone = {}
  @State benefits:IBenefitsList = []

  aboutToAppear(): void {
    this.getDiscoverDate()
  }

  async getDiscoverDate (){
    const ret:IResponse<DiscoverInfo> = await http({method:'get', url:'/discover/info'})
    console.log("JSON: ", JSON.stringify(ret));
    // this.bannerList = ret.data.danMuList1
    this.danMuList1 = ret.data.danMuList1
    this.danMuList2 = ret.data.danMuList2
    this.postZone = ret.data.postZone as IPostZone
    this.benefits = ret.data.benefits
  }

  @Builder
  navBuilder($$:IColor){
    // NavBar({bgColor:$$.bgColor})
    NavBar()
  }
  @Builder
  contentBuilder(){
    Stack(){
      Bg()
      Column() {
        Text('与100万用户发现生活').margin({ top: rvp(44), left: rvp(16) }).fontSize(rvp(14))
        Column({ space: rvp(16) }) {
          BannerScroll({ bannerList: this.danMuList1 })
          BannerScroll({ bannerList: this.danMuList2 })
        }.width('100%').margin({ top: rvp(20) })
        Ad({postZone:this.postZone})
        welfare({benefits:this.benefits})
      }.alignItems(HorizontalAlign.Start).padding({ top: rvp(20) })
    }.alignContent(Alignment.TopStart)
  }

  build(){
    ScrollContainer({
      navBuildParam:($$) => {this.navBuilder($$)},
      contentBuildParam:() => {this.contentBuilder()}
    })
  }
}
