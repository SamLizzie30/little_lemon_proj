import SwiftUI


struct MainView: View {
    
    @StateObject var model = Model()
    @State private var selectedIndex = 0
    @State private var path = NavigationPath()
    
    var body: some View {
        
        
        NavigationStack(path: $path) {
                    VStack {
                        if selectedIndex == 0 {
                            LocationsView()
                        } else if selectedIndex == 1 {
                            ReservationView()
                        }

                    }
                    .navigationTitle(selectedIndex == 0 ? "Locations" : "Reservation")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                path.append("profile")
                            }) {
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                            }
                        }
                    }
                    .navigationDestination(for: String.self) { value in
                        if value == "profile" {
                            ProfileView()
                        }
                    }
                }
                .environmentObject(model)

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Model())
    }
}

