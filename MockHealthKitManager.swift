//
//  MockHealthKitManager.swift
//  alon-ios-sdk
//
//  Created by Lucas Gaston Lober Boeris on 13/6/24.
//

import Foundation

public class MockHealthKitManager: HealthKitManager {
    public override func fetchStepsData(startDate: Date, endDate: Date, completion: @escaping (Double?, Error?) -> Void) {
        let mockSteps = 10000.0  // Mock data for steps
        completion(mockSteps, nil)
    }
}
