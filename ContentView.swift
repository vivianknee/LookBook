import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "Recent Fits"
    
    var body: some View {
        ZStack {
            // Backdrop
            VStack {
                LinearGradient(colors: [.purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(height: UIScreen.main.bounds.height * 0.6)
                    .ignoresSafeArea()
                
                Spacer()
            }
            
            VStack(spacing: 0) {
                // Fixed Header Section
                VStack(spacing: 20) {
                    // Profile Section
                    VStack(spacing: 12) {
                        // Circular Profile Photo
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color.blue)
                            .clipShape(Circle())
                        
                        // Username
                        Text("@fashionista")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        // Stats Row
                        HStack(spacing: 40) {
                            VStack {
                                Text("1.2K")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text("Followers")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            VStack {
                                Text("856")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text("Following")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            }
                            
                            VStack {
                                Text("234")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text("Looks")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding(.top, 75)
                    
                    // Highlights Section
                    VStack(alignment: .leading, spacing: 12) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(0..<8) { index in
                                    VStack {
                                        Circle()
                                            .fill(Color.gray)
                                            .frame(width: 70, height: 70)
                                        
                                        Text("Collection \(index + 1)")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // Tabs Section
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Button(action: { selectedTab = "Recent Fits" }) {
                                Text("Recent Fits")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(selectedTab == "Recent Fits" ? .primary : .secondary)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                            }
                            
                            Button(action: { selectedTab = "Collections" }) {
                                Text("Collections")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(selectedTab == "Collections" ? .primary : .secondary)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                            }
                        }
                        
                        // Separator Line
                        Rectangle()
                            .fill(Color.secondary.opacity(0.3))
                            .frame(height: 1)
                    }
                    .padding(.horizontal)
                }
                
                // Scrollable Content Section
                ScrollView {
                    if selectedTab == "Recent Fits" {
                        // Posts Grid
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 3), spacing: 4) {
                            ForEach(0..<15) { index in
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.gray)
                                    .frame(height: 180) // Made posts longer vertically
                                    .overlay(
                                        VStack {
                                            Image(systemName: "heart.fill")
                                                .foregroundColor(.white)
                                                .font(.title2)
                                            Text("Post \(index + 1)")
                                                .font(.caption)
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                        }
                                    )
                            }
                        }
                        .padding(.horizontal, 4)
                        .padding(.top, 20)
                        .padding(.bottom, 18)
                    } else {
                        // Collections View
                        VStack(spacing: 12) {
                            ForEach(0..<10) { index in
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray)
                                    .frame(height: 120)
                                    .overlay(
                                        HStack {
                                            VStack(alignment: .leading, spacing: 8) {
                                                Text("Collection \(index + 1)")
                                                    .font(.title3)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.white)
                                                
                                                Text("\(Int.random(in: 5...50)) items")
                                                    .font(.caption)
                                                    .foregroundColor(.white.opacity(0.8))
                                            }
                                            .padding(.leading, 16)
                                            
                                            Spacer()
                                        }
                                    )
                                    .shadow(radius: 3)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 20)
                        .padding(.bottom, 18)
                    }
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .offset(y: 180)
                    .ignoresSafeArea()
            )
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ContentView()
}
