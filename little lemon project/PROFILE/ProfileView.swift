import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var model:Model
    @State private var firstName : String = ""
    @State private var lastName : String = ""
    @State private var email : String = ""
    @State private var phoneNumber : String = ""
    
    // Estados de los checkboxes
    @State private var item1Checked: Bool = false
    @State private var item2Checked: Bool = false
    @State private var item3Checked: Bool = false
    @State private var item4Checked: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Personal Information").fontWeight(.bold)

            HStack(spacing: 16) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())

                Button("Change") {
                    print("Change")
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("Remove") {
                    print("Remove")
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            Text("First Name")
            TextField("First Name", text: $firstName).padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal)
            Text("Last Name")

            TextField("Last Name", text: $lastName).padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal)
            
            Text("Email")
            TextField("Email", text: $email).padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal)
            
            Text("Phone Number")
            TextField("Phone Number", text: $phoneNumber).padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal)
            
            Spacer()
            Text("Email Notifications").fontWeight(.bold)
            
            checkbox(title: "Other Statuses", isChecked: $item1Checked)
            checkbox(title: "Password changes", isChecked: $item2Checked)
            checkbox(title: "Special offers", isChecked: $item3Checked)
            checkbox(title: "Newsletter", isChecked: $item4Checked)
            
            Button("Log out") {
                print("logout")
            }
            .padding()
            .background(Color.yellow)
            .foregroundColor(.black)
            .cornerRadius(10)

            
            HStack(spacing: 16) {

                Button("Discard changes") {
                    print("Discard changes")
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("Save changes") {
                    print("Save changes")
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading) // Ensure full width & align left
    }
    
    
    @ViewBuilder
    func checkbox(title: String, isChecked: Binding<Bool>) -> some View {
        Button(action: {
            isChecked.wrappedValue.toggle()
        }) {
            HStack {
                Image(systemName: isChecked.wrappedValue ? "checkmark.square" : "square")
                    .foregroundColor(.blue)
                Text(title)
                    .foregroundColor(.primary)
            }
        }
        .buttonStyle(PlainButtonStyle()) // evita que se vea como botón por defecto
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(Model())
    }
}
