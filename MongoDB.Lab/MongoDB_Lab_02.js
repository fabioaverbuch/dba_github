use demolab

db.comedy.insert({name: 'Ted', year: 2012, tagline: 'Ted is coming',cast: ['Mark Walhlberg', 'Mila Kunis', 'Seth MacFarlane'],
    technical: {runningTime: 106, language: 'English', prizes: 13, nominations: 27},sequel: 'Ted 2',
    merits: {budget: 50, boxOffice: 535},comments:[{by:'Steve', text:'Loved the movie'}, {by:'Dave', text:'Really funny!'}]})

db.comedy.insert({name: 'Ted 2', year: 2015, tagline: 'Ted is coming again',cast: ['Mark Walhlberg', 'Amanda Seyfried', 'Morgan Freeman'],
    technical: {runningTime: 115, language: 'English'}, sequel: 'Ted 2',
    merits: {budget: 85},comments:[{by:'Anne', text:'Funny'}, {by:'Kate', text:'I still love Ted'}, {by:'Leo', text:'Nice movie'}]})

db.comedy.insert({name: 'We\'re the Millers', year: 2013, tagline: 'If anyone asks', cast: ['Jennifer Aniston', 'Ed Helms', 'Kathryn Hahn'],
    technical: {runningTime: 110, language: 'English'}, merits: {budget: 37, boxOffice: 270},
    comments:[{by:'Taylor', text:'First class movie!'}, {by:'Rob', text:'I like it'}]})
    
db.comedy.insert([{name: 'The Hangover', year: 2009, tagline: 'Las Vegas', cast: ['Bradley Cooper', 'Ed Helms', 'Zach Galifianakis'],
    technical: {runningTime: 100, language: 'English'}, sequel: 'The Hangover Part II',    
    merits: {budget: 35, boxOffice: 467.5}, comments:[{by:'Alex', text:'Dude, it rocked'}, {by:'Steve', text:'The best movie ever!'}]})
    
db.comedy.insert([{name: "The Hangover Part II", year: 2011, tagline:'Bangkok has them now', cast: ['Bradley Cooper', 'Ed Helms', 'Zach Galifianakis'],
    technical: {runningTime: 102, language: 'English'}, sequel: 'The Hangover Part III',    
    merits: {budget: 80, boxOffice: 581}, comments:[{by:'Anne', text:'Liked the first part better'}, {by:'Robin', text:'Over the top'}]})

/* Remove a field of collection */
db.products.updateMany({}, {$unset: {comments: ""}})

/* Conditional operators */
db.collectionName.find({ "field" : { $gt: value } } );   // greater than  : field > value
db.collectionName.find({ "field" : { $lt: value } } );   // less than  :  field < value
db.collectionName.find({ "field" : { $gte: value } } );  // greater than or equal to : field >= value 
db.collectionName.find({ "field" : { $lte: value } } );  // less than or equal to : field <= value

db.comedy.find({'merits.budget': {$gt: 50}})
db.comedy.find({"technical.runningTime":{$gt: 105}})
db.comedy.find({"technical.language": "English"})
db.comedy.find({year: {$gt: 2010, $lt: 2013}})
db.comedy.find({year: {$in: [2010,2011,2012]}});
db.comedy.find({"merits.budget": {$in: [50, 60, 70, 80]}})
db.comedy.find({"merits.budget": {$in: [50, 60, 70, 80]}},{ name: 1, year: 1, tagline: 1, merits: 1 })
db.comedy.find({year: {$nin: [2010,2011,2012]}});
db.comedy.find({$or: [{year: 2012}, {name: 'The Hangover'}]});
db.comedy.find({year: {$gt: 2005}, $or: [{name: 'Ted'}, {name: 'The Hangover'}]});
db.comedy.find({year: {$gt: 2005},$or: [{name: 'Ted'}, {name: 'The Hangover'}]},{ name: 1, year: 1, tagline: 1 });
db.comedy.find({cast:'Bradley Cooper'})
