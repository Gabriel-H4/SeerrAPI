//
//  SeerrAPI.swift
//  SeerrAPI
//
//  Created by Gabriel Hassebrock on 4/10/26.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

public struct SeerrAPI {

    /// The underlying generated client to make HTTP requests to the SeerrAPI.
    private let underlyingClient: any APIProtocol

    /// An internal initializer used by other initializers and by tests.
    /// - Parameter underlyingClient: The client to use to make HTTP requests.
    internal init(underlyingClient: any APIProtocol) {
        self.underlyingClient = underlyingClient
    }

    /// Creates a new client for the SeerrAPI
    public init() {
        self.init(
            underlyingClient: Client(
                serverURL: try! Servers.Server2.url(),
                transport: URLSessionTransport()
            )
        )
    }

    /// Fetches the version of the provided Seerr server.
    /// - Returns: The running version
    /// - Throws: An error if the underlying HTTP client fails to fetch information
    public func getVersion() async throws(SeerrAPI.APIError) -> String {
        if let response = try? await underlyingClient.getStatus() {
            switch response {
                case .ok(let payload):
                    guard let version = try? payload.body.json.version else {
                        throw SeerrAPI.APIError.emptyResponse
                    }
                    return version
                case .undocumented(statusCode: let code, _):
                    throw SeerrAPI.APIError.undocumentedResponse(code: code)
            }
        }
        else {
            throw SeerrAPI.APIError.noResponse
        }
    }
}
