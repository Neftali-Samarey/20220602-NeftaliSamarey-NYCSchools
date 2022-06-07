//
//  ModalPresentationController.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/7/22.
//

import UIKit

class ModalPresentationController: UIPresentationController {

    private let blurEffectView: UIVisualEffectView?

    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        let blurEffect = UIBlurEffect(style: .dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)

        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissController))

        guard let blurEffectView = blurEffectView else {
            return
        }

        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.isUserInteractionEnabled = true
        blurEffectView.addGestureRecognizer(tapGestureRecognizer)
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        guard let container = self.containerView else {
            return CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: CGSize(width: 0.0, height: 0.0))
        }

        return CGRect(origin: CGPoint(x: 0, y: container.frame.height * 0.2),
               size: CGSize(width: container.frame.width, height: container.frame.height))
    }

    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()

        guard let blurEffectView = blurEffectView else {
            return
        }

        blurEffectView.alpha = 0
        self.containerView?.addSubview(blurEffectView)

        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (_) in
            blurEffectView.alpha = 0.6
        }, completion: { (_) in })
    }

    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()

        guard let blurEffectView = blurEffectView else {
            return
        }

        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (_) in
            blurEffectView.alpha = 0
        }, completion: { (_) in
            blurEffectView.removeFromSuperview()
        })
    }

    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()

        guard let presentedView = presentedView else {
            return
        }

        presentedView.roundCorners([.topLeft, .topRight], radius: 25)
    }

    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()

        guard let blurEffectView = blurEffectView, let presentedView = presentedView else {
            return
        }

        presentedView.frame = frameOfPresentedViewInContainerView
        blurEffectView.frame = containerView!.bounds
    }

    @objc
    private func dismissController() {
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
}
