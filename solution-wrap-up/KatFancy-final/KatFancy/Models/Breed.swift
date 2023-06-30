// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

import Foundation

struct Breed: Decodable, Identifiable, Hashable, Equatable {
  var id: String { name }
  let name: String
  let knownFor: String
  let popularity: Int
  let photoUrl: URL
  let infoUrl: URL
  let credit: String
  let license: License
  let description: String

  func hash(into hasher: inout Hasher) {
    hasher.combine(name)
  }

  static func == (lhs: Breed, rhs: Breed) -> Bool {
    lhs.name == rhs.name
  }

  static var mock: Breed {
    Breed(
      name: "Clouded Leopard",
      knownFor: "climbing ability",
      popularity: 17,
      photoUrl: URL(string: "https://assets.algoexpert.io/course-assets/iosexpert/CatImages/CloudedLeopard.jpg")!,
      infoUrl: URL(string: "https://en.wikipedia.org/wiki/Clouded_leopard")!,
      credit: "Trisha Shears",
      license: .cc3,
      description: "The clouded leopard (Neofelis nebulosa), also called the mainland clouded leopard, is a wild cat inhabiting dense forests from the foothills of the Himalayas through mainland Southeast Asia into South China. In the early 19th century, a clouded leopard was brought to London from China and described in 1821. It has large dusky-grey blotches and irregular spots and stripes reminiscent of clouds. Its head-and-body length ranges from 68.6 to 108 cm (27.0 to 42.5 in) with a 61 to 91 cm (24 to 36 in) long tail. It uses its tail for balancing when moving in trees and is able to climb down vertical tree trunks head first. It rests in trees during the day and hunts by night on the forest floor.\n\nThe clouded leopard is the first cat that genetically diverged 9.32 to 4.47 million years ago from the common ancestor of the pantherine cats. Today, the clouded leopard is locally extinct in Singapore, Taiwan, and possibly Hainan Island and Vietnam. Its total population is suspected to be fewer than 10,000 mature individuals, with a decreasing population trend, and no single population numbering more than 1,000 adults. It has therefore been listed as Vulnerable on the IUCN Red List since 2008. The population is threatened by large–scale deforestation and commercial poaching for the wildlife trade. Its body parts are offered for decoration and clothing, though it is legally protected in most range countries.\n\nThe clouded leopard has been kept in zoological gardens since the early 20th century. Captive breeding programs were initiated in the 1980s. In captivity, the clouded leopard has an average lifespan of 11 years.\n\nThe clouded leopard's fur is of a dark grey or ochreous ground-color, often largely obliterated by black and dark dusky-grey blotched pattern. There are black spots on the head, and the ears are black. Partly fused or broken-up stripes run from the corner of the eyes over the cheek, from the corner of the mouth to the neck, and along the nape to the shoulders. Elongated blotches continue down the spine and form a single median stripe on the loins. Two large blotches of dark dusky-grey hair on the side of the shoulders are each emphasized posteriorly by a dark stripe, which passes on to the foreleg and breaks up into irregular spots. The flanks are marked by dark dusky-grey irregular blotches bordered behind by long, oblique, irregularly curved or looped stripes. These blotches yielding the clouded pattern suggest the English name of the cat. The underparts and legs are spotted, and the tail is marked by large, irregular, paired spots. Its legs are short and stout, and paws broad. Females are slightly smaller than males."
    )
  }

  static var mocks: [Breed] {
    [
      Breed.mock,
      Breed(
        name: "European Wildcat",
        knownFor: "warm coat",
        popularity: 19,
        photoUrl: URL(string: "https://assets.algoexpert.io/course-assets/iosexpert/CatImages/EuropeanWildcat.jpg")!,
        infoUrl: URL(string: "https://en.wikipedia.org/wiki/European_wildcat")!,
        credit: "Tambako The Jaguar",
        license: .ccnd2,
        description: "The European wildcat (Felis silvestris) is a small wildcat species native to continental Europe, Scotland, Turkey and the Caucasus. It inhabits forests from the Iberian Peninsula, Italy, Central and Eastern Europe to the Caucasus. Its fur is brownish to grey with stripes on the forehead and on the sides and has a bushy tail with a black tip. It reaches a head-to-body length of up to 65 cm (26 in) with a 34.5 centimetres (13.6 in) long tail, and weighs up to 7.5 kg (17 lb).\n\nIn France and Italy, the European wildcat is predominantly nocturnal, but also active in the daytime when undisturbed by human activities. It preys foremost on small mammals such as lagomorphs and rodents, but also on ground-dwelling birds.\n\nThe European wildcat's fur varies in colour from brownish to grey with paler contour hairs. It has five stripes on the forehead, which are broken up into small spots. A dark stripe behind the shoulders expands into a spinal stripe running up to the base of the tail. On the sides, it has irregular dark stripes, which break up on the hind legs, thus forming a blotched pattern. Its tail is bushy with two to three black, transverse rings and rounded at the black tip.\n\nThe top of the head and the forehead bear four well-developed dark bands that split into small spots. Two short and narrow stripes are usually present in the shoulder region, in front of the dorsal band. Some individuals have a few light spots on the throat, between the forelegs, or in the inguinal region. The dorsal surface of the neck and head are the same colour as that of the trunk, but is lighter grey around the eyes, lips, cheeks, and chin. A slight ochreous shade is visible on the undersides of the flanks."
      ),
      Breed(
        name: "Sand Cat",
        knownFor: "sad face",
        popularity: 21,
        photoUrl: URL(string: "https://assets.algoexpert.io/course-assets/iosexpert/CatImages/Sand.jpg")!,
        infoUrl: URL(string: "https://en.wikipedia.org/wiki/Sand_cat")!,
        credit: "Clément Bardot",
        license: .cc4,
        description: "The sand cat (Felis margarita) is a small wild cat that inhabits sandy and stony deserts far from water sources. With its sandy to light grey fur, it is well camouflaged in a desert environment. Its head-and-body length ranges from 39–52 cm (15–20 in) with a 23–31 cm (9.1–12.2 in) long tail. Its 5–7 cm (2.0–2.8 in) short ears are set low on the sides of the head, aiding detection of prey moving underground. The long hair covering the soles of its paws insulates its pads against the extremely hot and cold temperatures in deserts.\n\nThe first sand cat known to science was discovered in the Algerian Sahara and described in 1858. To date, it has been recorded in several disjunct locations in Morocco, Algeria, Niger, Chad, Egypt, the Arabian Peninsula and the Middle East. In Central Asia, it was first recorded in the Karakum Desert in 1925. The large gap between these two regions of its global range was partially closed in 1948, when a sand cat skin was found in an oasis of the Rub' al Khali in Oman. It is discontinuously distributed in the deserts of the Arabian Peninsula and the Middle East. In the early 1970s, sand cats were caught in southwestern Pakistan and exported to zoos worldwide. Due to its wide distribution and large population, it is listed as Least Concern on the IUCN Red List.\n\nThe sand cat usually rests in underground dens during the day and hunts at night. It moves 5.4 km (3.4 mi) on average at night in search of small rodents and birds. Among the Tuareg people of the Ténéré desert, it has a reputation of efficiently killing venomous snakes. In spring, the female gives birth to two to three kittens, which become sexually mature around the age of one year. The sand cat's ecological requirements are still poorly understood, as only a few in-depth studies targeting wild sand cat populations have been conducted."
      ),
      Breed(
        name: "Serval",
        knownFor: "jumping ability",
        popularity: 39,
        photoUrl: URL(string: "https://assets.algoexpert.io/course-assets/iosexpert/CatImages/Serval.jpg")!,
        infoUrl: URL(string: "https://en.wikipedia.org/wiki/Serval")!,
        credit: "Lilla Frerich",
        license: .publicDomain,
        description: "The serval is a wild cat native to Africa. It is rare in North Africa and the Sahel, but widespread in sub-Saharan countries, except rainforest regions. Across its range, it occurs in protected areas, and hunting it is either prohibited or regulated in range countries.\n\nIt is the sole member of the genus Leptailurus. Three subspecies are recognised. The serval is a slender, medium-sized cat that stands 54–62 cm (21–24 in) at the shoulder and weighs 9–18 kg (20–40 lb). It is characterised by a small head, large ears, a golden-yellow to buff coat spotted and striped with black, and a short, black-tipped tail. The serval has the longest legs of any cat relative to its body size.\n\nThe serval is a solitary carnivore and active both by day and at night. It preys on rodents, particularly vlei rats, small birds, frogs, insects, and reptiles, using its sense of hearing to locate prey. It leaps over 2 m (6 ft 7 in) above the ground to land on the prey on its forefeet, and finally kills it with a bite on the neck or the head. Both sexes establish highly overlapping home ranges of 10 to 32 km2 (4 to 12 sq mi), and mark them with feces and saliva. Mating takes place at different times of the year in different parts of their range, but typically once or twice a year in an area. After a gestational period of two to three months, a litter of one to four is born. The kittens are weaned at the age of one month and begin hunting on their own at six months of age. They leave their mother at the age of around 12 months."
      ),
      Breed(
        name: "Smilodon",
        knownFor: "resistance to house training",
        popularity: 22,
        photoUrl: URL(string: "https://assets.algoexpert.io/course-assets/iosexpert/CatImages/Smilodon.jpg")!,
        infoUrl: URL(string: "https://en.wikipedia.org/wiki/Smilodon")!,
        credit: "Vitor vacs",
        license: .pinterest,
        description: "Smilodon is a genus of the extinct machairodont subfamily of the felids. It is one of the most famous prehistoric mammals and the best known saber-toothed cat. Although commonly known as the saber-toothed tiger, it was not closely related to the tiger or other modern cats. Smilodon lived in the Americas during the Pleistocene epoch (2.5 mya – 10,000 years ago). The genus was named in 1842 based on fossils from Brazil; the generic name means \"scalpel\" or \"two-edged knife\" combined with \"tooth\". Three species are recognized today: S. gracilis, S. fatalis, and S. populator. The two latter species were probably descended from S. gracilis, which itself probably evolved from Megantereon. The hundreds of individuals obtained from the La Brea Tar Pits in Los Angeles constitute the largest collection of Smilodon fossils.\n\nOverall, Smilodon was more robustly built than any extant cat, with particularly well-developed forelimbs and exceptionally long upper canine teeth. Its jaw had a bigger gape than that of modern cats, and its upper canines were slender and fragile, being adapted for precision killing. S. gracilis was the smallest species at 55 to 100 kg (120 to 220 lb) in weight. S. fatalis had a weight of 160 to 280 kg (350 to 620 lb) and height of 100 cm (39 in). Both of these species are mainly known from North America, but remains from South America have also been attributed to them. S. populator from South America was the largest species, at 220 to 436 kg (485 to 961 lb) in weight and 120 cm (47 in) in height, and was among the largest known felids. The coat pattern of Smilodon is unknown, but it has been artistically restored with plain or spotted patterns.\n\nIn North America, Smilodon hunted large herbivores such as bison and camels, and it remained successful even when encountering new prey species in South America. Smilodon is thought to have killed its prey by holding it still with its forelimbs and biting it, but it is unclear in what manner the bite itself was delivered. Scientists debate whether Smilodon had a social or a solitary lifestyle; analysis of modern predator behavior as well as of Smilodon's fossil remains could be construed to lend support to either view. Smilodon probably lived in closed habitats such as forests and bush, which would have provided cover for ambushing prey. Smilodon died out at the same time that most North and South American megafauna disappeared, about 10,000 years ago. Its reliance on large animals has been proposed as the cause of its extinction, along with climate change and competition with other species, but the exact cause is unknown."
      )
    ]
  }
}
