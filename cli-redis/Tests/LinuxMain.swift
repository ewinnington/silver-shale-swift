import XCTest

import cli_redisTests

var tests = [XCTestCaseEntry]()
tests += cli_redisTests.allTests()
XCTMain(tests)
