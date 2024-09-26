//
//  OnboardingViewModel.swift
//  Fitly
//
//  Created by İrem Sever on 26.09.2024.
//

import Foundation
import SwiftUI
import Combine
import Foundation
import SwiftUI
import Combine

class OnboardingViewModel: ObservableObject {

    @Published var userData = UserData()

    @Published var isLoading = false
    @Published var errorMessage: String?

    // JSON dosyasının kaydedileceği dizin
    private var fileURL: URL? {
        do {
            let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            return documentsDirectory.appendingPathComponent("userData.json")
        } catch {
            print("JSON couldn't be found: \(error.localizedDescription)")
            return nil
        }
    }

    // Kullanıcı verilerini JSON dosyasına kaydet
    func saveUserDataToFile() {
        isLoading = true
        errorMessage = nil

        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            let jsonData = try encoder.encode(userData)
            if let fileURL = fileURL {
                try jsonData.write(to: fileURL)
                print("Veri başarıyla kaydedildi: \(fileURL)")
                errorMessage = "Veri başarıyla kaydedildi!"
            }
        } catch {
            errorMessage = "Veri kaydedilemedi: \(error.localizedDescription)"
        }

        isLoading = false
    }
    
    // JSON dosyasından veriyi oku
    func loadUserDataFromFile() {
        guard let fileURL = fileURL else { return }

        do {
            let jsonData = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            userData = try decoder.decode(UserData.self, from: jsonData)
            print("Data uploaded: \(userData)")
        } catch {
            errorMessage = "Data didn't upload: \(error.localizedDescription)"
        }
    }
}
