//
//  eeeLiveActivity.swift
//  eee
//
//  Created by Daiki Takano on 2023/11/05.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct eeeAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct eeeLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: eeeAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension eeeAttributes {
    fileprivate static var preview: eeeAttributes {
        eeeAttributes(name: "World")
    }
}

extension eeeAttributes.ContentState {
    fileprivate static var smiley: eeeAttributes.ContentState {
        eeeAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: eeeAttributes.ContentState {
         eeeAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: eeeAttributes.preview) {
   eeeLiveActivity()
} contentStates: {
    eeeAttributes.ContentState.smiley
    eeeAttributes.ContentState.starEyes
}
