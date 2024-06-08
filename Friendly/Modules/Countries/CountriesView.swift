//
//  Countries.swift
//  Friendly
//
//  Created by Lior Shor on 16/12/2023.
//

import SwiftUI

struct CountriesView: View {
    
    @ObservedObject var viewModel: CountriesViewModel
    @State private var selectedCountry: CountryExtension?
    @Binding  var didTapExtensionsButton: Bool
    var onCountrySelected: ((CountryExtension?) -> Void)?
    
    var body: some View {
        VStack {
            if viewModel.countries.items.isEmpty == true {
                Text("Loading countries...")
            }
            Text(Translations.SELECT_COUNTRY_CODE.localized)
                .font(.title3)
                .bold()
                .padding()
            List(viewModel.countries.items, id: \.code, selection: $selectedCountry) { country in
                HStack {
                    Text(country.name ?? .empty)
                        .foregroundStyle(selectedCountry == country ? .blue : .black)
                    Spacer()
                    Text(country.countryExtension ?? .empty)
                        .foregroundStyle(selectedCountry == country ? .blue : .black)
                }
                .contentShape(Rectangle()) // Set the tappable area
                .onTapGesture {
                    withAnimation {
                        selectedCountry = country
                        viewModel.selectedCountry = selectedCountry
                        didTapExtensionsButton.toggle()
                        onCountrySelected?(selectedCountry)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }.onAppear {
            viewModel.fetchCountries()
        }
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView(viewModel: CountriesViewModel(coordinator: nil), didTapExtensionsButton: .constant(true))
    }
}
