
import Foundation
import UIKit

// Specify that the SDK import should only be used when built with the REALDEVICE scheme
#if REALDEVICE
import Sybrin_iOS_Identity
import Sybrin_iOS_Biometrics
#endif

class SDKRunner {
    static let identityLicense = "1M5IOXMR8vBo28dCaTN24wL05Dygu0q6kcvAykU52vqO2+NTAvX6Ic+9Ut26fMaCGb1ueyAwKhTo357fI9YyPb1CGEcmI/qCv0PqrlpqWhBQh1V+I/6kOkJSS5MItdusaXomyzhfovmPF7O3iEjOsk3mLOQlk8hn6yB5oXLQc+jaQgoH1KCS7zIeEPOrzqXicodyvXzDukVpG1fF6CdNuDYoGURpXYxkVMZiKAn+eHv1ySCr6dEZ8zYwWR17sFg2OGZ8qDzzWG7VWEq05dlfgv4JjTwLbjpcCZlWFCAqtcCz06X8BnBrARfFnSCev8OtZucG+CVvhFAzQpTQO1R/5/pya0acy4OEQNFcyngg7Eqmqalsd4vQdo80Cc7EUZd/A+3/rEcSYNrwb9n0BjAl2oNWO5tSlNuxImR0RGCbOoI/pCcB48rv8CksbWzqPoQQ3Bfs4SPs5LPiYYM9aoppIJZZHlbi/TFZH3YyD/dwKsnG6ZbrhdCFVL1exkV+JaW8"
    
    static let biometricsLicense = "1M5IOXMR8vBo28dCaTN24wL05Dygu0q6kcvAykU52vqO2+NTAvX6Ic+9Ut26fMaCXt4aEzElGFMVo39K9nSU0wEoHujT8wqUJIpaFGnh+xY8qV4ceP047xRaYbYeeqBvvJ9IPp5nMNyfHTk49m0Wyl2cBtQlORNrS9WLbVS/9Oygh6yFKHC5VZ6v73R94fi7TiVX7E2/FArkDmxRRenSknzj0IIJhd4HiwYBxF5fHG2Gdwda1CTSxWhTq9tLCS2aHgXgbociffo23pD6nUP/00dOkER4xM+vGeAiOjeQ00IH9zqZV5vwirlvCCED8brYQC04SumAaqMQTZSYyjWWU/441A9oPAUCCAfql/bsxWS4BiVPKQTxa+A8368Q+92fN4/Qt4/FrJpGxd7BhEN24ZMC5sKSuLtmu3rUC4j4F+M8MtWodEoSV3M+LyHFA//GGM/WQZuTk1IIcdp99LnButrdSRQf+57I8JIynSFkABYse40hZc4C3S3sgUu1cel/"
    
    static func runIdentitySDK(_ viewController: UIViewController){
        
// Specify that the SDK code should only be called when built with the REALDEVICE scheme
#if REALDEVICE
        
        // Init SDK config
        let sybrinConfig = SybrinIdentityConfiguration(license: identityLicense)
        SybrinIdentity.shared.configuration = sybrinConfig
        
        // Call SDK functionality
        SybrinIdentity.shared.scanDocument(on: viewController, for: .SouthAfricaPassport)
        { (didLaunch, message) in
            
            if didLaunch {
                print("Launched successfully!")
            } else if let message = message {
                print("Failed to launch because \(message)")
            }
            
        } success: { (model) in
            
            if let model = model as? SouthAfricaPassportModel {
                print("Scan document success: \(model.identityNumber ?? "")")
            }
            
        } failure: { (message) in
            
            print("Scan document failed because \(message)")
            
        } cancel: {
            
            print("Scan document canceled")
            
        }
        
// Specifies the code that should be run when built with the SIMULATOR scheme
#elseif SIMULATOR
        
        print("Application built with simulator scheme. Identity SDK will not be run.")
        
#endif
    }
    
    static func runBiometricsSDK(_ viewController: UIViewController){
        
// Specify that the SDK code should only be called when built with the REALDEVICE scheme
#if REALDEVICE
        
        // Init SDK config
        let sybrinConfig = SybrinBiometricsConfiguration(license: biometricsLicense)
        SybrinBiometrics.shared.configuration = sybrinConfig
        
        // Call SDK functionality
        SybrinBiometrics.shared.openPassiveLivenessDetection(on: viewController)
        { (didLaunch, message) in
            
            if didLaunch {
                print("Launched successfully!")
            } else if let message = message {
                print("Failed to launch because \(message)")
            }
            
        } success: { (model) in
            
            print("Passive liveness detection finished. You are \(model.isAlive ? "\(model.livenessConfidence * 100)% alive" : "\((1 - model.livenessConfidence) * 100)% not alive")")
            
        } failure: { (message) in
            
            print("Passive liveness detection failed because \(message)")
            
        } cancel: {
            
            print("Passive liveness detection canceled")
            
        }
        
// Specifies the code that should be run when built with the SIMULATOR scheme
#elseif SIMULATOR
        
        print("Application built with simulator scheme. Biometrics SDK will not be run.")
        
#endif
    }
}
