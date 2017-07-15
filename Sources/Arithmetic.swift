public protocol Arithmetic: Signed, Addition, Multiplication, Equatable {
}

public protocol Signed {
    static prefix func - (_ a: Self) -> Self
}

public protocol Addition {
    static func + (_ a: Self, _ b: Self) -> Self
}

public protocol Multiplication {
    static func * (_ a: Self, _ b: Self) -> Self
}

public protocol PartialAddition {
    static func + (_ a: Self, _ b: Self) -> Result<Self>
}
