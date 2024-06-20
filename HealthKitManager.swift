//
//  HealthKitManager.swift
//  AlonIOS
//
//  Created by Lucas Gaston Lober Boeris on 13/6/24.
//

import HealthKit

public class HealthKitManager {
    private let healthStore = HKHealthStore()
    
    public init() {}

    public func requestAuthorization(completion: @escaping (Bool, Error?) -> Void) {
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(false, NSError(domain: "HealthKit", code: -1, userInfo: [NSLocalizedDescriptionKey: "HealthKit is not available on this device"]))
            return
        }

        let readTypes = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])
        
        healthStore.requestAuthorization(toShare: nil, read: readTypes, completion: completion)
    }

    public func fetchStepsData(startDate: Date, endDate: Date, completion: @escaping (Double?, Error?) -> Void) {
        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepsQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            guard let result = result, let sum = result.sumQuantity() else {
                completion(nil, error)
                return
            }
            
            completion(sum.doubleValue(for: HKUnit.count()), nil)
        }
        
        healthStore.execute(query)
    }
}
