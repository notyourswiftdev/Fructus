//
//  SettingsView.swift
//  Fructus
//
//  Created by Aaron Cleveland on 5/14/21.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties -
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    // MARK: - Body -
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // MARK: - Section 1 -
                    GroupBox(label: SettingsLabelView(labelText: "Fructus", labelImage: "info.circle"), content: {
                        Divider().padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10, content: {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        })
                    })
                    
                    // MARK: - Section 2 -
                    GroupBox(label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush"), content: {
                        Divider().padding(.vertical, 4)
                        Text("If you wish, you can restart the application by toggle the switch in this box. Thay way is starts the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isOnboarding, label: {
                            if isOnboarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        })
                        .padding()
                        .background(Color(.tertiarySystemBackground)
                                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous)))
                        
                    })
                    
                    // MARK: - Section 3 -
                    GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone"), content: {
                        SettingsRowView(name: "Developer", content: "Aaron Cleveland")
                        SettingsRowView(name: "Designer", content: "Aaron Cleveland")
                        SettingsRowView(name: "Compatibility", content: "iOS 14")
                        SettingsRowView(name: "Website", linkLabel: "Aaron Porfolio", linkDestination: "aaroncleveland.com")
                        SettingsRowView(name: "Twitter", linkLabel: "@amclv0", linkDestination: "twitter.com/amclv0")
                        SettingsRowView(name: "SwiftUI", content: "2.0")
                        SettingsRowView(name: "Version", content: "1.0")
                    })
                } //: VSTACK
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                }))
                .padding()
            } //: SCROLL
        } //: NAVIGATION
    }
}

// MARK: - Preview -
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 11 Pro")
    }
}
