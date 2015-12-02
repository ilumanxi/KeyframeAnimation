//
//  ViewController.swift
//  KeyframeAnimation
//
//  Created by lumanxi on 15/10/16.
//  Copyright © 2015年 fanfan. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    
    
    let customHeaderView = CustomHeaderView(frame: CGRectMake(0, 0, 375,220))
    
    let sunView = UIView(frame: CGRectMake(40, 100, 60, 60))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sunView.backgroundColor = UIColor.greenColor()
        sunView.center = CGPointMake(80, 300)
        view.addSubview(sunView)
        
        
        view.addSubview(customHeaderView)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        UIView.animateWithDuration(1, animations: {
//            self.sunView.center.x += 200.0
//            }, completion: { _ in
//                UIView.animateWithDuration(1, animations: {
//                    self.sunView.center.y += 100.0
//                    }, completion: { _ in
//                        UIView.animateWithDuration(1, animations: {
//                            self.sunView.center.x -= 200.0
//                            }, completion: { _ in
//                                UIView.animateWithDuration(1, animations: {
//                                    self.sunView.center.y -= 100.0
//                                    }, completion: nil)
//                        })
//                })
//        })
        
        /*
        addKeyframeWithRelativeStartTime(_: relativeDuration: animations: )是UIView添加关键帧的方法，该方法有三个参数：
        
        startTime：关键帧开始时间，该时间是相对整个关键帧动画持续时间的相对时间，一般值在0到1之间。如果为0，则表明这一关键帧从整个动画的第0秒开始执行，如果设为0.5，则表明从整个动画的中间开始执行。
        relativeDuration：关键帧持续时间，该时间同样是相对整个关键帧动画持续时间的相对时间，一般值也在0到1之间。如果设为0.25，则表明这一关键帧的持续时间为整个动画持续时间的四分之一。
        animations：设置视图动画属性的动画闭包。
        */
//        UIView.animateKeyframesWithDuration(2, delay: 0, options: [], animations: {
//            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.25, animations: {
//                self.sunView.center.x += 200.0
//            })
//        }, completion: nil)
        
        

        
    }

    
    override func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        
        /*
        来刨析一下：
        
        第一个关键帧：完成1号纸飞机视图运动到右上角并移出屏幕，视图逐渐变小的动画。该关键帧从整个动画的第0秒开始执行，持续时间为0.6秒。
        第二个关键帧：由于2号纸飞机视图的初始透明度为零，所以在第二个关键帧将透明度设为1，并且缩小视图。注意这两个动作需要在瞬间完成，所以relativeDuration设为0.01，一个极短的时间。开始时间为整个动画的第0.9秒开始，较第一个关键帧延迟0.3秒。
        第三个关键帧：与第二个关键帧同时开始执行，完成2号纸飞机视图从小变大、并且往左下角运动，一直移出屏幕。持续时间为1.5秒。
        第四个关键帧：与第二个关键帧作用相似，改变3号纸飞机视图的透明度，同样是在瞬间完成。
        第五个关键帧：与第四个关键帧同时执行， 完成向右移动的动画，持续0.6秒。
        关键帧完成之后，在completion闭包中调用restorePaperAirplaneStatus()方法，恢复3个纸飞机视图的状态及位置，以便再次执行动画。
        */

        let zoomInScaleTransform = CGAffineTransformMakeScale(0.2, 0.2)
        UIView.animateKeyframesWithDuration(3, delay: 0, options: [], animations: {
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.2, animations: {
                self.customHeaderView.paperAirplane.center.x += self.view.frame.width
                self.customHeaderView.paperAirplane.center.y += -180
                self.customHeaderView.paperAirplane.transform = zoomInScaleTransform
            })
            UIView.addKeyframeWithRelativeStartTime(0.3, relativeDuration: 0.01, animations: {
                self.customHeaderView.paperAirplaneOpposite.alpha = 1
                self.customHeaderView.paperAirplaneOpposite.transform = zoomInScaleTransform
            })
            UIView.addKeyframeWithRelativeStartTime(0.3, relativeDuration: 0.5, animations: {
                self.customHeaderView.paperAirplaneOpposite.transform = CGAffineTransformIdentity
                self.customHeaderView.paperAirplaneOpposite.center.x -= self.view.frame.width
                self.customHeaderView.paperAirplaneOpposite.center.y += 90
            })
            UIView.addKeyframeWithRelativeStartTime(0.9, relativeDuration: 0.01, animations: {
                self.customHeaderView.paperAirplaneComeBack.alpha = 1
            })
            UIView.addKeyframeWithRelativeStartTime(0.9, relativeDuration: 0.2, animations: {
                self.customHeaderView.paperAirplaneComeBack.center.x += 33
            })
            }, completion: { _ in
                self.restorePaperAirplaneStatus()
        })
        
        
        UIView.animateKeyframesWithDuration(2, delay: 0, options: [], animations: {
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.25, animations: {
                self.sunView.center.x += 200.0
            })
            UIView.addKeyframeWithRelativeStartTime(0.25, relativeDuration: 0.25, animations: {
                self.sunView.center.y += 100.0
            })
            UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: 0.25, animations: {
                self.sunView.center.x -= 200.0
            })
            UIView.addKeyframeWithRelativeStartTime(0.75, relativeDuration: 0.25, animations: {
                self.sunView.center.y -= 100.0
            })
            }, completion: nil)
        
    }
    


    func restorePaperAirplaneStatus(){
        
        customHeaderView.paperAirplaneOpposite.alpha = 0
        customHeaderView.paperAirplaneComeBack.alpha = 0
    }

}

