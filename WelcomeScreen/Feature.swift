//
//  Feature.swift
//  WelcomeScreen
//
//  Created by Philipp on 13.12.21.
//

import Foundation

struct Feature: Decodable, Identifiable {
    var id = UUID()
    let title: String
    let description: String
    let image: String
}
