import http,{IResponse} from '../utils/http'
import { BannerListDataSource, HomeInfo , IAd,INavList, IPlanList, ITitleList,IColor} from '../model/homeData'
import { PADDING } from '../constants/Sizes'
import SwiperLayout from '../views/Home/SwiperLayout'
import SearchBar from '../views/Home/SearchBar'
import NavList from '../views/Home/NavList'
import TitleList from '../views/Home/TitleList'
import PlanList from '../views/Home/PlanList'
import Ad from '../views/Home/Ad'
import SubTitle from '../views/Home/SubTItle'
import RoomRecommend from '../views/Home/RoomRecommend'
import ScrollContainer from '../components/ScrollContainer/Index'
import { rvp } from '../utils/responsive'

@Component
export default struct Home{
  @StorageProp('topHeight') topHeight:number = 0
  @State bannerList:BannerListDataSource = new BannerListDataSource()
  @State navList:INavList = []
  @State titleList:ITitleList = []
  @State planList:IPlanList = []
  @State adPicture:IAd = ''
  // 组件生命周期
  aboutToAppear(): void {
    this.getHomeInfo()
  }

  async getHomeInfo(){
    const ret: IResponse<HomeInfo> =  await http({ method : 'get', url : 'home/info' })
    console.log('ret: ++++++++', JSON.stringify(ret));
    this.bannerList.setList(ret.data?.bannerList || [])
    this.navList = ret.data?.navList || []
    this.titleList = ret.data?.tileList || []
    this.planList = ret.data?.planList || []
    this.adPicture = ret.data?.adPicture || ''
  }

  @Builder
  navBuilder($$:IColor){
    SearchBar({ fontColor:$$.fontColor })
  }
  @Builder
  contentBuilder(){
    // Builder 是一个普通函数 this 指向 window ；在引用处需要箭头函数包裹
    SwiperLayout({ bannerList:this.bannerList })
    Column(){
      NavList({navList:this.navList}) // 导航 nav
      TitleList({titleList:this.titleList}) // 广告 titleList
      PlanList({planList:this.planList}).margin({top: rvp(18)}) // 计划 planList
      Ad({adPicture:this.adPicture}).margin({top: rvp(9)}).borderWidth(1) // 广告 adPicture
      SubTitle({ title:'周边房源' }).margin({top: rvp(23)})
    }.padding({left:PADDING,right:PADDING})
    RoomRecommend() // 更多房源
  }

  build(){
    ScrollContainer({
      navBuildParam: ($$) =>{ this.navBuilder($$)},
      contentBuildParam: () => { this.contentBuilder() } // 箭头函数包裹
    })
  }
}