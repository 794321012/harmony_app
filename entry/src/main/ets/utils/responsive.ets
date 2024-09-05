const designWidth = 360 // 设计稿尺寸
const ret = AppStorage.get('layoutWidth') as number || 360

export const rvp = (size: number) => {
  /*
   *  ret = 元素尺寸 / 设计稿尺寸 * 真机尺寸
   * */
  console.log( "rvp:" + JSON.stringify((AppStorage.get('layoutWidth'))))
  return size / designWidth * ret
}