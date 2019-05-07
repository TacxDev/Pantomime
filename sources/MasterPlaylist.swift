//
//  MasterPlaylist.swift
//  Pantomime
//
//  Created by Thomas Christensen on 25/08/16.
//  Copyright © 2016 Sebastian Kreutzberger. All rights reserved.
//

import Foundation

public class MasterPlaylist {
    internal let path: String?
    internal(set) public var xKey: XKey?
    internal(set) public var playlists = [MediaPlaylist]()

    public init(path: String?) {
        self.path = path
    }
    
    public func url(for segment: MediaSegment) -> URL? {
        guard
            let playlistURL = self.url(for: segment.mediaPlaylist),
            let segmentPath = segment.path,
            let segmentURL = playlistURL.URLByReplacingLastPathComponent(segmentPath) else {
                return nil
        }
        
        return segmentURL
    }
    
    public func url(for mediaPlaylist: MediaPlaylist) -> URL? {
        guard
            let masterPlaylistPath = self.path,
            let playlistPath = mediaPlaylist.path,
            let masterPlaylistURL = URL(string: masterPlaylistPath),
            let playlistURL = masterPlaylistURL.URLByReplacingLastPathComponent(playlistPath) else {
                return nil
        }
        
        return playlistURL
    }
}
