//
//  Note.swift
//  Notes
//
//  Created by Cristi Cretu on 26.05.2021.
//

import Foundation
import SQLite3

struct Note {
    let id: Int
    let contents: String
}

class NoteManager {
    var database: OpaquePointer?

    static let main = NoteManager()

    private init() {
    }

    func connect() {
        if database != nil {
            return
        }

        let databaseURL = try! FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        ).appendingPathComponent("notes.sqlite")

        if sqlite3_open(databaseURL.path, &database) != SQLITE_OK {
            print("Error opening database")
            return
        }

        if sqlite3_exec(
            database,
            """
            CREATE TABLE IF NOT EXISTS notes (
                content TEXT
            )
            """,
            nil,
            nil,
            nil
        ) != SQLITE_OK {
            print("Error creating table: \(String(cString: sqlite3_errmsg(database)!))")
        }
    }

    func create() -> Int {
        connect()

        var statement: OpaquePointer? = nil
        if sqlite3_prepare_v2(
            database,
            "INSERT INTO notes (content) VALUES ('Write a note!')",
            -1,
            &statement,
            nil
        ) == SQLITE_OK {
            if sqlite3_step(statement) != SQLITE_DONE {
                print("Error inserting note")
            }
        }
        else {
            print("Error creating note insert statement")
        }

        sqlite3_finalize(statement)
        return Int(sqlite3_last_insert_rowid(database))
    }

    func getNotes() -> [Note] {
        connect()

        var result: [Note] = []
        var statement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, "SELECT rowid, content FROM notes", -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                result.append(Note(
                    id: Int(sqlite3_column_int(statement, 0)),
                    contents: String(cString: sqlite3_column_text(statement, 1))
                ))
            }
        }

        sqlite3_finalize(statement)
        return result
    }
}
