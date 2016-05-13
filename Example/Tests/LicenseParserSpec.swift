// https://github.com/Quick/Quick

import Quick
import Nimble
import LicenseParser

class LicenseParserSpec: QuickSpec {
  override func spec() {
    describe("Exists") {
      it("should be"){
        let _ = LicenseParser.Parser()
      }
    }
  }
}
