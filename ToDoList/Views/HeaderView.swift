//
//  HeaderView.swift
//  ToDoList
//
//  Created by Eslam Ghazy on 31/7/23.
//

import SwiftUI

struct HeaderView: View {
    
    let title :String
    let subTitle:String
    let angle :Double
    let backgroun:Color
    
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroun)
                .rotationEffect(Angle(degrees: angle))
            
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
                
                
            }
            .padding(.top,80)
            
        }.frame(width: UIScreen.main.bounds.width*3,height: 350)
            .offset(y:-150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title",
                   subTitle: "Sub title",
                   angle: 15,
                   backgroun:.blue)
    }
}
