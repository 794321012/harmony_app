import { IPlanItem, IPlanList } from '../../model/homeData'
import { rvp } from '../../utils/responsive'

@Component
export default struct PlanList {
  @Prop planList:IPlanList = []
  build() {
    Row({space:5}){
      ForEach(this.planList, (item:IPlanItem)=>{
        Image(item.imageURL)
          .width(rvp(78))
          .height(rvp(60))
      },(item:IPlanItem)=> item.id+'')
    }
  }
}