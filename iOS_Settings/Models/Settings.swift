//
//  Settings.swift
//  iOS_Settings
//
//  Created by Roman on 24.10.2023.
//

import UIKit

struct Setting {
    let name: String
    let style: Style
    let block: Block
    let imageMain: UIImage?

    static func getSectionsCount() -> Int {
        let set = Set(settingsList.map{$0.block})
        return set.count
    }

    static func getSettingsList(block: Block) -> [Setting] {
        var out = [Setting]()
        for i in settingsList{
            if i.block == block {
                out.append(i)
            }
        }
        return out
    }

    static func getSettingsSectionLenght(block: Block) -> Int {
        var out = Int()
        for i in settingsList{
            if i.block == block {
                out += 1
            }
        }
        return out
    }
}

enum Style {
    case check
    case move
}

enum Block {
    case fast
    case notifications
    case main

    static let allValues = [Block.fast, Block.notifications, Block.main]
}

var settingsList = [Setting(name: "Airplane Mode",
                            style: .check,      block: .fast,    imageMain: UIImage(named: "Airplane Mode")),
                    Setting(name: "Wi-Fi",
                            style: .move,       block: .fast,    imageMain: UIImage(named: "Wi-Fi")),
                    Setting(name: "Bluetooth",
                            style: .move,       block: .fast,    imageMain: nil),
                    Setting(name: "Cellular",
                            style: .move,       block: .fast,    imageMain: UIImage(named: "Cellular")),
                    Setting(name: "Personal Hotspot",
                            style: .move,       block: .fast,    imageMain: UIImage(named: "Personal Hotspot")),
                    Setting(name: "Notifications",
                            style: .move,       block: .notifications,    imageMain: UIImage(named: "Notifications")),
                    Setting(name: "Sounds & Haptics",
                            style: .move,       block: .notifications,    imageMain: UIImage(named: "Sounds & Haptics")),
                    Setting(name: "Focus",
                            style: .move,       block: .notifications,    imageMain: UIImage(named: "Focus")),
                    Setting(name: "Screen Time",
                            style: .move,       block: .notifications,    imageMain: UIImage(named: "Screen Time")),
                    Setting(name: "General",
                            style: .move,       block: .main,    imageMain: UIImage(named: "General")),
                    Setting(name: "Control Center",
                            style: .check,       block: .main,    imageMain: nil),
                    Setting(name: "Display & Brightness",
                            style: .move,       block: .main,    imageMain: UIImage(named: "Display & Brightness")),
                    Setting(name: "Wallpaper",
                            style: .move,       block: .main,    imageMain: nil)
]



