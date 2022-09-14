//
//  UIColor+Extension.swift
//  Taxi App
//
//  Created by Mert Demirtaş on 12.04.2022.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}

public extension UIColor {
    static let navBarColor: UIColor = UIColor(r: 220, g: 200, b: 255, alpha: 1)
    static let appBackgroundColor: UIColor = UIColor(r: 240, g: 214, b: 255, alpha: 1)
    static let spinnerColor: UIColor = .white
    static let mainPageTableViewCellColor: UIColor = .clear
}

extension Date {
    func convertDateFormater(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        dateFormatter.locale = NSLocale.system

        guard let date = dateFormatter.date(from: date) else {
            return ""
        }

        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = NSLocale.system
        let timeStamp = dateFormatter.string(from: date)

        return timeStamp
    }
}
