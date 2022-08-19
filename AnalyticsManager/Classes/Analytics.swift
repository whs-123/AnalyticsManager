//
//  Analytics.swift
//  AnalyticsManager
//
//  Created by white on 2022/8/19.
//

import Foundation

public struct AnalyticsWrapper<Base> {
    
    public let base: Base
    
    public init(_ base:Base) {
        self.base = base
    }
}


public protocol AnalyticsCompatible: AnyObject {}

extension AnalyticsCompatible {
    
    public var analytics: AnalyticsWrapper<Self> {
        get { return AnalyticsWrapper(self) }
        set { }
    }
}

extension UIView: AnalyticsCompatible { }
