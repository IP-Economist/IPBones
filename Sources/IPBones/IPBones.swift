//
//  IPBones.swift
//  ipbones
// Created by IP-Economist 2026

import Foundation

public typealias Number = any Numeric

/// This module collects data from the Internet to get costs for calculation of added value
/// - Warning: In development
public struct IPBones_CollectData {
    // TODO:
}


public enum IPError: Error {
    case NoData(String)
    case InsufficientData(String)
    case Common(String)
}


public struct AnalysisData {
    var name: String
    var value: Number
    
    public init(name: String, value: Number) {
        self.name = name
        self.value = value
    }
}

/// functions to evaluate the cost of an object and calculate royalties
public struct IPBones_Value {
    /// cost of an object
    var cost: Int?
    /// added value
    var addedCoefficient: Int?
    
    /// Data for regression analysis
    var data: [AnalysisData]?
    
    public init(
        cost: Int,
        addedCoefficient: Int
    ) {
        self.cost = cost
        self.addedCoefficient = addedCoefficient
    }
    
    public init(
        cost: Int,
        data: [AnalysisData]
    ){
        self.cost = cost
        self.data = data
    }
    
    /// Regression coefficients
    /// - Note: Only one regression coefficient. Only one parameter
    private func calculateRegressionCoef() throws -> (const: Double, coef1: Double) {
        guard let data = self.data else {
            throw IPError.NoData("Data is absent")
        }
        guard data.count >= 2 else {
            throw IPError.InsufficientData("Data.count must be bigger or equal to 2")
        }
        
        let n: Int = data.count
        let indices = Array(0..<n)
        
        let yValues: [Double] = data.compactMap { element in
            if let doubleValue = element.value as? Double {
                return doubleValue
            } else if let intValue = element.value as? Int {
                return Double(intValue)
            } else {
                return nil
            }
        }
        guard yValues.count == n else {
            throw IPError.Common("")
        }
        
        let meanX = Double(indices.reduce(0, +)) / Double(n)
        let meanY = yValues.reduce(0, +) / Double(n)
        
        var numerator = 0.0   // sum ((x - meanX) * (y - meanY))
        var denominator = 0.0
        
        for i in 0..<n {
            let x = Double(indices[i])
            let y = yValues[i]
            numerator += (x - meanX) * (y - meanY)
            denominator += (x - meanX) * (x - meanX)
        }
        
        guard denominator != 0 else {
            throw IPError.Common("All x are equal")
        }
        
        let coef1 = numerator / denominator
        let const = meanY - coef1 * meanX
        
        return (const, coef1)
    }
    
    /// Mathod created by IP-Economist
    public func method_ipEconomist() throws -> Double {
        guard let cost_ = self.cost else {
            throw IPError.NoData("cost is absent")
        }
        if let added = self.addedCoefficient {
            return Double(cost_) + Double(added)
        }
        else {
            do {
                let (const, coef1) = try self.calculateRegressionCoef()
                print("REGRESSION:\nY(X) = \(const) + \(coef1)*X")
                return Double(cost_) + (coef1 * Double(cost_) + const )

            } catch (let error){
                throw error
            }
        }
    }
    
    // TODO: - Basic method of ip object evaluation with analogues
    public func method_Basic(){
        
    }
}

/// Calculate roylties
public struct IPBones_Royalties {
    
    var objectValue: Int
    
    public init(
        objectValue: Int
    ) {
        self.objectValue = objectValue
    }
    
    /// Basic rule — 25%
    public func method_Basic() -> Int {
        return Int(Double(self.objectValue) * 0.25)
    }
    
    /// Method which was created by Andrey Kostin (LABRATE ROYALTY PRO)
    public func method_AndreyKostin(){
        // TODO:
    }
}


