//
//  Net.swift
//  AudireApollo
//
//  Created by Masinovich Artsem on 02.10.2022.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    let client = ApolloClient(url: URL(string: "https://apollo-api-infigo.herokuapp.com/")!)
}
