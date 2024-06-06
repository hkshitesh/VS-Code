import XCTest

class CelsiusToFahrenheitAppUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app = nil
        super.tearDown()
    }

    func testConversion() {
        let celsiusTextField = app.textFields["Enter Celsius"]
        let convertButton = app.buttons["Convert"]
        let resultLabel = app.staticTexts["ResultLabel"]

        celsiusTextField.tap()
        celsiusTextField.typeText("25")
        convertButton.tap()

        XCTAssertEqual(resultLabel.label, "Fahrenheit: 77.0")
    }
}
