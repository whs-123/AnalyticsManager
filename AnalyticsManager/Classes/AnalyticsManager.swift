//
//  AnalyticsManager.swift
//  AnalyticsManager
//
//  Created by white on 2022/8/19.
//

import Foundation
import UIKit
import SensorsAnalyticsSDK

public class AnalyticsConfigOptions: SAConfigOptions {
    
    ///是否自动采集时间 点击，启动，启动结束，pv
    public var enableAutoTrack: Bool = false
}

public struct AnalyticsManager {
    
    ///启动采集系统
    public static func startAnalytics(with config: AnalyticsConfigOptions) {
        let options = config
        if config.enableAutoTrack {
            options.autoTrackEventType = [.eventTypeAppClick, .eventTypeAppStart, .eventTypeAppEnd, .eventTypeAppViewScreen]
        } else {
            options.autoTrackEventType = []
        }
        
        options.enableVisualizedAutoTrack = true
        options.enableHeatMap = true
        options.flushNetworkPolicy = .typeALL
        SensorsAnalyticsSDK.start(configOptions: options)
    }
    
    public static func ignoreAutoTrackViewControllers(controllers: [String]) {
        SensorsAnalyticsSDK.sharedInstance()?.ignoreAutoTrackViewControllers(controllers)
    }
    
    public static func ignoreViewType(viewType: AnyClass) {
        SensorsAnalyticsSDK.sharedInstance()?.ignoreViewType(viewType)
    }
}
