// day 6
import UIKit

// get the file path for the input file in the playground bundle
let filePath = Bundle.main.path(forResource:"day6", ofType: "txt")
// get the contentData
let contentData = FileManager.default.contents(atPath: filePath!)
// get the string
let content = String(data:contentData!, encoding:String.Encoding.utf8)

// create an array containing each group answer
var answers = content!.components(separatedBy: "\n\n")

var dictionnary = ["a":0, "b":0, "c":0, "d":0, "e":0, "f":0, "g":0, "h":0, "i":0, "j":0,
                   "k":0, "l":0, "m":0, "n":0, "o":0, "p":0, "q":0, "r":0, "s":0, "t":0,
                   "u":0, "v":0, "w":0, "x":0, "y":0, "z":0 ]

var number_of_answer = 0    //for part 1
var collective_answer = 0   //for part 2

//part 1
for group in answers {
    number_of_answer = number_of_answer + Set(group.replacingOccurrences(of: "\n", with: "").sorted()).count
}
print("Number of answer anyone answered yes : \(number_of_answer)")

//part 2
for group in answers {
    let ind_answers = group.components(separatedBy: "\n")
    // print(ind_answers.count) number of person in the group
    for ans in ind_answers {
        for char in "abcdefghijklmnopqrstuvwxyz" {
            if (ans.contains(char)) {
                dictionnary[String(char)] = dictionnary[String(char)]! + 1
            }
        }
    }
    //test if number of letter = number of person in the group
    for char in "abcdefghijklmnopqrstuvwxyz" {
        if (dictionnary[String(char)]) == ind_answers.count {
            collective_answer = collective_answer + 1
        }
        // reset dictionnary
        dictionnary[String(char)] = 0
    }
}

print("Number of collective answered yes : \(collective_answer)")
