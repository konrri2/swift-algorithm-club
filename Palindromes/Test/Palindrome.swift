import Foundation

func isPalindrome(_ str: String) -> Bool {
    let strippedString = str.replacingOccurrences(of: "\\W", with: "", options: .regularExpression, range: nil)
    let length = strippedString.count

    if length > 1 {
        return palindrome(strippedString.lowercased(), left: 0, right: length - 1)
    }
    return false
}

///WARNING: str[str.index(str.startIndex, offsetBy: right)]   is actially O(n)  so the whole algorithm is O(n^2)
private func palindrome(_ str: String, left: Int, right: Int) -> Bool {
    if left >= right {
        return true
    }

    let lhs = str[str.index(str.startIndex, offsetBy: left)]
    let rhs = str[str.index(str.startIndex, offsetBy: right)]

    if lhs != rhs {
        return false
    }

    return palindrome(str, left: left + 1, right: right - 1)
}

///non-recursive implementation in linear time
func isPalindrome2(_ fullStr: String) -> Bool {
    let str = fullStr.replacingOccurrences(of: "\\W", with: "", options: .regularExpression, range: nil).lowercased()
    guard str.count > 1 else {
        return false
    }
    
    var iLeft = str.startIndex
    var iRight = str.endIndex  //index after the string
    str.formIndex(before: &iRight)
    
    while iLeft < iRight {
        if str[iLeft] == str[iRight] {
            //continue searching
            str.formIndex(after: &iLeft)
            str.formIndex(before: &iRight)
        }
        else {
            return false
        }
    }
    
    return true
}
