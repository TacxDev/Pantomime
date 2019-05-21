//
// Created by Thomas Christensen on 27/08/16.
// Copyright (c) 2016 Sebastian Kreutzberger. All rights reserved.
//

import Foundation

// Extend the NSURL object with helpers

public extension URL {
    /**
        Replaces the last path component of the URL with the path component and returns a new URL or nil.

        - Parameter pathComponent: path component to replace last path component with

        - Returns: A new URL object or nil
     
        Regular implementation calling -deletingLastPathComponent and -appendPathComponent produces unexpected results under certain conditions.
        For example, for URL "schema://host/path1/path2(p1=v1;foo)" it will produce result "schema://host/path1/replacedPath2;foo)" adding unnecessary ";foo)"
     */
    @available(iOS 4.0, *)
    func URLByReplacingLastPathComponent(_ pathComponent: String) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = self.scheme
        urlComponents.host = self.host
        
        guard var resultURL = urlComponents.url else {
            return nil
        }
        
        let oldPathComponents = self.pathComponents.dropLast()
        for oldPathComponent in oldPathComponents {
            resultURL.appendPathComponent(oldPathComponent)
        }
        
        resultURL.appendPathComponent(pathComponent)
        return resultURL
    }
}
