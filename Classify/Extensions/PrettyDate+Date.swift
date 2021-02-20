//
//  PrettyDate.swift
//  Classify
//
//  Created by Arsalan Khan on 19/02/2021.
//

import Foundation

extension Date {
    
    var pretty: String {
        
        let relativeformatter = RelativeDateTimeFormatter()

        relativeformatter.dateTimeStyle = .named

        return relativeformatter.localizedString(for: self, relativeTo: Date())
    }
}
