export interface danMuList1_item{
  "avatar": string,
  "content": string
}
export type danMuList1_List = danMuList1_item[]

export interface danMuList2_item{
  "avatar": string,
  "content": string
}
export type danMuList2_List = danMuList2_item[]

export interface IMainPost {
  "followerNum": number,
  "title": string,
  "userAvatar": string,
  "userName": string,
  "postContent": string
}
export interface IContentBlockItem {
  img:string
}
export type IContentBlockList  = IContentBlockItem[]
export interface IPostZone {
  mainPost?: IMainPost,
  contentBlockList?:IContentBlockList
}

export interface IBenefitsItem {
  img:string,
  title:string
}

export type IBenefitsList = IBenefitsItem[]

export interface DiscoverInfo {
  danMuList1:danMuList1_List,
  danMuList2:danMuList2_List,
  postZone?:IPostZone,
  benefits:IBenefitsList
}