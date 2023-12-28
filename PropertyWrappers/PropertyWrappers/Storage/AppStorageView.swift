//
//  AppStorageView.swift
//  PropertyWrappers
//
//  Created by kanagasabapathy on 04/12/23.
//

import SwiftUI

struct AppStorageView: View {
    @AppStorage("preferDark") var preferMode: Bool = false
    var body: some View {
        ZStack {
            Color(preferMode ? .black : .white).ignoresSafeArea(edges: .all)
            VStack {

                Text("@AppStorage with @Binding")
                    .font(.title)
                Text("Used to access UserDefaults from multiple views in a view hierarchy")
                    .font(.subheadline)

                Spacer()

                ShapeView(preferMode: $preferMode)

                SetView(preferMode: $preferMode)

                Spacer()

                Text("@AppStorage to persistently store dark mode")
                    .foregroundStyle(preferMode ? .white : .black)
                    .font(.footnote)
            }

        }
        .animation(.easeIn, value: preferMode)
    }
}

#Preview {
    AppStorageView()
}

struct ShapeView: View {
    @Binding var preferMode: Bool
    var body: some View {
        VStack {
            if preferMode == true {
                Rectangle()
                    .strokeBorder(Color.white)
                    .foregroundStyle(Color.black)
            } else {
                Circle()
                    .strokeBorder(Color.black)
                    .foregroundStyle(Color.white)
            }
        }
        .frame(width: 200, height: 200)
    }
}

struct SetView: View {
    @Binding var preferMode: Bool
    var body: some View {
        HStack {
            Toggle(isOn: $preferMode, label: {
                Text("Dark Mode")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            })
            .frame(maxWidth: 150, alignment: .center)
            .foregroundStyle(preferMode ? .white : .black)
        }
    }
}