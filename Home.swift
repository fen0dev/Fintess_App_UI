//
//  Home.swift
//  FitnessApp_UI
//
//  Created by Giuseppe, De Masi on 14/03/22.
//

import SwiftUI

struct Home: View {
    
    //MARK: UI properties for week days and current week (ex: Week 9)
    @State var currentWeek: [Date] = []
    @State var currentDay: Date = Date()
    @State var showViews: [Bool] = Array(repeating: false, count: 5)
    
    var body: some View {
        VStack(spacing: 20) {
            
            HStack  {
                Text("Current Week")
                    .font(.title.bold())
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "ellipsis.circle")
                        .font(.title3)
                }
            }
            .foregroundColor(.white)
            .opacity(showViews[0] ? 1 : 0)
            .offset(y: showViews[0] ? 0 : 200)
            
            //MARK: current week view
            HStack(spacing: 10) {
                
                ForEach(currentWeek, id: \.self){date in
                    Text(extractDate(date: date))
                        .fontWeight(isSameDay(date1: currentDay, date2: date) ? .bold : .semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, isSameDay(date1: currentDay, date2: date) ? 6 : 0)
                        .padding(.horizontal, isSameDay(date1: currentDay, date2: date) ? 12 : 0)
                        .frame(width: isSameDay(date1: currentDay, date2: date) ? 180 : nil)
                        .background {
                            Capsule()
                                .fill(.ultraThinMaterial)
                                .environment(\.colorScheme, .light)
                                .opacity(isSameDay(date1: currentDay, date2: date) ? 0.8 : 0)
                        }
                        .onTapGesture {
                            withAnimation {
                                currentDay = date
                            }
                        }
                }
            }
            .padding(.top, 10)
            .opacity(showViews[1] ? 1 : 0)
            .offset(y: showViews[1] ? 0 : 200)
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text("Steps")
                    .fontWeight(.semibold)
                
                Text("6,423")
                    .font(.system(size: 40, weight: .bold))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 15)
            .opacity(showViews[2] ? 1 : 0)
            .offset(y: showViews[2] ? 0 : 200)
            
            //FitnessringCardView
            FitnessringCardView()
                .opacity(showViews[3] ? 1 : 0)
                .offset(y: showViews[3] ? 0 : 200)
            
            //FitnessStepsGraphView
            FitnessStepsGRaphView()
                .opacity(showViews[4] ? 1 : 0)
                .offset(y: showViews[4] ? 0 : 200)
        }
        .padding()
        .onAppear(perform: extractCurrentWeek)
        .onAppear(perform: animateView)
    }
    
    //MARK: animating view
    func animateView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.33) {
            withAnimation(.easeInOut) {
                showViews[0] = true
            }
            
            withAnimation(.easeInOut.delay(0.18)) {
                showViews[1] = true
            }
            
            withAnimation(.easeInOut.delay(0.23)) {
                showViews[2] = true
            }
            
            withAnimation(.easeInOut.delay(0.28)) {
                showViews[3] = true
            }
            
            withAnimation(.easeInOut.delay(0.33)) {
                showViews[4] = true
            }
        }
    }
    
    //Extracting current week & days
    func  extractCurrentWeek() {
        let calendar = Calendar.current
        let week = calendar.dateInterval(of: .weekOfMonth, for: Date())
        
        guard let firstDay = week?.start else {
            return
        }
        
        (0..<7).forEach { day in
            if let weekDay = calendar.date(byAdding: .day, value: day, to: firstDay) {
                currentWeek.append(weekDay)
            }
        }
    }
    
    //MARK: extracting custom date components
    func extractDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = (isSameDay(date1: currentDay, date2: date) ? "dd MMMM" : "dd")
        
        return (isTodayDate(date: date) && isSameDay(date1: currentDay, date2: date) ? "Today, " : "") + formatter.string(from: date)
    }
    
    //MARK: check date is today or same day
    func isTodayDate(date: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDateInToday(date)
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
