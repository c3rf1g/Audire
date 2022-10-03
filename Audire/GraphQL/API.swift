// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ExampleQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ExampleQuery($address: String!) {
      getUserData(address: $address) {
        __typename
        address
        balance_clio
        balance_ton
        balance_usdt
      }
    }
    """

  public let operationName: String = "ExampleQuery"

  public var address: String

  public init(address: String) {
    self.address = address
  }

  public var variables: GraphQLMap? {
    return ["address": address]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUserData", arguments: ["address": GraphQLVariable("address")], type: .object(GetUserDatum.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getUserData: GetUserDatum? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getUserData": getUserData.flatMap { (value: GetUserDatum) -> ResultMap in value.resultMap }])
    }

    /// Get user data
    public var getUserData: GetUserDatum? {
      get {
        return (resultMap["getUserData"] as? ResultMap).flatMap { GetUserDatum(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "getUserData")
      }
    }

    public struct GetUserDatum: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("address", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("balance_clio", type: .nonNull(.scalar(Double.self))),
        GraphQLField("balance_ton", type: .nonNull(.scalar(Double.self))),
        GraphQLField("balance_usdt", type: .nonNull(.scalar(Double.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(address: GraphQLID, balanceClio: Double, balanceTon: Double, balanceUsdt: Double) {
        self.init(unsafeResultMap: ["__typename": "User", "address": address, "balance_clio": balanceClio, "balance_ton": balanceTon, "balance_usdt": balanceUsdt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Name of the user
      public var address: GraphQLID {
        get {
          return resultMap["address"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "address")
        }
      }

      /// balance clio
      public var balanceClio: Double {
        get {
          return resultMap["balance_clio"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "balance_clio")
        }
      }

      /// balance ton
      public var balanceTon: Double {
        get {
          return resultMap["balance_ton"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "balance_ton")
        }
      }

      /// balance usdt
      public var balanceUsdt: Double {
        get {
          return resultMap["balance_usdt"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "balance_usdt")
        }
      }
    }
  }
}
