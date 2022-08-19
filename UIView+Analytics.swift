//
//  UIView+Analytics.swift
//  AnalyticsManager
//
//  Created by white on 2022/8/19.
//

import Foundation
import SensorsAnalyticsSDK

extension AnalyticsWrapper where Base: UIView {
    
    public var id: String {
        get { base.sensorsAnalyticsViewID }
        set { base.sensorsAnalyticsViewID = newValue }
    }
    
    public var ignore: Bool {
        get { base.sensorsAnalyticsIgnoreView }
        set { base.sensorsAnalyticsIgnoreView = newValue }
    }
    
    public var properties: [AnyHashable: Any] {
        get { base.sensorsAnalyticsViewProperties }
        set { base.sensorsAnalyticsViewProperties = newValue }
    }
}
