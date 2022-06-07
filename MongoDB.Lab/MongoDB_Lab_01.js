use exercises

db.irons.drop()

db.irons.insert({ model: 'GC4516/20', price: 49, brand: 'Philips', type: 'Steam iron', description: { color: 'blue/white', waterreservoir: 0.300 }, extras: ['anti-calc system', 'cord storage space', 'drop stop', 'spray function'], technically: { power: 2400, weight: 1.7, steampressure: 45 }, measures: { width: 16, height: 30, depth: 36, cordlength: 200 }, reviews: { plus: ['good quality', 'longevous'], minus: ['cord does not roll up properly', 'cord too short'] } })

db.irons.insert({ model: 'FV3930', price: 35, brand: 'Tefal', type: 'Steam iron', description: { color: 'purple/white', waterreservoir: 0.300 }, extras: ['anti-calc system', 'drop stop', 'spray function'], technically: { power: 2300, weight: 1.6, steampressure: 40 }, measures: { width: 34, height: 18, depth: 15, cordlength: 200 }, reviews: { plus: ['good quality', 'advantageous purchase', 'is very easy to iron'], minus: ['water tank quickly empty', 'cord too short'] } })

db.irons.insert({ model: 'FV3730', price: 30, brand: 'Tefal', type: 'Steam iron', description: { color: 'darkblue/white', waterreservoir: 0.300 }, extras: ['anti-calc system', 'cord storage space', 'drop stop', 'spray function'], technically: { power: 2000, weight: 1.7, steampressure: 30 }, measures: { width: 17, height: 15, depth: 32, cordlength: 250 }, reviews: { plus: ['good quality', 'advantageous purchase', 'fits perfectly'], minus: ['expensive', 'heavy'] } })

db.irons.insert({ model: 'GC1433/40', price: 23, brand: 'Philips', type: 'Steam iron', description: { color: 'red/white', waterreservoir: 0.220 }, extras: ['anti-calc system', 'cord storage space', 'drop stop', 'spray function'], technically: { power: 2000, weight: 1.1, steampressure: 25 }, measures: { width: 29, height: 15, depth: 13, cordlength: 195 }, reviews: { plus: ['good quality'], minus: ['fragile', 'average quality', 'not easy to use'] } })

db.irons.find()

db.irons.find({},{ model: 1, price: 1, brand: 1 }).sort({ price: -1 })

db.irons.find({},{ model: 1, price: 1, brand: 1 }).sort({ price: -1 }).limit(1)


// 1 Give all irons of the brand Philips or Tefal that cost 30 euros or less, that are red, have a power of 2000 or
// more and have a cord storage space and spray function.
db.irons.find({
    $and: [
        { brand: { $in: ["Philips", "Tefal"] } },
        { price: { $lte: 30 } },
        { "description.color": /.*red.*/i },
        { "technically.power": { $gte: 2000 } },
        { extras: { $in: ["cord storage space", "spray function"] } }
    ]
})

// 2 Give the model, price and brand of the most expensive iron that is not red, weighing less than 2 kilos, that
// has at least 2 plus points, a maximum height of 20 centimeters and that does not have cord storage space as
// extra
db.irons.find(
    {
        $and: [
            { "description.color": { $not: /.*red.*/i } },
            { "technically.weight": { $lt: 2 } },
            { $where: "this.reviews.plus.length>2" },
            { "measures.height": { $lte: 20 } },
            { extras: { $ne: "chord storage space" } }
        ]
    },
    { model: true, price: true, brand: true }
).sort({ price: -1 }).limit(1)


// 3 Loop through the irons. Increase the price of all irons with 10%.
var irons = db.irons.find()
irons.forEach(iron => {
    var newPrice = iron.price * 1.1;
    db.irons.updateOne({ _id: iron._id }, { $set: { price: newPrice } })
})

// 4 During the sales, each brand gives a specific discount.
// The discounts are given as an object literal
// var discounts = {'Calor': 1, 'Tefal': 5, 'Philips': 3}
// Update all the prices of the irons.
// Note: to traverse the object literal of discounts, you can use the following code
// `for (var key in discounts) { … }`

var discounts = { 'Calor': 1, 'Tefal': 5, 'Philips': 3 }
for (var brandName in discounts) {
    var priceIncrease = discounts[brandName] * -1;
    db.irons.updateMany({ brand: brandName }, { $inc: { price: priceIncrease } })
} 

use exercises

db.laptops.insert({ name: 'Acer Aspire F5-573G-57GD', price: 749, properties: { processor: 'Intel Core i5', RAM: '8GB', HD: '650GB', OS: 'Windows 10', USB: { USB2_0: 0, USB3_0: 2, USB3_1: 1 } }, LanguageOS: ['Dutch', 'French', 'English'], reviews: [{ by: 'Aline', score: 4, text: 'Very well' }, { by: 'Me', score: 3.5, text: 'Compact' }] })

db.laptops.insert({ name: 'HP Pavilion 17-g101nd', price: 534, properties: { processor: 'Intel Pentium N3700', RAM: '4GB', HD: '1000GB', HDSpeed: 5400, OS: 'Windows 10', displayType: 'Shiny', USB: { USB2_0: 0, USB3_0: 3 } }, LanguageOS: ['Dutch', 'French', 'English', 'German'], networkConnections: ['bluetooth', 'wi-fi', 'ethernet'], reviews: [{ by: 'Melanie', score: 4.3, text: 'Very good' }, { by: 'Eric', score: 4.5, text: 'Nice' }] })

db.laptops.insert({ name: 'Apple MacBook Pro Retina', price: 1359, properties: { processor: 'Intel Core i5', RAM: '8GB', clockSpeed: '2.3 GHz', HD: '850GB', OS: 'Mac OS X 10.11', USB: { USB2_0: 0, USB3_0: 2, USB3_0: 0 } }, LanguageOS: ['Dutch', 'French'], software: ['iMovie', 'GarageBand', 'iBooks', 'Safari', 'FaceTime'], reviews: [{ by: 'Tom', score: 4.4, text: 'Superb' }] })

// 1 Give all laptops with a price between 500 and 1000 euro or with a hard disk of 750 GB
db.laptops.find({
    $or: [
        { price: { $gte: 500, $lte: 1000 } },
        { "properties.HD": "750GB" }
    ]
})

// 2 Change Windows 10 to Windows 8
db.laptops.updateMany({"properties.OS": "Windows 10"}, {$set: {"properties.OS": "Windows 8"}})

// 3 Give name, price and operating system of the 2 cheapest laptops
db.laptops.find({},{name:true, price: true, "properties.OS": true}).sort({price: 1}).limit(2)

// 4 Give all laptops with at least 1 review with a score between 4 and 4.2
db.laptops.find({"reviews.score": {$gte: 4, $lte: 4.2}})

// 5 Give all laptops with 2 USB 3_0 ports and that support at least 2 languages including Dutch 
db.laptops.find({
    $and: [
    {"properties.USB.USB3_0": 2},
    {$where: "this.LanguageOS.length >= 2"},
    {LanguageOS: "Dutch"}
    ]
})








 

 
