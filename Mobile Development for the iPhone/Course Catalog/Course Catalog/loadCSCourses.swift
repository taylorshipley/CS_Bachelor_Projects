//
//  loadCSCourses.swift
//  Course Catalog
//
//  Created by Taylor Shipley on 6/17/23.
//

import Foundation

// coursesDict is a global dictionary of all courses, populated by
//    the loadCSCourses() function.

//    The key of the dictionary is the course number (like "CS 1030")
//    The data of the dictionary is another dictionary containing
//    key:value pairs for shortDescription, longLdescription, etc
var coursesDict = [String : [String : String]]()

func loadCSCourses() -> Void {

   let pListFileURL = Bundle.main.url(forResource: "CSCourses", withExtension: "plist", subdirectory: "")
   if let pListPath = pListFileURL?.path,
      let pListData = FileManager.default.contents(atPath: pListPath) {
       do {
           let pListObject = try PropertyListSerialization.propertyList(from: pListData, options:PropertyListSerialization.ReadOptions(), format:nil)
           if let maybeCourses = pListObject as? [String : [String : String]] {
                coursesDict = maybeCourses
           } else {
               return
           }
           // plist has successfully been read
       } catch {
           print("Error reading CSCourses plist file: \(error)")
           return
       }
   }
}
