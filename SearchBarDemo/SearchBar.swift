//
//  SearchBar.swift
//  SearchBarDemo
//
//  Created by Kristijan Kralj on 02/04/2020.
//  Copyright © 2020 Kristijan Kralj. All rights reserved.
//

import SwiftUI

struct SearchBar : UIViewRepresentable {
  @Binding var text : String
  
  func searchBar(_ searchBar: UISearchBar,
                 textDidChange searchText: String) {
    text = searchText
  }
  
  func makeCoordinator() -> Cordinator {
    return Cordinator(text: $text)
  }
  func makeUIView(context: UIViewRepresentableContext<SearchBar>)
    -> UISearchBar {
      
      let searchBar = UISearchBar(frame: .zero)
      searchBar.delegate = context.coordinator
      return searchBar
  }
  func updateUIView(_ uiView: UISearchBar,
                    context: UIViewRepresentableContext<SearchBar>) {
    uiView.text = text
  }
  
  class Cordinator : NSObject, UISearchBarDelegate {
    @Binding var text : String
    init(text : Binding<String>)
    {
      _text = text
    }
    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String)
    {
      text = searchText
    }
  }
}


