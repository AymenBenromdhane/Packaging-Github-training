//
//  SearchDetailsView.swift
//  ui train
//
//  Created by Ben Romdhane on 04/02/2026.
//

import SwiftUI
import Domain
import Data
import Networking

struct SearchDetailsView: View {
    @StateObject var searchDetailsViewModel: SearchDetailsViewModel
    @State var login: String
    
    var body: some View {
        Group {
            if searchDetailsViewModel.isLoading {
                ProgressView("Chargement...")
            } else if let errorMessage = searchDetailsViewModel.errorMessage {
                VStack(spacing: 16) {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                    Button("Réessayer") {
                        Task {
                            await searchDetailsViewModel.fetchUserDetails(login: login)
                        }
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
                    .frame(width: 128, height: 128)
                    .clipShape(Circle())
                    
                    Text(detail.login)
                        .font(.title)
                        .bold()
                    
                    if let name = detail.name {
                        Text(name)
                            .font(.headline)
                    }
                    
                    if let bio = detail.bio {
                        Text(bio)
                            .italic()
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    
                    HStack(spacing: 32) {
                        VStack {
                            Text("\(detail.followers)")
                                .font(.title2)
                                .bold()
                            Text("Followers")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        
                        VStack {
                            Text("\(detail.following)")
                                .font(.title2)
                                .bold()
                            Text("Following")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(.top)
                }
                .padding()
            } else {
                // État par défaut (aucune donnée encore)
                ProgressView("Chargement...")
            }
        }
        .navigationTitle("Profil")
        .task {
            await searchDetailsViewModel.fetchUserDetails(login: login)
        }
    }
}

#Preview {
    // Construction manuelle des dépendances pour le preview
    let networkClient = NetworkClientImpl()
    let service = UsersRemoteServiceImpl(networkClient: networkClient)
    let userDetailsRepo = UserDetailsRepositoryImpl(remoteService: service)
    let detailsUseCase = GetUserDetailsUseCaseImpl(repository: userDetailsRepo)
    
    return SearchDetailsView(
        searchDetailsViewModel: SearchDetailsViewModel(getUserDetailsUseCase: detailsUseCase),
        login: "aymen"
    )
}
