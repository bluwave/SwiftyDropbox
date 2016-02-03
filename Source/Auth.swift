
/* Autogenerated. Do not edit. */

import Foundation
/**
 Datatypes and serializers for the auth namespace
 */
public class Auth {
    /**
     Errors occurred during authentication.
     */
    public enum AuthError: CustomStringConvertible {
        /**
         The access token is invalid.
         */
        case InvalidAccessToken
        /**
         The user specified in 'Dropbox-API-Select-User' is no longer on the team.
         */
        case InvalidSelectUser
        /**
         An unspecified error.
         */
        case Other
        public var description : String {
            return "\(prepareJSONForSerialization(AuthErrorSerializer().serialize(self)))"
        }
    }
    public class AuthErrorSerializer: JSONSerializer {
        public init() { }
        public func serialize(value: AuthError) -> JSON {
            switch value {
            case .InvalidAccessToken:
                var d = [String : JSON]()
                d[".tag"] = .Str("invalid_access_token")
                return .Dictionary(d)
            case .InvalidSelectUser:
                var d = [String : JSON]()
                d[".tag"] = .Str("invalid_select_user")
                return .Dictionary(d)
            case .Other:
                var d = [String : JSON]()
                d[".tag"] = .Str("other")
                return .Dictionary(d)
            }
        }
        public func deserialize(json: JSON) -> AuthError {
            switch json {
            case .Dictionary(let d):
                let tag = Serialization.getTag(d)
                switch tag {
                case "invalid_access_token":
                    return AuthError.InvalidAccessToken
                case "invalid_select_user":
                    return AuthError.InvalidSelectUser
                case "other":
                    return AuthError.Other
                default:
                    return AuthError.Other
                }
            default:
                fatalError("Failed to deserialize")
            }
        }
    }
}