# XWTransition

###是什么
XWTransition是用来帮助你快速集成自定义转场的工具，使用它你无需关注转场的逻辑和长长的delegate方法，只需要选择相应效果的转场效果器，然后几乎就像以前的push和present操作一样进行转场工作，当然你也可以很简单自定义自己的效果器完成你独特的转场创意而无需关注转场逻辑，你只需要专心关注你的动画逻辑即可，其它的东西都已经为你处理好了

###效果图（可下载demo真机运行效果更好）
截图中，左上角的开关代表push和present，所有效果都支持手势，我就不一一演示了

1、CircleSpreadTransition 小圆点扩散

![CircleSpreadTransition.gif](http://upload-images.jianshu.io/upload_images/1154055-15cbfb7aefe2efcc.gif?imageMogr2/auto-orient/strip)

2、MagicMoveTransition 神奇移动


![MagicMoveTransition1.gif](http://upload-images.jianshu.io/upload_images/1154055-7f2a7f9ff4590611.gif?imageMogr2/auto-orient/strip)
![MagicMoveTransition2.gif](http://upload-images.jianshu.io/upload_images/1154055-3593e3b356bcf1de.gif?imageMogr2/auto-orient/strip)

3、XWDrawerAnimator 抽屉效果，仿照QQ和淘宝

![XWDrawerAnimator1.gif](http://upload-images.jianshu.io/upload_images/1154055-7ce100b7d8de68d0.gif?imageMogr2/auto-orient/strip)
![XWDrawerAnimator2.gif](http://upload-images.jianshu.io/upload_images/1154055-a955134f8fc57edd.gif?imageMogr2/auto-orient/strip)

4、XWCoolAnimator 自定义一些效果

![XWCoolAnimator2.gif](http://upload-images.jianshu.io/upload_images/1154055-b91aaa380658aea2.gif?imageMogr2/auto-orient/strip)
![XWCoolAnimator1.gif](http://upload-images.jianshu.io/upload_images/1154055-11463b1600954cbf.gif?imageMogr2/auto-orient/strip)
![XWCoolAnimator3.gif](http://upload-images.jianshu.io/upload_images/1154055-865c860ae815dee3.gif?imageMogr2/auto-orient/strip)
![XWCoolAnimator4.gif](http://upload-images.jianshu.io/upload_images/1154055-4427d7a13724cab2.gif?imageMogr2/auto-orient/strip)
![XWCoolAnimator5.gif](http://upload-images.jianshu.io/upload_images/1154055-16bb0fb9435edaa2.gif?imageMogr2/auto-orient/strip)
![XWCoolAnimator6.gif](http://upload-images.jianshu.io/upload_images/1154055-7005cabfc86bff65.gif?imageMogr2/auto-orient/strip)
![XWCoolAnimator7.gif](http://upload-images.jianshu.io/upload_images/1154055-491415eac763bd58.gif?imageMogr2/auto-orient/strip)

5、XWFilterAnimator 通过CIFilter滤镜自定义一些效果，请在真机上运行

![XWFilterAnimator1.gif](http://upload-images.jianshu.io/upload_images/1154055-de1a3e6ca1ce5c7a.gif?imageMogr2/auto-orient/strip)
![XWFilterAnimator6.gif](http://upload-images.jianshu.io/upload_images/1154055-9f3805ba6198ac2b.gif?imageMogr2/auto-orient/strip)
![XWFilterAnimator5.gif](http://upload-images.jianshu.io/upload_images/1154055-d98e03b7a08e8352.gif?imageMogr2/auto-orient/strip)
![XWFilterAnimator4.gif](http://upload-images.jianshu.io/upload_images/1154055-b3ff2938f4079bd9.gif?imageMogr2/auto-orient/strip)
![XWFilterAnimator3.gif](http://upload-images.jianshu.io/upload_images/1154055-931ca82d418e3801.gif?imageMogr2/auto-orient/strip)
![XWFilterAnimator2.gif](http://upload-images.jianshu.io/upload_images/1154055-2aa75294d5097e20.gif?imageMogr2/auto-orient/strip)
![XWFilterAnimator8.gif](http://upload-images.jianshu.io/upload_images/1154055-adbaa9592d501e00.gif?imageMogr2/auto-orient/strip)
![XWFilterAnimator7.gif](http://upload-images.jianshu.io/upload_images/1154055-50bb0975c6fc4801.gif?imageMogr2/auto-orient/strip)

###基本使用

1、clone后将XWTranstion文件夹导入工程

2、导入`UINavigationController+XWTransition.h`或者`UIViewController+XWTransition.h`两个分类

3、选择你需要的效果器进行根据初始化方法进行初始化，比如下面的小圆点扩散，初始化指定开始圆心和半径

```
XWCircleSpreadAnimator *animator = [XWCircleSpreadAnimator xw_animatorWithStartCenter:self.button.center radius:20];
    
```

4、通过初始化的效果器转场，根据分类提供两个方法进行push或者present，就完成了！

```
/**
 *  通过指定的转场animator来push控制器，达到不同的转场效果
 *
 *  @param viewController 被push的控制器
 *  @param animator       转场Animator
 */
- (void)xw_pushViewController:(UIViewController *)viewController withAnimator:(XWTransitionAnimator *)animator;

/**
 *  通过指定的转场animator来present控制器
 *
 *  @param viewController 被modal出的控制器
 *  @param animator       转场animator
 */
- (void)xw_presentViewController:(UIViewController *)viewController withAnimator:(XWTransitionAnimator *)animator;

//事例代码如下
[self.navigationController xw_pushViewController:toVC withAnimator:animator];
或者
[self xw_presentViewController:toVC withAnimator:animator];

```

###手势驱动（所有的效果都支持手势驱动）
1、在`UIViewController+XWTransition.h`分类中提供了两个方法，用来注册手势驱动,在viewDidLoad的时候调用注册手势就可以了，详见demo，注意避免循环引用，手势支持边缘属性

```
/**
 *  注册to手势(push或者Present手势)
 *
 *  @param direction       手势方向
 *  @param tansitionConfig 手势触发的block，block中需要包含你的push或者Present的逻辑代码，注意避免循环引用问题
 *  @param edgeSpacing     手势触发的边缘距离，该值为0，表示在整个控制器视图上都有效，否者这在边缘的edgeSpacing之类有效
 */

- (void)xw_registerToInteractiveTransitionWithDirection:(XWInteractiveTransitionGestureDirection)direction transitonBlock:(dispatch_block_t)tansitionConfig edgeSpacing:(CGFloat)edgeSpacing;

/**
 *  注册back手势(pop或者dismiss手势)
 *
 *  @param direction       手势方向
 *  @param tansitionConfig 手势触发的block，block中需要包含你的pop或者dismiss的逻辑代码，注意避免循环引用问题
 *  @param edgeSpacing     手势触发的边缘距离，该值为0，表示在整个控制器视图上都有效，否者这在边缘的edgeSpacing之类有效
 */

- (void)xw_registerBackInteractiveTransitionWithDirection:(XWInteractiveTransitionGestureDirection)direction transitonBlock:(dispatch_block_t)tansitionConfig edgeSpacing:(CGFloat)edgeSpacing;

```

2、事例代码

```
    __weak typeof(self)weakSelf = self;
    //注册一个全屏的back转场
    [self xw_registerBackInteractiveTransitionWithDirection:XWInteractiveTransitionGestureDirectionDown transitonBlock:^{
    //pop或者dismiss操作
        [weakSelf xw_transiton];
    } edgeSpacing:0];

```


###关于自定义转场效果
你只需要继承于`XWTransitionAnimator`,就像内置实现的所有效果器一样，然后复写需要的属性和两个必须的方法即可,然后你就可以使用你自定义的效果器转场，`XWTransitionAnimator`头文件如下：

```
@interface XWTransitionAnimator : NSObject<UIViewControllerTransitioningDelegate, UINavigationControllerDelegate, UITabBarControllerDelegate, XWInteractiveTransitionDelegate>

//to转场时间 默认0.5
@property (nonatomic, assign) NSTimeInterval toDuration;
//back转场时间 默认0.5
@property (nonatomic, assign) NSTimeInterval backDuration;
//是否需要开启手势timer，某些转场如果在转成过程中所开手指，不会有动画过渡，显得很生硬，开启timer后，松开手指，会用timer不断的刷新转场百分比，消除生硬的缺点
@property (nonatomic, assign) BOOL needInteractiveTimer;

/**
 *  配置To过程动画(push, present),自定义转场动画应该复写该方法
 */
- (void)xw_setToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;
/**
 *  配置back过程动画（pop, dismiss）,自定义转场动画应该复写该方法
 */
- (void)xw_setBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
```

####更多原理和使用细节请前往我的简书博客：[几句代码快速集成自定义转场效果+ 全手势驱动](http://www.jianshu.com/p/e498b956491c)


