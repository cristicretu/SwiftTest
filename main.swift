//
//  main.swift
//  SwiftExample
//
//  Created by Cristi Cretu on 22.05.2021.
//

import Foundation

class Track {
    let name: String
    let instructor: String
    
    init(name: String, instructor: String) {
        self.name = name
        self.instructor = instructor
    }
}

let tracks: [Track] = [
    Track(name: "Mobile", instructor: "Tommy"),
    Track(name: "Web", instructor: "Brian"),
    Track(name: "Games", instructor: "David")
]

let students = ["Harry", "Ron", "Hermione"]

var assigments: [String : Track] = [:]

for student in students {
    let track = Int.random(in: 0 ..< tracks.count)
    assigments[student] = tracks[track]
}

for (student, track) in assigments {
    print("\(student): \(track.name) taught by \(track.instructor)")
}

