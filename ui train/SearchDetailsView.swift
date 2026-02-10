//
//  SearchDetailsView.swift
//  ui train
//
//  Created by Ben Romdhane on 04/02/2026.
//

import SwiftUI

struct SearchDetailsView: View {
    @StateObject var searchDetailsViewModel: SearchDetailsViewModel
    @State var login: String
    var body: some View {
        if searchDetailsViewModel.isLoading {
            ProgressView()
        } else if let errorMessage = searchDetailsViewModel.errorMessage {
            Text(errorMessage)
            Button("Retry") {
                Task {
                    await searchDetailsViewModel.fetchUserDetails(login: login)
                }
            }
        } else if let detail = searchDetailsViewModel.detail {
            VStack(spacing: 8) {
                AsyncImage(url: detail.avatarUrl) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable().scaledToFit()
                    case .failure:
                        Image(systemName: "person.crop.circle.badge.exclamationmark")
                            .resizable().scaledToFit()
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                Text(detail.login).bold()
                Text(detail.bio ?? "—").italic()
                Text("Followers: \(detail.followers)")
                Text("Following: \(detail.following)")
            }
            .padding()
            .navigationTitle("Profil")
            .task {
                await searchDetailsViewModel.fetchUserDetails(login: login)
            }
        }
    }
}

#Preview {
    SearchDetailsView(searchDetailsViewModel: SearchDetailsViewModel(userDetailsService: UserDetailServiceMock()), login: "")
}
