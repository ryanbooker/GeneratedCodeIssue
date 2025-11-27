// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A failure type that is mimicing the definition of `LocalizedError`.
public protocol Failure: Sendable {
  var failureDescription: String { get }
}
