//
//  LoadingView.swift
//  Funds
//
//  Created by Jake Quinter on 7/23/22.
//

import SwiftUI

struct LoadingView: View {
    let loadingState: LoadingState
    
    var body: some View {
        switch loadingState {
            case .loading:
                Text("Loading...")
            case .idle, .success, .failure:
                EmptyView()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(loadingState: .idle)
    }
}
