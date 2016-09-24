# OM
# DBC, Week 5, Challenge 5.4

# Make an example complex nested data structure:

body = {

circulatory:{
  heart:[1,2,3,4],
  veins:[
    "large",
    "small"
  ],
  arteries:[
    "large","small"
  ],

},

nervous:{
  brain:["inner","outer"]

},

skeletal:{
  cranium:1,
  vertebrae:[[1,2,3,4,5,6,7],[1,2,3,4,5,6,7,8,9,10,11,12],[1,2,3,4,5]], # number of cervical vertebrae (7), spinal vertebae (12), lumbar vertebrae (5)
  femur:2,
  tibia:2,
  fibia:2,
  patella:2

},

digestive:[
    "stomach",
    "small intestine",
    "large intestine"
    ]

}

# Finding some answers using the above data structure

p [

body[:circulatory][:heart], # finding what's listed in heart
body[:circulatory][:heart][3], # finding the first of the four heart chambers
body[:skeletal], # finding what bones are listed
body[:skeletal][:fibia], # finding number of fibias in body
body[:circulatory][:veins][1],
body[:digestive][1], # finding small vein
body[:skeletal][2], # finding if you can do via index instead of hash -- > Nope
body[:skeletal][:vertebrae][2][2]

] # finding the third lumbar vertebra, thereby finding an array within an array within a hash within a hash!
