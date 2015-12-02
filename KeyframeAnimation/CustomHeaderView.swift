//
//  CustomHeaderView.swift
//  KeyframeAnimation
//
//  Created by lumanxi on 15/10/16.
//  Copyright © 2015年 fanfan. All rights reserved.
//

import UIKit

class CustomHeaderView: UIView {

    
    let paperAirplane = UIImageView(image: UIImage(named: "paperAirplane"))
    
    let paperAirplaneOpposite = UIImageView(image: UIImage(named: "paperAirplaneOpposite"))
    
    let paperAirplaneComeBack = UIImageView(image: UIImage(named: "paperAirplaneComeBack"))
    
    let background = UIImageView(image: UIImage(named: "UIViewAnimation-Keyframe"))
    
    let circular = UIView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        addSubview(background)
        addSubview(circular)
        addSubview(paperAirplane)
        addSubview(paperAirplaneOpposite)
        addSubview(paperAirplaneComeBack)
        
        paperAirplaneOpposite.alpha = 0
        paperAirplaneComeBack.alpha = 0
        
        circular.backgroundColor = UIColor(red: 201 / 255.0, green: 227 / 255.0, blue: 218 / 255.0, alpha: 1)
        circular.layer.cornerRadius = 48 / 2.0
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        let y = bounds.height - 48 / 1.8 - 2
        
        background.frame = bounds
        circular.frame = CGRectMake(20, y, 48, 48)
        paperAirplane.frame = CGRectMake(35, y + 10, 24, 23)
        paperAirplaneOpposite.frame = CGRectMake(bounds.width - 24.5, 85, 24.5, 23)
        paperAirplaneComeBack.frame = CGRectMake(0, y + 10, 24, 23)

        
    }
}
