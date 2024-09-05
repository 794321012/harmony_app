export const month = new Date().getMonth() + 1
function calcLastMonth(currentMonth:number, num:number):number{
  const val = currentMonth - num
  return val < 1 ? 12 + val : val
}
function calcNextMonth(currentMonth:number, num:number):number{
  const val = currentMonth + num
  return val > 12 ? val - 12 : val
}
const addZero = (val:number):string => val < 10 ? '0' + val : val + ''

export const getMonth = [
  calcLastMonth(month, 2),
  calcLastMonth(month, 1),
  month,
  calcNextMonth(month, 1),
  calcNextMonth(month, 2),
  calcNextMonth(month, 3)
]