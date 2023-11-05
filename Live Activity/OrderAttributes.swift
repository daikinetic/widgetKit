//
//  OrderAttributes.swift
//  Live Activity
//
//  Created by Daiki Takano on 2023/11/05.
//

import ActivityKit
import WidgetKit
import SwiftUI


//MARK: Start
public struct OrderAttributes: ActivityAttributes {
  public struct ContentState: Codable, Hashable {
    var status: OrderStatus = .received
  }

  public init(orderNumber: Int, orderItems: String) {
    self.orderNumber = orderNumber
    self.orderItems = orderItems
  }

  var orderNumber: Int
  var orderItems: String
}

public enum OrderStatus: String, CaseIterable, Codable, Equatable {
  case received = "shippingbox.fill"
  case progress = "person.bust"
  case ready = "takeoutbag.and.cup.and.straw.fill"

  init() {
    self = .received
  }
}
//MARK: End

extension OrderAttributes {
  public static var preview: OrderAttributes {
    OrderAttributes(orderNumber: 1, orderItems: "burgur")
  }
}

