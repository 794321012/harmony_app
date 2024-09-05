export interface ITagsItem {
  name:string
}
export type ITagsList = ITagsItem[]

export interface IRoomRecommendItem {
  id:string,
  housePicture: string,
  tags: ITagsList,
  houseTitle: string,
  address: string,
  rentPriceUnit: string,
  rentPriceListing: string,
  rentArea: string
}
export type IRoomRecommendList = IRoomRecommendItem[]


export interface IRoomRecommend  {
  IRoomRecommendList?:IRoomRecommendList
}

export class RoomRecommendDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private List: IRoomRecommendList = [];

  // 获取总长度
  public totalCount(): number {
    return this.List.length;
  }

  // 获取某一项
  public getData(index: number): IRoomRecommendItem {
    return this.List[index];
  }

  // 保存单个数据
  public setData(item:IRoomRecommendItem) {
    this.List.push(item)
    // 更新 ui
    this.notifyDataAdd(this.List.length - 1)
  }

  // 保存全部数据
  public setList(list:IRoomRecommendList){
    this.List = list
    // 组件重载
    this.notifyDataReload()
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
      // 写法2：listener.onDatasetChange([{type: DataOperationType.RELOAD}]);
    })
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}



