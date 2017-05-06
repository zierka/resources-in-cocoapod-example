//
//  ResourceHelper.swift
//  dummyFramework
//
//  Created by Erik Zier on 05/05/2017.
//  Copyright © 2017 Erik Zier. All rights reserved.
//

import UIKit

// example for convenient access to bundle/images
// images provided by http://www.streamlineicons.com/

public extension Bundle {
    
    /**
     1. get bundle of the framework
     2. get the resource bundle from the framework bundle
     */
    public static let resourceBundle: Bundle? = {
        /// Need a class from the framework to get it's bundle. Bundle identifier can also be used, but it might changes. Now it's something like org.cocoapods.exampleFramework for this bundle
        let frameworkBundle = Bundle(for: DummyClass.self)
        
        var resourceBundle: Bundle?
        
        // "exampleFrameworkResources" is the name of the resource bundle defined in .podspec
        if let resourceBundleUrl = frameworkBundle.url(forResource: "exampleFrameworkResources", withExtension: "bundle") {
            resourceBundle = Bundle(url: resourceBundleUrl)
        }
        
        assert(resourceBundle != nil, "resource bundle not found")
        
        return resourceBundle
    }()
}

public extension UIImage {
    
    public convenience init?(bundleImageNamed: String) {
        self.init(named: bundleImageNamed, in: Bundle.resourceBundle, compatibleWith: nil)
    }
    
    @objc(bundleImageNamed:)
    public static func bundleImage(named: String) -> UIImage? {
        let image = UIImage(named: named, in: Bundle.resourceBundle, compatibleWith: nil)
        
        #if DEBUG
            if image == nil {
                print("WARNING: Failed to load image named _\(named)_ from resource bundle.")
            }
        #endif
        
        return image
    }
}
