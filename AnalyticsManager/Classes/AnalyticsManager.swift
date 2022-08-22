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
    
    public var customPropertiesForEvent: [String: [String: Any]] = [:]
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
        
//        for (key, value) in config.customPropertiesForEvent {
//            let plugin = EventAppendPropertyPlugin(event: key, properties: value)
//            SensorsAnalyticsSDK.sharedInstance()?.register(plugin)
//        }
        
        SensorsAnalyticsSDK.sharedInstance()?.trackEventCallback({ event, properties in
            guard let custom = options.customPropertiesForEvent[event] else {
                return true
            }
            for (k, v) in custom {
                properties[k] = v
            }
            return true
        })
    }
    
    public static func trackViewScreen(viewController: UIViewController, properties: [String: Any]) {
        SensorsAnalyticsSDK.sharedInstance()?.trackViewScreen(viewController, properties: properties)
    }
    
    public static func ignoreAutoTrackViewControllers(controllers: [String]) {
        SensorsAnalyticsSDK.sharedInstance()?.ignoreAutoTrackViewControllers(controllers)
    }
    
    public static func ignoreViewType(viewType: AnyClass) {
        SensorsAnalyticsSDK.sharedInstance()?.ignoreViewType(viewType)
    }
    
    public static func flush() {
        SensorsAnalyticsSDK.sharedInstance()?.flush()
    }
    
    public static func deleteAll() {
        SensorsAnalyticsSDK.sharedInstance()?.deleteAll()
    }
}

//public class EventAppendPropertyPlugin: SAPropertyPlugin {
//    private let event: String
//    private let otherProperties: [String: Any]
//    
//    public init(event: String, properties: [String: Any]) {
//        self.event = event
//        self.otherProperties = properties
//        super.init()
//    }
//    
//    public override func isMatched(with filter: SAPropertyPluginEventFilter) -> Bool {
//        return filter.event == self.event
//    }
//    
//    public override func properties() -> [String : Any] {
//        return self.otherProperties
//    }
//}
