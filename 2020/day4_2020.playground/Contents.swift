// day 4
import UIKit

// get the file path for the input file in the playground bundle
let filePath = Bundle.main.path(forResource:"day4", ofType: "txt")
// get the contentData
let contentData = FileManager.default.contents(atPath: filePath!)
// get the string
let content = String(data:contentData!, encoding:String.Encoding.utf8)

// create an array containing each passport
var passport = content!.components(separatedBy: "\n\n")
// Create a CharacterSet of delimiters.
let separators = CharacterSet(charactersIn: " \n")

var number_of_passport = 0

//part 1
for passports in passport {
    var key_values = [String]()
    // Split based on characters.
    let key = passports.components(separatedBy: separators)
    for keys in key {
        // get the list of key for each passport
        let values = keys[..<keys.firstIndex(of: ":")!]
        key_values.append(String(values))
    }
    if (key_values.count<7){
        // do nothing, password invalid
    } else if (key_values.count==7) {
        if (!key_values.contains("cid")){
            number_of_passport = number_of_passport + 1
        }
    } else {
        number_of_passport = number_of_passport + 1
    }
}
print("number of valid passport, part 1 : \(number_of_passport)")

// reset passport count
number_of_passport = 0

func check_passport_validity_no_cid(passport: [String:String])->Bool {
    let birth_year = passport["byr"]
    let issue_year = passport["iyr"]
    let expiration_year = passport["eyr"]
    let height = passport["hgt"]
    let hair_color = passport["hcl"]
    let eye_color = passport["ecl"]
    let passwordID = passport["pid"]
    
    let eye_ok = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
    
    // check birthdate validity
    if ((Int(birth_year!)! < 1920) || (Int(birth_year!)! > 2002)) {
        return false
    }
    
    // check issue validity
    if ((Int(issue_year!)! < 2010) || (Int(issue_year!)! > 2020)) {
        return false
    }
    
    // check expiration validity
    if ((Int(expiration_year!)! < 2020) || (Int(expiration_year!)! > 2030)) {
        return false
    }
    
    // check height validity
    if (height!.suffix(2) == "cm") {
        let size = height!.prefix(height!.count-2)
        if ((Int(size))! < 150) || ((Int(size))! > 193) {
            return false
        }
    }
    else if (height!.suffix(2) == "in") {
        let size = height!.prefix(height!.count-2)
        if ((Int(size))! < 59) || ((Int(size))! > 76) {
            return false
        }
    } else {
        return false
    }
    
    // check pid validity
    if (passwordID!.count != 9) {
        return false
    }
    let charsetPID = CharacterSet(charactersIn: "0123456789")
    if ((passwordID!.rangeOfCharacter(from: charsetPID.inverted) != nil)) {
        return false
    }
    
    // check eye color validity
    if !(eye_ok.contains(where: eye_color!.contains)){
        return false
    }
    
    // check hair color validity
    if (hair_color!.prefix(1) != "#") {
        return false
    }
    if (hair_color!.count != 7) {
        return false
    }
    let charset = CharacterSet(charactersIn: "0123456789abcdef")
    let value = hair_color!.suffix(6)
    if ((value.rangeOfCharacter(from: charset.inverted) != nil)) {
        return false
    }
    
    return true
}


var cnt=0
for passports in passport {
    cnt = cnt+1
    var passports_data = [String:String]()
    // Split based on characters.
    let individual_passport = passports.components(separatedBy: separators)
    for data in individual_passport {
        // get the list of key for each passport
        let key =  data[..<data.firstIndex(of: ":")!]
        let value =  data[data.index(after: data.firstIndex(of: ":")!)..<data.endIndex]
        passports_data[String(key)] = String(value)
    }
    // test if less than 7 keys -> not valid
    if (passports_data.count < 7) {         //missing one or more field
    } else if (passports_data.count == 7) { //cid present but missing one field
        if ((passports_data["cid"]) != nil) {
        } else {                            //cid absent but all field here
            if (check_passport_validity_no_cid(passport: passports_data)) {
                number_of_passport = number_of_passport + 1
            }
        }
    } else {                                //all the field here
        if (check_passport_validity_no_cid(passport: passports_data)) {
            number_of_passport = number_of_passport + 1
        }
    }
}

print("number of valid passport, part 2 : \(number_of_passport)")
