//
//  SeerrAPI.swift
//  SeerrAPI
//
//  Created by Gabriel Hassebrock on 4/10/26.
//

//import Foundation
//import OpenAPIRuntime
//import OpenAPIURLSession
//
//public struct SeerrAPI {
//
//    /// The underlying generated client to make HTTP requests to the SeerrAPI.
//    private let underlyingClient: any APIProtocol
//
//    /// An optional username to specifiy whom to interact with the API as
//    private let username: String?
//    
//    /// An optional key used to authenticate with the API
//    private let apiKey: String?
//
//    /// An internal initializer used by other initializers and by tests.
//    /// - Parameter underlyingClient: The client to use to make HTTP requests.
//    internal init(
//        underlyingClient: any APIProtocol,
//        username: String? = nil,
//        apiKey: String? = nil
//    ) {
//        self.underlyingClient = underlyingClient
//        self.username = username
//        self.apiKey = apiKey
//    }
//
//    /// Create a new client for the SeerrAPI, using a locally-running server.
//    /// at http:\/\/127.0.0.1:8081\/seerr
//    public init() throws {
//        let url = try Servers.Server2.url()
//        self.init(
//            underlyingClient: Client(
//                serverURL: url,
//                transport: URLSessionTransport()
//            )
//        )
//    }
//
//    /// Creates a new client for the SeerrAPI, using a custom URL.
//    /// - Parameters:
//    ///     - baseURL: The URL of the Seerr API
//    ///     -  username: An optional username to specifiy whom to interact with the API as
//    ///     - apiKey: An optional key used to authenticate with the API
//    /// - Throws: URLError.badURL if the String cannot be converted into a valid URL
//    public init(baseURL: String, username: String? = nil, apiKey: String? = nil)
//        throws(URLError)
//    {
//        guard let url = URL(string: baseURL) else {
//            throw URLError(.badURL)
//        }
//        let client = Client(serverURL: url, transport: URLSessionTransport())
//        self.init(underlyingClient: client)
//    }
//
//    /// Creates a new client for the SeerrAPI, using a custom URL.
//    /// - Parameters:
//    ///     - baseURL: The URL of the Seerr server
//    ///     -  username: An optional username to specifiy whom to interact with the API as
//    ///     - apiKey: An optional key used to authenticate with the server
//    public init(baseURL: URL, username: String? = nil, apiKey: String? = nil) {
//        let client = Client(
//            serverURL: baseURL,
//            transport: URLSessionTransport()
//        )
//        self.init(underlyingClient: client)
//    }
//
//    /// Fetches the version of the Seerr server.
//    /// - Returns: The running version
//    /// - Throws: A ``APIError`` if the underlying HTTP client fails to fetch information
//    public func getVersion() async throws(SeerrAPI.APIError) -> String {
//        if let response = try? await underlyingClient.getStatus() {
//            switch response {
//            case .ok(let payload):
//                guard let version = try? payload.body.json.version else {
//                    throw SeerrAPI.APIError.emptyResponse
//                }
//                return version
//            case .undocumented(statusCode: let code, _):
//                throw SeerrAPI.APIError.undocumentedResponse(code: code)
//            }
//        } else {
//            throw SeerrAPI.APIError.noResponse
//        }
//    }
//}
