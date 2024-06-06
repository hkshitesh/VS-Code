import XCTest

class AreaCalculatorAppUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testAreaCalculation() throws {
        let lengthTextField = app.textFields["Enter length"]
        let widthTextField = app.textFields["Enter width"]
        let calculateButton = app.buttons["Calculate"]
        let resultLabel = app.staticTexts["ResultLabel"]

        // Enter values and calculate area
        lengthTextField.tap()
        lengthTextField.typeText("10")
        widthTextField.tap()
        widthTextField.typeText("5")
        calculateButton.tap()

        // Verify result
        XCTAssertEqual(resultLabel.label, "Area: 50.0")
    }
}
