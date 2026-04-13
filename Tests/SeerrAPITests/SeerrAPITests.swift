//
//  SeerrAPITests.swift
//  SeerrAPI
//
//  Created by Gabriel Hassebrock on 4/13/26.
//

import Foundation
import Testing
@testable import SeerrAPI

@Test func getVersion() async throws {
    let client = Client(
        serverURL: URL(string: "https://example.com")!,
        transport: TestingTransport()
    )
    let seerr = SeerrAPI(underlyingClient: client)
    let version = try? await seerr.getVersion()
    #expect(version == "0.0.1")
}
