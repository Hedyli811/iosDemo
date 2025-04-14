import SwiftUI
import SwiftData

struct BookDetailView: View {
  
    @Bindable var viewModel : BookDetailViewModel
    @State private var showcoverAssignedAlert = false

    var body: some View {
        Form{
            Section(header:Text("Ttitle")){
                Text(viewModel.book.title)
            }
            
            Section(header:Text("Authos")){
                ForEach(viewModel.authors,id:\.id){
                   author in
                    Button{
                        viewModel.toggleAuthor(author)
                    }label:{
                        HStack{
                            Text(author.name)
                            Spacer()
                            if viewModel.book.authors.contains(author){
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            }
            
            Section(header:Text("Cover")){
                if let imageName = viewModel.book.cover?.imageName{
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height:200)
                }
                if viewModel.book.cover == nil {
                    Text("cover Image: Not assigned")
                    Button("assign sample cover"){
                        viewModel.assignSampleCover()
                        showcoverAssignedAlert = true
                    }
                }
            }
        }
        .navigationTitle(viewModel.book.title)
        .alert("cover assigned",isPresented:$showcoverAssignedAlert){
            Button("OK",role: .cancel){}
        }
        
    }

 
}
