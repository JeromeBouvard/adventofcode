// day 2
import UIKit

// get the file path for the input file in the playground bundle
let filePath = Bundle.main.path(forResource:"day2", ofType: "txt")
// get the contentData
let contentData = FileManager.default.contents(atPath: filePath!)
// get the string
let content = String(data:contentData!, encoding:String.Encoding.utf8)

// create an array containing each line of the input file
let values = content!.components(separatedBy: "\n")

var valid = 0
var valid2 = 0

for element in values {
    // split the element into sub table
    let element2 = element.components(separatedBy: " ")
    // get range for occurance
    let lower =  Int(element2[0][..<element2[0].firstIndex(of: "-")!])
    let upper =  Int(element2[0][element2[0].index(after: element2[0].firstIndex(of: "-")!)..<element2[0].endIndex])
    // isolate pattern
    let pattern = element2[1].first
    // count number of occurence of pattern
    var count = 0
    for letter in element2[2]{
        if letter == pattern {
            count = count+1
        }
    }
    if count>=lower! && count<=upper! {
        valid = valid + 1
    }
}

print("number of valid password for part1 is \(valid)")


for element in values {
    // split the element into sub table
    let element2 = element.components(separatedBy: " ")
    // get range for occurance
    let lower =  Int(element2[0][..<element2[0].firstIndex(of: "-")!])
    let upper =  Int(element2[0][element2[0].index(after: element2[0].firstIndex(of: "-")!)..<element2[0].endIndex])
    // isolate pattern
    let pattern = element2[1].first
    // split password into car array
    let password = Array(element2[2])
    // test if pattern is either in lower position or upper position
    if ((password[lower!-1] == pattern) && (password[upper!-1] != pattern)) || ((password[lower!-1] != pattern) && (password[upper!-1] == pattern)) {
        valid2 = valid2 + 1
    }
}

print("number of valid password for part2 is \(valid2)")
