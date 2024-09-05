import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';

export default class EntryAbility extends UIAbility {
  onCreate(want:Want, launchParam:AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  async  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
        hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });

    // 1.切换成全屏
    const windowClass = await windowStage.getMainWindow()
    console.log('windowClass::: ' + JSON.stringify(windowClass.getWindowProperties()))
    windowClass.setWindowLayoutFullScreen(true) // 全屏模式
    // 2.设置状态栏颜色
    windowClass.setWindowSystemBarProperties({
      statusBarContentColor:'#FFFFFF',
      navigationBarContentColor:'#FFFFFF'
    })
    // 3.获取状态栏高度，并且存储起来
    const avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
    const topHeight = avoidArea.topRect.height // 注意单位是 px
    hilog.info(0x0000, 'textTag', 'topHeight: ' + JSON.stringify(px2vp(topHeight)));
    AppStorage.setOrCreate('topHeight', px2vp(topHeight)) // 单位是 vp

    // hilog.info(0x0000, 'console.log: avoidArea', JSON.stringify(avoidArea));
    // 4.获取屏幕高度，并且存储起来
    const props = windowClass.getWindowProperties()
    console.log('layoutWidth: ' + JSON.stringify(props));
    const layoutWidth = props.windowRect.width // 尺寸是像素 px
    console.log('Size: ' );
    console.log('layoutWidth: ' + layoutWidth);
    AppStorage.setOrCreate('layoutWidth', px2vp(layoutWidth))
  }

  onWindowStageDestroy() {
      // Main window is destroyed, release UI related resources
      hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
      // Ability has brought to foreground
      hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
      // Ability has back to background
      hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
