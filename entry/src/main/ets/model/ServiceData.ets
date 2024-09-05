export interface IVipServiceItem {
  name:string,
  content:number
}
export type IVipServiceList  = IVipServiceItem[]

export interface IHomeServiceItem {
  icon:string,
  title:string
}

export type IHomeServiceList = IHomeServiceItem[]

export interface IServiceActivity {
  name?: string,
  img?: string,
  title?: string,
  subTitle?: string
}

export interface INewcomerZone {
  img?:string
}
export interface ICleaningServiceInfoItem {
  img: string,
  title: string,
  subTitle: string,
  originalPrice: string,
  priceAfterDiscounts: string
}
export type ICleaningServiceInfoList = ICleaningServiceInfoItem[]

export interface ServiceInfo {
  vipServiceList:IVipServiceList,
  homeServiceList:IHomeServiceList,
  serviceActivity:IServiceActivity,
  newcomerZone:INewcomerZone,
  cleaningServiceInfo:ICleaningServiceInfoList
}
export const units = ['元', '张', '项', '个'] // 单位