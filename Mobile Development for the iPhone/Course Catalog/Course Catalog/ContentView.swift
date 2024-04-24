//
//  ContentView.swift
//  Course Catalog
//
//  Created by Taylor Shipley on 6/17/23.
//


import SwiftUI

struct ContentView: View {
    @State private var showOnlySelected = false
    @State private var courseArray = loadCourses()

    var body: some View {
        VStack {
            Text("Course Catalog")
                .accessibilityIdentifier("title")
            
            List {
                ForEach(filteredCourses) { course in
                    CourseRow(course: course)
                        .onTapGesture {
                            toggleSelectedStatus(for: course.id)
                        }
                }
            }
            
            HStack {
                Spacer(minLength: 20)
                Text("Focus Mode")
                Toggle(isOn: $showOnlySelected) {
                    
                }
                .accessibilityIdentifier("showOnlySelectedCoursesSwitch")
                .accessibilityLabel("showOnlySelectedCoursesSwitch")
            .padding(10)
            }
        }
    }
    
    private var filteredCourses: [Course] {
        showOnlySelected ? courseArray.filter { $0.selected } : courseArray
    }
    
    private func toggleSelectedStatus(for courseId: UUID) {
        guard let index = courseArray.firstIndex(where: { $0.id == courseId }) else {
            return
        }
        courseArray[index].selected.toggle()
    }
}


struct CourseRow: View {
    let course: Course

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(course.number)
                    .font(.headline)
                    .accessibilityIdentifier(course.number)
                    .accessibilityLabel(course.number)
                    .accessibilityValue(course.number)

                Text(course.name)
                    .font(.subheadline)
                    .accessibilityLabel(course.name)
                    .accessibilityIdentifier(course.name)
                    .accessibilityValue(course.name)
            }
            Spacer()
            if course.selected {
                checkedImage
            } else {
                uncheckedImage
            }
        }
        .frame(height: 50.0)
        .contentShape(Rectangle())
    }
    
    private var checkedImage: some View {
        Image(systemName: "checkmark.square")
            .resizable()
            .frame(width: 32.0, height: 32.0)
            .accessibilityLabel("ischecked")
            .accessibilityIdentifier("ischecked")
    }
    
    private var uncheckedImage: some View {
        Image(systemName: "square")
            .resizable()
            .frame(width: 32.0, height: 32.0)
            .accessibilityLabel("unchecked")
            .accessibilityIdentifier("unchecked")
    }
}

struct Course: Identifiable {
    let id = UUID()
    let number: String
    let name: String
    var selected: Bool
}

func loadCourses() -> [Course] {
    loadCSCourses()
    let sortedKeys = Array(coursesDict.keys).sorted()
    return sortedKeys.map { key in
        let course = Course(number: key, name: coursesDict[key]?["ShortDescription"] ?? "", selected: false)
        return course
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
