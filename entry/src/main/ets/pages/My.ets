import ScrollContainer from '../components/ScrollContainer/Index'
import Bg from '../views/My/Bg'
import Navbar from '../views/My/NavBar'
@Component
export default struct My {
  @Builder
  navBuilder() {
  }

  @Builder
  contentBuilder() {
    Stack() {
      Bg()
      Navbar()
    }.width('100%')
  }

  build() {
    ScrollContainer({
      navBuildParam:() => {this.navBuilder()},
      contentBuildParam:() => {this.contentBuilder()}
    })
  }
}