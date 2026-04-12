# SeerrAPI
**Swift-based interface for the Seerr API, built using OpenAPI**

## Compatibility
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FGabriel-H4%2FSeerrAPI%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/Gabriel-H4/SeerrAPI) [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FGabriel-H4%2FSeerrAPI%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/Gabriel-H4/SeerrAPI)

**Warning:** This project is under active development,
and is not yet intended for public use.

## Usage

```swift
import SeerrAPI

let client = SeerrAPI()
let version = try? await client.getVersion()
```
