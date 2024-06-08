////
////  UIButton+Extension.swift
////  Friendly
////
////  Created by Lior Shor on 25/05/2023.
////
//
//import UIKit
////import SDWebImage
//
//extension UIButton {
//    // MARK:- Localization
//
//    @IBInspectable var localizedText: String? {
//        get { return titleLabel?.localizedText }
//        set {
//            titleLabel?.localizedText = newValue?.localized
//            setTitle(newValue?.localized, for: .normal)
//        }
//    }
//
//    func loadImage(
//        from url: String,
//        for state: UIControl.State = .normal,
//        placeholderImage: UIImage? = nil,
//        completion: SuccessCompletion? = nil
//    ) {
//
//        sd_setImage(with: URL(string: url), for: state, placeholderImage: placeholderImage) { (_, error, _, _) in
//            completion?(error == nil)
//        }
//    }
//
//    func cancelLoading() {
//        sd_cancelCurrentImageLoad()
//    }
//}
