//
//  ContentView.swift
//  ListSampleSwiftUI
//
//  Created by hicka04 on 2019/06/26.
//  Copyright © 2019 hicka04. All rights reserved.
//

import SwiftUI

struct ContentView : View {
  
  @State var numbers: [Int] = []
  
  var body: some View {
    NavigationView {
      List(numbers) { number in
        Text("\(number)")
      }
      .navigationBarTitle(Text("SwiftUI"),
                          displayMode: .inline)
      .navigationBarItems(trailing:
        Button(action: { self.numbers.append(self.numbers.count) },
               label: {Image(systemName: "plus")} )
      )
    }
  }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
