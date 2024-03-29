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

import ArgumentParser

struct MetadataPrinter: ParsableCommand {
    @Argument(help: "Media input file path")
    var file: String

    @Flag(help: "Print verbose information about the input file.")
    var verbose = false

    mutating func run() throws {
        print("File \(file)\n")
        let nilStr = "(nil)"
        let asset = AVURLAsset(url: NSURL.fileURL(withPath: file) , options: nil)

        if (verbose) {
            print("Available Metadata Formats:")
            for formatStr:AVMetadataFormat in asset.availableMetadataFormats {
                print(" - \(formatStr)")
            }
            print("")
            print("All Metadata:")
            for item:AVMetadataItem in asset.metadata {
                print(" - Key: \(item.commonKey?.rawValue ?? "nil") (\(item.key!))")
                print("   - ID:        \(item.identifier?.rawValue ?? nilStr)")
                print("   - Language:  \(item.extendedLanguageTag ?? nilStr)")
                print("   - Key space: \(item.keySpace?.rawValue ?? nilStr)")
                print("   - Value:     \(item.value!)")
            }
        } else {
            print("Metadata:")
            for item:AVMetadataItem in asset.metadata {
                print("\(item.commonKey?.rawValue ?? nilStr): \(item.value!)")
            }
        }
    }
}

MetadataPrinter.main()
