//
//  ContentView.swift
//  Live Activity
//
//  Created by Daiki Takano on 2023/11/05.
//

import SwiftUI
import WidgetKit
import ActivityKit
import Intents

struct ContentView: View {
  var body: some View {
    NavigationStack {
      VStack {
        Button("Start Activity") {
          addLiveActivity()
        }
      }
      .navigationTitle("Live Activities")
      .padding(15)
    }
  }

  func addLiveActivity() {
    let orderAttributes = OrderAttributes(orderNumber: 1, orderItems: "Burger")

    let initialContentState = ActivityContent(
      state: OrderAttributes.ContentState.init(status: .progress),
      staleDate: .now
    )

    do {
      let activity = try Activity<OrderAttributes>.request(
        attributes: orderAttributes,
        content: initialContentState,
        pushType: nil
      )
      print("Activity Added Successfully. id: \(activity.id)")
    } catch {
      print(error.localizedDescription)
    }

  }
}

#Preview {
  ContentView()
}







