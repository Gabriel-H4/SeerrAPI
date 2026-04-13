//
//  TestingTransport.swift
//  SeerrAPI
//
//  Created by Gabriel Hassebrock on 4/13/26.
//

import Foundation
import HTTPTypes
import OpenAPIRuntime

struct TestingTransport: ClientTransport {
    func send(_ request: HTTPTypes.HTTPRequest, body: HTTPBody?, baseURL: URL, operationID: String) async throws -> (
        HTTPTypes.HTTPResponse,
        OpenAPIRuntime.HTTPBody?
    ) {
        var response = ""
        
        switch request.path {
            case "/status":
                response = TestResponseBody.status.rawValue
            default:
                response = TestResponseBody.empty.rawValue
        }
        
        return (HTTPResponse(status: .ok), HTTPBody(response))
    }
}

enum TestResponseBody: String {
    case status = "{\"version\": \"0.0.1\",\"commitTag\": \"abc123\",\"updateAvailable\": false,\"commitsBehind\": 5,\"restartRequired\": true}"
    case empty = "{}"
}
