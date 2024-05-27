//
//  ContentView.swift
//  Landmaks
//
//  Created by Md Shofiulla on 27/5/24.
//

import SwiftUI

struct LandmarkMainView: View {
    @StateObject private var viewModel = LandmarkViewModel(landmarservice: LocalLandmarkDataProvider())
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.landmarks) { landmark in
                    ListItem(landmark: landmark)
                        .listRowSeparator(.hidden, edges:.all)
                }
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            .navigationTitle("My Landmarks")
            .navigationBarTitleDisplayMode(.large)
        }
        
        
    }
}

private struct ListItem: View {
    let landmark: LandmarkModel
    init(landmark: LandmarkModel) {
        self.landmark = landmark
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                Image(systemName: "building.2")
                    .resizable()
                    .frame(width: 38,height: 42)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                VStack(alignment: .leading, spacing: 0) {
                    Text(landmark.name ?? "")
                        .foregroundStyle(Color.black)
                        .font(.headline)
                        .lineLimit(1)
                    Text(landmark.subtitle ?? "")
                        .foregroundStyle(Color.black)
                        .font(.subheadline)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                }
            }
            Image(LandmarkAssets.path(landmark.imageName ?? "").urlString)
                .resizable()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 200)
                .aspectRatio(contentMode: .fill)
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        }
    }
}

#Preview {
    LandmarkMainView()
}
