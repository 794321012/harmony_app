import NavBar from '../views/See/NavBar'
import Content from '../views/See/Content'
@Component
export default struct See{
  build(){
    Column(){
      NavBar()
      Content()
    }
    .width('100%').height('100%')
    .linearGradient({
      direction:GradientDirection.Bottom,
      colors:[['#DEFBE5',0], ['#FFFFFF',0.3]]
    })
  }
}