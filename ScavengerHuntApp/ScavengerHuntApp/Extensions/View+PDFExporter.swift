//
//  View+PDFExporter.swift
//  ScavengerHuntApp
//
//  Created by Abdulmohammad BAIG on 2025-10-16.
//

import SwiftUI

@MainActor
extension View {
    func renderAsPDF(fileName: String, completion: @escaping (URL?) -> Void) {
        let renderer = ImageRenderer(content: self)

        let url = FileManager.default.temporaryDirectory.appendingPathComponent("\(fileName).pdf")

        renderer.render { size, context in
            var box = CGRect(origin: .zero, size: size)
            guard let consumer = CGDataConsumer(url: url as CFURL),
                  let pdfContext = CGContext(consumer: consumer, mediaBox: &box, nil) else {
                completion(nil)
                return
            }

            pdfContext.beginPDFPage(nil)
            context(pdfContext)
            pdfContext.endPDFPage()
            pdfContext.closePDF()

            completion(url)
        }
    }
}

