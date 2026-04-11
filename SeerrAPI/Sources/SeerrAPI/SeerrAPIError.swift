//
//  SeerrAPIError.swift
//  SeerrAPI
//
//  Created by Gabriel Hassebrock on 4/10/26.
//

extension SeerrAPI {
    public enum APIError: Error {
        case noResponse
        case emptyResponse
        case undocumentedResponse(code: Int)
    }
}
