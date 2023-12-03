// Copyright © 2023 AlgoExpert LLC. All rights reserved.

struct Region {
  let capital: String
  let name: String
  let latitude: Double
  let longitude: Double

  static let regions = [
    Region(capital: "Ajaccio", name: "Corse", latitude: 41.9267, longitude: 8.7369),
    Region(capital: "Basse-Terre", name: "Guadeloupe", latitude: 15.9958, longitude: -61.7292),
    Region(capital: "Besançon", name: "Bourgogne-Franche-Comté", latitude: 47.24, longitude: 6.02),
    Region(capital: "Bordeaux", name: "Nouvelle-Aquitaine", latitude: 44.84, longitude: -0.58),
    Region(capital: "Cayenne", name: "Guyane", latitude: 4.9372, longitude: -52.326),
    Region(capital: "Fort-de-France", name: "Martinique", latitude: 14.6, longitude: -61.066667),
    Region(capital: "Lille", name: "Hauts-de-France", latitude: 50.6278, longitude: 3.0583),
    Region(capital: "Lyon", name: "Auvergne-Rhône-Alpes", latitude: 45.76, longitude: 4.84),
    Region(capital: "Mamoudzou", name: "Mayotte", latitude: -12.7806, longitude: 45.2278),
    Region(capital: "Marseille", name: "Provence-Alpes-Côte d'Azur", latitude: 43.2964, longitude: 5.37),
    Region(capital: "Nantes", name: "Pays de la Loire", latitude: 47.2181, longitude: -1.5528),
    Region(capital: "Orléans", name: "Centre-Val de Loire", latitude: 47.9025, longitude: 1.909),
    Region(capital: "Paris", name: "Île-de-France", latitude: 48.856667, longitude: 2.352222),
    Region(capital: "Rennes", name: "Bretagne", latitude: 48.1147, longitude: -1.6794),
    Region(capital: "Rouen", name: "Normandie", latitude: 49.442778, longitude: 1.088611),
    Region(capital: "Saint-Denis", name: "Réunion", latitude: -20.8789, longitude: 55.4481),
    Region(capital: "Strasbourg", name: "Grand Est", latitude: 48.583333, longitude: 7.745833),
    Region(capital: "Toulouse", name: "Occitanie", latitude: 43.6045, longitude: 1.444),
  ]

  static var randomCity: String {
    let regions = Region.regions
    return regions[Int.random(in: 0 ..< regions.count)].capital
  }
}
