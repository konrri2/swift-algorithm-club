//
//  PalindromeTests.swift
//  Test
//
//  Created by Joshua Alvarado on 12/23/16.
//  Copyright © 2016 Joshua Alvarado. All rights reserved.
//

import XCTest

class PalindromeTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            _ = isPalindrome("abbcbba")
            _ = isPalindrome("asdkfaksjdfasjkdfhaslkjdfakjsdfhakljsdhflkjasdfhkasdjhfklajsdfhkljasdf")
            _ = isPalindrome("abababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababa")
        }
    }

    func testPalindromeWord() {
        XCTAssertTrue(isPalindrome("abbcbba"))
        XCTAssertTrue(isPalindrome("racecar"))
    }

    func testPalindromeSentence() {
        XCTAssertTrue(isPalindrome("A man, a plan, a canal, Panama!"))
        XCTAssertTrue(isPalindrome("Madam, I'm Adam"))
        XCTAssertTrue(isPalindrome("Madam in Eden, I'm Adam"))
        XCTAssertTrue(isPalindrome("In girum imus nocte et consumimur igni"))
        XCTAssertTrue(isPalindrome("Never odd or even"))
    }

    func testPalindromeNumber() {
        XCTAssertTrue(isPalindrome("5885"))
        XCTAssertTrue(isPalindrome("5 8 8 5"))
        XCTAssertTrue(isPalindrome("58 85"))
    }

    func testSpecialCharacters() {
        XCTAssertTrue(isPalindrome("৯৯"))
    }

    func testNonPalindromes() {
        XCTAssertFalse(isPalindrome("\\\\"))
        XCTAssertFalse(isPalindrome("desserts"))
        XCTAssertFalse(isPalindrome("😀😀"))
        XCTAssertFalse(isPalindrome(""))
        XCTAssertFalse(isPalindrome("a"))
        XCTAssertFalse(isPalindrome("power"))
    }
    
    
    let str10 = String(repeating: "a", count: 10)
    let str1k = String(repeating: "a", count: 1024)
    let str10k = String(repeating: "a", count: 10*1024)
    let str20k = String(repeating: "a", count: 20*1024)
    let str50k = String(repeating: "a", count: 50*1024)
    let str1M = String(repeating: "a", count: 1024*1024)

    func testPerformance_offset_1k() {
        self.measure {
            let ret = isPalindrome(str1k)
            XCTAssertTrue(ret)
        }
    }
    
    func testPerformance_formIndex_1k() {
        self.measure {
            let ret = isPalindrome2(str1k)
            XCTAssertTrue(ret)
        }
    }
    
    func testPerformance_offset_10k() {
        self.measure {
            let ret = isPalindrome(str10k)
            XCTAssertTrue(ret)
        }
    }
    
    func testPerformance_formIndex_10k() {
        self.measure {
            let ret = isPalindrome2(str10k)
            XCTAssertTrue(ret)
        }
    }
    
    //2.7 sec
    func testPerformance_offset_20k() {
        self.measure {
            let ret = isPalindrome(str20k)
            XCTAssertTrue(ret)
        }
    }
    
    //0.00 sec
    func testPerformance_formIndex_20k() {
        self.measure {
            let ret = isPalindrome2(str20k)
            XCTAssertTrue(ret)
        }
    }
    
    //too long
    func testPerformance_offset_50k() {
        self.measure {
            let ret = isPalindrome(str50k)
            XCTAssertTrue(ret)
        }
    }
    
    func testPerformance_formIndex_50k() {
        self.measure {
            let ret = isPalindrome2(str50k)
            XCTAssertTrue(ret)
        }
    }
}
