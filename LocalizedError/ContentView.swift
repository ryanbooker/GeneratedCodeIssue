// Copyright © 2025 Ryan Booker. All rights reserved.

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text(.helloWorld)
    }
    .padding()
  }
}

#Preview {
  ContentView()
}

/// If you remove the import of Modules and uncomment the protocol bellow this
/// you will also see the same error.
import Modules

///// A failure type that is mimicing the definition of `LocalizedError`.
/////
///// If you remove the import of Modules above and uncomment this you will also
///// see the same error.
//nonisolated  // TODO: If you comment this out, the problem goes away because MyFailure become MainActor
//protocol Failure: Sendable {
//  var failureDescription: String { get }
//}

/// This tests the idea that making the generated resources nonisolated would fix
/// the issue.
//nonisolated  // TODO: Uncomment this to fix the error on "helloAgainWorld"
extension LocalizedStringResource {
  static var helloAgainWorld: Self { .init("Hello again, world!") }
}

enum MyFailureError: Failure, LocalizedError {
  case helloWorld
  case helloAgainWorld

  var errorDescription: String {
    let resource: LocalizedStringResource =
      switch self {
      case .helloWorld: .helloWorld
      case .helloAgainWorld: .helloAgainWorld
      }

    return String(localized: resource)
  }

  var failureDescription: String {
    let resource: LocalizedStringResource =
      switch self {
      case .helloWorld: .helloWorld
      case .helloAgainWorld: .helloAgainWorld
      }

    return String(localized: resource)
  }
}
