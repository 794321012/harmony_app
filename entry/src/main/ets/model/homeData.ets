// https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/ts-container-swiper-V5#onchange
// banner 轮播图
export interface bannerItem {
  id:number
  name: string
  imageURL:string
}
export type bannerList = bannerItem[]

// Basic BannerListDataSource of IDataSource to handle data listener
@Observed
export class BannerListDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private bannerList: bannerList = [];

  // 获取列表总长度
  public totalCount(): number {
    return this.bannerList.length;
  }
  // 获取单个数据
  public getData(index: number): bannerItem {
    return this.bannerList[index];
  }

  // 保存单个数据
  public setDate(item:bannerItem){
    this.bannerList.push(item)
    // 更新 ui
    this.notifyDataAdd(this.bannerList.length - 1)
  }

  // 更新所有数据
  public setList(list:bannerList){
    this.bannerList = list
    // 更新
    this.notifyDataReload()
  }

  // 该方法为框架侧调用，为LazyForEach组件向其数据源处添加listener监听
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  // 该方法为框架侧调用，为对应的LazyForEach组件在数据源处去除listener监听
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  // 通知LazyForEach组件需要重载所有子组件
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  // 通知LazyForEach组件需要在index对应索引处添加子组件
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  // 通知LazyForEach组件在index对应索引处数据有变化，需要重建该子组件
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  // 通知LazyForEach组件需要在index对应索引处删除该子组件
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  // 通知LazyForEach组件将from索引和to索引处的子组件进行交换
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}

// d导航
export interface INavItem  {
  id:number,
  title:string,
  imageURL:string
}
export type  INavList = INavItem[]

// 广告标语
export interface ITitleItem  {
  id:number,
  title:string,
  sub_title:string,
  imageURL:string
}
export type  ITitleList = ITitleItem[]

// 计划
export interface IPlanItem {
  id: string,
  imageURL: string
}
export type IPlanList = IPlanItem[]

export type IAd = string

// 首页接口类型
export interface HomeInfo {
  bannerList?:bannerList
  navList?:INavList
  tileList?:ITitleList
  planList?:IPlanList
  adPicture?:IAd
}

export interface IColor {
  fontColor:string
}