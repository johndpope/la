import XCTest

@testable import La

final class MatrixTests: XCTestCase, Tests {
    func testCreate() {
        let a = Matrix<Three, Two, Float>([
            0, 1,
            2, 3,
            4, 5,
        ])
        let b = Matrix<Three, Two, Float>([
            0, 1,
            2, 3,
        ])
        let c = Matrix<Three, Two, Float>([
            0,
            2,
            4,
        ])
        let d = Matrix<Two, Two, Float>([
            0, 1,
            2, 3,
            4, 5,
        ])
        let e = Matrix<Three, One, Float>([
            0, 1,
            2, 3,
            4, 5,
        ])
        let f = Matrix<Zero, One, Float>([])
        let g = Matrix<One, Zero, Float>([])
        XCTAssertNotNil(a)
        XCTAssertNil(b)
        XCTAssertNil(c)
        XCTAssertNil(d)
        XCTAssertNil(e)
        XCTAssertNil(f)
        XCTAssertNil(g)
    }

    func testEntities() {
        let entities: [Float] = [
            0, 1,
            2, 3,
            4, 5,
        ]
        let a = Matrix<Three, Two, Float>(entities)!
        XCTAssertEqual(a.entities, entities)
    }

    func testSubscript() {
        let a = Matrix<Three, Two, Float>([
            0, 1,
            2, 3,
            4, 5,
        ])!
        XCTAssertEqual(a[0, 1], 1)
    }

    func testEquality() {
        let a = Matrix<Three, Two, Float>([
            0, 1,
            2, 3,
            4, 5,
        ])!
        let b = Matrix<Three, Two, Float>([
            0, 1,
            2, 3,
            4, 5,
        ])!
        XCTAssertEqual(a, b)
        XCTAssertEqual(b, a)
    }

    func testAddition() {
        let a = Matrix<Three, Two, Float>([
            0, -1,
            2, -3,
            4, -5,
        ])!
        let b = Matrix<Three, Two, Float>([
            0, 1,
            2, 3,
            4, 5,
        ])!
        let c = Matrix<Three, Two, Float>([
            0, 0,
            4, 0,
            8, 0,
        ])!
        XCTAssertEqual(a + b, c)
        XCTAssertEqual(b + a, c)
    }

    func testSubstraction() {
        let a = Matrix<Three, Two, Float>([
            0, -1,
            2, -3,
            4, -5,
        ])!
        let b = Matrix<Three, Two, Float>([
            -0, -1,
            -2, -3,
            -4, -5,
        ])!
        let c = Matrix<Three, Two, Float>([
            0, 0,
            4, 0,
            8, 0,
        ])!
        XCTAssertEqual(a - b, c)
    }

    func testZeroAddition() {
        let a = Matrix<Three, Two, Float>([
            0, -1,
            2, -3,
            4, -5,
        ])!
        let z = Matrix<Three, Two, Float>.zeros()
        XCTAssertEqual(a + z, a)
    }

    func testAdditiveInverse() {
        let a = Matrix<Three, Two, Float>([
            0, -1,
            2, -3,
            4, -5,
        ])!
        let inverse = -a
        XCTAssertEqual(a + inverse, Matrix<Three, Two, Float>.zeros())
    }

    func testAssociativity() {
        let a = Matrix<Three, Two, Float>([
            0, -1,
            2, -3,
            4, -5,
        ])!
        let b = Matrix<Three, Two, Float>([
            0, 1,
            2, 3,
            4, 5,
        ])!
        let c = Matrix<Three, Two, Float>([
            1, 2,
            3, 4,
            5, 6,
        ])!
        XCTAssertEqual((a + b) + c, a + (b + c))
    }

    func testScalarMultiplication() {
        let a: Float = 2
        let b = Matrix<Two, Two, Float>([
            6, 4,
            4, 14,
        ])!
        let c = Matrix<Two, Two, Float>([
            12, 8,
            8, 28,
        ])!
        XCTAssertEqual(a * b, c)
        XCTAssertEqual(a * b, b * a)
    }

    func testMultiplication() {
        let a = Matrix<Three, Three, Float>([
            1, 1, 2,
            1, 2, 3,
            1, 4, 9,
        ])!
        let b = Matrix<Three, Two, Float>([
            0, 1,
            1, -1,
            2, 0,
        ])!
        let c = Matrix<Three, Two, Float>([
            5, 0,
            8, -1,
            22, -3,
        ])!
        XCTAssertEqual(a * b, c)
    }

    func testTranspose() {
        let a = Matrix<Three, Two, Float>([
            0, 1,
            2, 3,
            4, 5,
        ])!
        let b = Matrix<Two, Three, Float>([
            0, 2, 4,
            1, 3, 5,
        ])
        XCTAssertEqual(a.t, b)
    }

    static let allTests: [(String, (MatrixTests) -> () -> ())] = [
        ("testCreate", testCreate),
        ("testEntities", testEntities),
        ("testSubscript", testSubscript),
        ("testEquality", testEquality),
        ("testAddition", testAddition),
        ("testSubctraction", testSubstraction),
        ("testZeroAddition", testZeroAddition),
        ("testAdditiveInverse", testAdditiveInverse),
        ("testAssociativity", testAssociativity),
        ("testScalarMultiplication", testScalarMultiplication),
        ("testMultiplication", testMultiplication),
        ("testTranspose", testTranspose),
    ]
}
