//
//  OrderStatusLiveActivity.swift
//  OrderStatus
//
//  Created by Daiki Takano on 2023/11/05.
//

import ActivityKit
import WidgetKit
import SwiftUI


//MARK: Start
struct Order: Widget {
  var body: some WidgetConfiguration {
    ActivityConfiguration(for: OrderAttributes.self) { context in

      ZStack {
        RoundedRectangle(cornerRadius: 15, style: .continuous)
          .fill(Color(.green).gradient)
      }

    } dynamicIsland: { context in
      DynamicIsland {
        DynamicIslandExpandedRegion(.leading) {
          Text("Leading")
        }
        DynamicIslandExpandedRegion(.trailing) {
          Text("Trailing")
        }
        DynamicIslandExpandedRegion(.bottom) {
          Text("Bottom emoji")
        }
      } compactLeading: {
        Text("L")
      } compactTrailing: {
        Text("T emoji")
      } minimal: {
        Text("minimul")
      }
      .widgetURL(URL(string: "http://www.apple.com"))
      .keylineTint(Color.red)
    }
  }
}
//MARK: End

#Preview("Notification", as: .content, using: OrderAttributes.preview) {
  Order()
} contentStates: {
  OrderAttributes.ContentState.init(status: .progress)
  OrderAttributes.ContentState.init(status: .received)
}
