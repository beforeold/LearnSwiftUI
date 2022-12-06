//
//  DelcarativeTest.swift
//  LearnSwiftUI
//
//  Created by beforeold on 2022/12/6.
//

import Foundation

struct Student {
  enum Subject: CaseIterable {
    case language
    case math
  }
  
  var scores: [Subject: Double]
}

var students: [Student] = [
  .init(scores: [.language: 80, .math: 50]),
  .init(scores: [.language: 70, .math: 90]),
]

func languageAvg_imperative() -> Double {
  var total = 0.0
  students.forEach { stu in
    total += stu.scores[.language] ?? 0
  }
  return total / Double(students.count)
}

func languageAvg_declarative() -> Double {
  let total = students.reduce(into: 0) { $0 += $1.scores[.language] ?? 0 }
  return total / Double(students.count)
}

func passRate_imperative() -> [(Student.Subject, Double)] {
  var temp: [(Student.Subject, Double)] = []
  
  Student.Subject.allCases.forEach { subject in
    var passCount = 0.0
    students.forEach { stu in
      let score = stu.scores[subject] ?? 0
      if score >= 60 {
        passCount += 1
      }
    }
    let passRate = passCount / Double(students.count)
    temp.append((subject, passRate))
  }
  
  return temp.sorted { lhs, rhs in
    return lhs.1 > rhs.1
  }
}

func passRate_declarative() -> [(Student.Subject, Double)] {
  return Student.Subject.allCases
    .map { subject in
      let count = students
        .filter { ($0.scores[subject] ?? 0) >= 60 }
        .count
      let rate = Double(count) / Double(students.count)
      return (subject, rate)
    }
    .sorted { $0.1 > $1.1 }
}
