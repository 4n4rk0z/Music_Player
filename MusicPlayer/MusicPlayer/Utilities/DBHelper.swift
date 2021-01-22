//
//  DBHelper.swift
//  MusicPlayer
//
//  Created by 4n4rk0z on 22/01/21.
//

import Foundation
import SQLite3

class DBHelper {
    
    init() {
        db = openDB()
        createTable()
    }
    let dbPath: String = "myDb.sqlite"
    var db:OpaquePointer?

    func openDB() -> OpaquePointer?
    {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK
        {
            print("error opening database")
            return nil
        }
        else
        {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
    }
    
    func createTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS person(username TEXT PRIMARY KEY,name TEXT,pat TEXT, mat TEXT, bio TEXT);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("person table created.")
            } else {
                print("person table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func insert(username: String, name: String, pat: String, mat: String, bio: String){
        
        let profile = read()
        for p in profile{
            if p.userName == username {
                return
            }
        }
        let insertStatementString = "INSERT INTO person (username, name, pat, mat, bio) VALUES (?, ?, ?, ?, ?);"
                var insertStatement: OpaquePointer? = nil
                if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                    sqlite3_bind_text(insertStatement, 1, (username as NSString).utf8String, -1, nil)
                    sqlite3_bind_text(insertStatement, 2, (name as NSString).utf8String, -1, nil)
                    sqlite3_bind_text(insertStatement, 3, (pat as NSString).utf8String, -1, nil)
                    sqlite3_bind_text(insertStatement, 4, (mat as NSString).utf8String, -1, nil)
                    sqlite3_bind_text(insertStatement, 5, (bio as NSString).utf8String, -1, nil)
                    
                    if sqlite3_step(insertStatement) == SQLITE_DONE {
                        print("Successfully inserted row.")
                    } else {
                        print("Could not insert row.")
                    }
                } else {
                    print("INSERT statement could not be prepared.")
                }
                sqlite3_finalize(insertStatement)
    }
    
    func read() -> [Profile] {
            let queryStatementString = "SELECT * FROM person;"
            var queryStatement: OpaquePointer? = nil
            var psns : [Profile] = []
            if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
                while sqlite3_step(queryStatement) == SQLITE_ROW {
                    let username = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                    let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                    let pat = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                    let mat = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                    let bio = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                                     
                    psns.append(Profile(user: username,
                                        name: name,
                                        pat: pat,
                                        mat: mat,
                                        bio: bio))

                }
            } else {
                print("SELECT statement could not be prepared")
            }
            sqlite3_finalize(queryStatement)
            return psns
        }
}
