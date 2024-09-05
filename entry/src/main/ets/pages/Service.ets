import ScrollContainer  from '../components/ScrollContainer/Index'
import http, { IResponse } from '../utils/http'
import { ServiceInfo,
  IVipServiceList,
  IHomeServiceList,
  IServiceActivity,
  INewcomerZone,
  ICleaningServiceInfoList
} from '../model/ServiceData'
import Bg from '../views/Service/Bg'
import NavBar from '../views/Service/NavBar'
import Vip from '../views/Service/Vip'
import Family from '../views/Service/Family'
import ServiceCalendar from '../views//Service/ServiceCalendar'
import ServiceTabs from '../views/Service/ServiceTabs'
import { rvp } from '../utils/responsive'
import CleanHome from '../views/Service/CleanHome'

@Component
export default struct Service{
  @State vipServiceList:IVipServiceList = []
  @State homeServiceList:IHomeServiceList = []
  @State serviceActivity:IServiceActivity = {}
  @State newcomerZone:INewcomerZone = {}
  @State cleaningServiceInfo:ICleaningServiceInfoList = []

  aboutToAppear(): void {
    this.getServiceList()
  }

  async getServiceList(){
    const ret:IResponse<ServiceInfo> = await http({ method: 'get', url: '/service/info'})
    console.log('/service/info :', JSON.stringify(ret))
    this.vipServiceList = ret.data?.vipServiceList
    this.homeServiceList = ret.data?.homeServiceList
    this.serviceActivity = ret.data?.serviceActivity
    this.newcomerZone = ret.data.newcomerZone
    this.cleaningServiceInfo = ret.data.cleaningServiceInfo
  }

  @Builder
  navBuilder(){
      NavBar()
  }

  @Builder
  contentBuilder(){
    Stack(){
      Bg().zIndex(-1)
      Vip({vipServiceList:this.vipServiceList})

    }.width('100%')
    Column(){
      Family({homeServiceList:this.homeServiceList})
      ServiceCalendar({serviceActivity:this.serviceActivity})
      ServiceTabs({newcomerZone:this.newcomerZone})
      CleanHome({cleaningServiceInfo:this.cleaningServiceInfo})
    }
    .height('100%')
    .backgroundColor($r('app.color.bg_gary'))
    .padding({left: rvp(16),right: rvp(16),top: rvp(20),bottom: rvp(200)})

  }
  build(){
    ScrollContainer({
      navBuildParam:() => {this.navBuilder()},
      contentBuildParam:() => {this.contentBuilder()}
    })
  }
}