//
//  ContentView.swift
//  SearchBarDemo
//
//  Created by Kristijan Kralj on 02/04/2020.
//  Copyright © 2020 Kristijan Kralj. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  let djs = [
    "Dimitri Vegas and Like Mike",
    "Martin Garrix",
    "David Guetta",
    "Armin Van Buuren",
    "Marshmelllo",
    "Don Diablo",
    "Oliver Heldens",
    "Tiesto",
    "Afrojack",
    "Steve Aoki"
  ]
  
  @State private var searchTerm : String = ""
  
  var body: some View {
    NavigationView{
      List {
        SearchBar(text: $searchTerm)
        ForEach(self.djs.filter { self.searchTerm.isEmpty ? true : $0.contains(self.searchTerm) }, id: \.self) { name in
          Text(name)
        }
      }
      .navigationBarTitle(Text("Top 10 DJs"))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
