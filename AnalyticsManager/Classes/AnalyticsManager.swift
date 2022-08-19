//
//  AnalyticsManager.swift
//  AnalyticsManager
//
//  Created by white on 2022/8/19.
//

import Foundation
import SensorsAnalyticsSDK

public struct AnalyticsConfigOptions {
    
    ///触发flush
    public var flushBulkSize: Int = 100
    
    ///最大可以缓存事件
    public var maxCacheSize: Int = 10000
    
    ///是否自动采集时间 点击，启动，启动结束，pv
    public var enableAutoTrack: Bool = false
    
    ///是否开启log
    public var enableLog: Bool = false
    
    fileprivate var serverURL: String
    fileprivate var launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    
    public init(serverURL: String, launchOptions: [UIApplicationLaunchOptionsKey: Any]? = nil) {
        self.serverURL = serverURL
        self.launchOptions = launchOptions
    }
}

public struct AnalyticsManager {
    
    ///启动采集系统
    public static func startAnalytics(with config: AnalyticsConfigOptions) {
        let options = SAConfigOptions(serverURL: config.serverURL, launchOptions: config.launchOptions)
        options.maxCacheSize = config.maxCacheSize;
        if config.enableAutoTrack {
            options.autoTrackEventType = [.eventTypeAppClick, .eventTypeAppStart, .eventTypeAppEnd, .eventTypeAppViewScreen]
        } else {
            options.autoTrackEventType = []
        }
        
        options.enableVisualizedAutoTrack = true
        options.enableHeatMap = true
        options.enableLog = config.enableLog
        options.flushNetworkPolicy = .typeALL
        SensorsAnalyticsSDK.start(configOptions: options)
    }
}
