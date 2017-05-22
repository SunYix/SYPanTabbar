# SYPanTabbar
封装的滑动控制器移动Tabbar

#### 这个有比较多的实现方式，这个封装的思路是在每个UIViewController中添加Pan手势，实现切换
#### 其实原理很简单，就是给每个view添加一个pen手势，当拖动过半的时候，tabbar切换页面
#### 并且当每个ViewController DidAppear后，将左右两边的Controller渲染出来，添加到当前的View中（成为subView）。

有需要的小伙伴可以下载下来看看。
