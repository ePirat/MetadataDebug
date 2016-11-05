//
//  main.swift
//  MetadataDebug
//
//  Copyright (C) 2016  Marvin Scholz
//
//  This program is free software; you can redistribute it and/or
//  modify it under the terms of the GNU General Public License
//  as published by the Free Software Foundation; either version 2
//  of the License, or (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
//

import Foundation
import AVFoundation
import Commander

let main = command(
    Flag("verbose", description:"Prints verbose information about the file"),
    Argument<String>("file")
) { verbose, file in

    print("File \(file)\n")
    let nilStr = "(nil)"
    let asset = AVURLAsset(url: NSURL.fileURL(withPath: file) , options: nil)

    if (verbose) {
        print("Available Metadata Formats:")
        for formatStr:String in asset.availableMetadataFormats {
            print(" - \(formatStr)")
        }
        print("")
        print("All Metadata:")
        for item:AVMetadataItem in asset.metadata {
            print(" - Key: \(item.commonKey ?? nilStr) (\(item.key!))")
            print("   - ID:        \(item.identifier ?? nilStr)")
            print("   - Language:  \(item.extendedLanguageTag ?? nilStr)")
            print("   - Key space: \(item.keySpace ?? nilStr)")
            print("   - Value:     \(item.value!)")
        }
    } else {
        print("Metadata:")
        for item:AVMetadataItem in asset.metadata {
            print("\(item.commonKey ?? nilStr): \(item.value!)")
        }
    }

}

main.run()
