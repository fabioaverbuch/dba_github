use demolab

db.irons.insert({ model: 'GC4516/20', price: 49, brand: 'Philips', type: 'Steam iron', description: { color: 'blue/white', waterreservoir: 0.300 }, extras: ['anti-calc system', 'cord storage space', 'drop stop', 'spray function'], technically: { power: 2400, weight: 1.7, steampressure: 45 }, measures: { width: 16, height: 30, depth: 36, cordlength: 200 }, reviews: { plus: ['good quality', 'longevous'], minus: ['cord does not roll up properly', 'cord too short'] } })

db.irons.insert({ model: 'FV3930', price: 35, brand: 'Tefal', type: 'Steam iron', description: { color: 'purple/white', waterreservoir: 0.300 }, extras: ['anti-calc system', 'drop stop', 'spray function'], technically: { power: 2300, weight: 1.6, steampressure: 40 }, measures: { width: 34, height: 18, depth: 15, cordlength: 200 }, reviews: { plus: ['good quality', 'advantageous purchase', 'is very easy to iron'], minus: ['water tank quickly empty', 'cord too short'] } })

db.irons.insert({ model: 'FV3730', price: 30, brand: 'Tefal', type: 'Steam iron', description: { color: 'darkblue/white', waterreservoir: 0.300 }, extras: ['anti-calc system', 'cord storage space', 'drop stop', 'spray function'], technically: { power: 2000, weight: 1.7, steampressure: 30 }, measures: { width: 17, height: 15, depth: 32, cordlength: 250 }, reviews: { plus: ['good quality', 'advantageous purchase', 'fits perfectly'], minus: ['expensive', 'heavy'] } })

db.irons.insert({ model: 'GC1433/40', price: 23, brand: 'Philips', type: 'Steam iron', description: { color: 'red/white', waterreservoir: 0.220 }, extras: ['anti-calc system', 'cord storage space', 'drop stop', 'spray function'], technically: { power: 2000, weight: 1.1, steampressure: 25 }, measures: { width: 29, height: 15, depth: 13, cordlength: 195 }, reviews: { plus: ['good quality'], minus: ['fragile', 'average quality', 'not easy to use'] } })

db.peaks.insertMany([
{"name": "Everest","height": 8848,"location": ["Nepal", "China"],"ascents": {"first": {"year": 1953},"first_winter": {"year": 1980},"total": 5656}},
{"name": "K2","height": 8611,"location": ["Pakistan", "China"],"ascents": {"first": {"year": 1954},"first_winter": {"year": 1921},"total": 306}},
{"name": "Kangchenjunga","height": 8586,"location": ["Nepal", "India"],"ascents": {"first": {"year": 1955},"first_winter": {"year": 1986},"total": 283}},
{"name": "Lhotse","height": 8516,"location": ["Nepal", "China"],"ascents": {"first": {"year": 1956},"first_winter": {"year": 1988},"total": 461}},
{"name": "Makalu","height": 8485,"location": ["China", "Nepal"],"ascents": {"first": {"year": 1955},"first_winter": {"year": 2009},"total": 361}}
])

db.irons.find()

db.irons.find({},{ model: 1, price: 1, brand: 1 }).sort({ price: -1 })

db.irons.find({},{ model: 1, price: 1, brand: 1 }).sort({ price: -1 }).limit(1)

db.irons.find({$and: [{ brand: { $in: ["Philips", "Tefal"] } },{ price: { $lte: 30 } }]})

db.irons.find({$and: [{ "description.color": { $not: /.*red.*/i } }]},{ model: true, price: true, brand: true }).sort({ price: -1 }).limit(1)


db.laptops.insert({ name: 'Acer Aspire F5-573G-57GD', price: 749, properties: { processor: 'Intel Core i5', RAM: '8GB', HD: '650GB', OS: 'Windows 10', USB: { USB2_0: 0, USB3_0: 2, USB3_1: 1 } }, LanguageOS: ['Dutch', 'French', 'English'], reviews: [{ by: 'Aline', score: 4, text: 'Very well' }, { by: 'Me', score: 3.5, text: 'Compact' }] })

db.laptops.insert({ name: 'HP Pavilion 17-g101nd', price: 534, properties: { processor: 'Intel Pentium N3700', RAM: '4GB', HD: '1000GB', HDSpeed: 5400, OS: 'Windows 10', displayType: 'Shiny', USB: { USB2_0: 0, USB3_0: 3 } }, LanguageOS: ['Dutch', 'French', 'English', 'German'], networkConnections: ['bluetooth', 'wi-fi', 'ethernet'], reviews: [{ by: 'Melanie', score: 4.3, text: 'Very good' }, { by: 'Eric', score: 4.5, text: 'Nice' }] })

db.laptops.insert({ name: 'Apple MacBook Pro Retina', price: 1359, properties: { processor: 'Intel Core i5', RAM: '8GB', clockSpeed: '2.3 GHz', HD: '850GB', OS: 'Mac OS X 10.11', USB: { USB2_0: 0, USB3_0: 2, USB3_0: 0 } }, LanguageOS: ['Dutch', 'French'], software: ['iMovie', 'GarageBand', 'iBooks', 'Safari', 'FaceTime'], reviews: [{ by: 'Tom', score: 4.4, text: 'Superb' }] })

db.laptops.find({$or: [{ price: { $gte: 500, $lte: 1000 } },{ "properties.HD": "750GB" }]})

db.laptops.updateMany({"properties.OS": "Windows 10"}, {$set: {"properties.OS": "Windows 8"}})

db.laptops.find({},{name:true, price: true, "properties.OS": true}).sort({price: 1}).limit(2)

db.laptops.find({"reviews.score": {$gte: 4, $lte: 4.2}})


