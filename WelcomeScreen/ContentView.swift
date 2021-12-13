//
//  ContentView.swift
//  WelcomeScreen
//
//  Created by Philipp on 13.12.21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode

    let features = [
        Feature(title: "Great feature", description: "This one is great, you're going to love using it so much!", image: "pencil.circle"),
        Feature(title: "Second feature", description: "If you liked the first one, wait until you see this!", image: "sun.max"),
        Feature(title: "One last feature", description: "It's tempting to write a lot of text here, but please don't", image: "keyboard")
    ]

    var body: some View {
        VStack(spacing: 20) {
            ScrollView {
                VStack(spacing: 20) {
                    Image(uiImage: UIImage(named: "AppIcon") ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60)
                        .cornerRadius(10)
                        .accessibilityHidden(true)

                    Text("Welcome to \(Text("AwesomeApp").foregroundColor(.accentColor))")
                        .multilineTextAlignment(.center)
                        .font(.largeTitle.bold())

                    ForEach(features) { feature in
                        HStack {
                            Image(systemName: feature.image)
                                .frame(width: 44)
                                .font(.title)
                                .foregroundColor(.accentColor)
                                .accessibilityHidden(true)

                            VStack(alignment: .leading) {
                                Text(feature.title)
                                    .font(.headline)

                                Text(feature.description)
                                    .foregroundColor(.secondary)
                            }
                            .accessibilityElement(children: .combine)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }

            Text("Any important small print here.")
                .font(.footnote)
                .foregroundColor(.secondary)

            Button("Continue", action: close)
                .frame(maxWidth: .infinity, minHeight: 44)
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding()
    }

    func close() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
