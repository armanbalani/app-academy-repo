# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "aruman")
User.create(username: "Bobby Ross")
User.create(username: "Da Vinci")

Artwork.create(title: "apollo", image_url: "apollo.com", artist_id: 1)
Artwork.create(title: "buddyup", image_url: "buddyup.com", artist_id: 1)

Artwork.create(title: "beauty", image_url: "beauty.com", artist_id: 2)
Artwork.create(title: "love", image_url: "love.com", artist_id: 2)

Artwork.create(title: "monalisa", image_url: "monalisa.com", artist_id: 3)
Artwork.create(title: "code", image_url: "code.com", artist_id: 3)

ArtworkShare.create(viewer_id: 1, artwork_id: 3)
ArtworkShare.create(viewer_id: 1, artwork_id: 5)
ArtworkShare.create(viewer_id: 2, artwork_id: 1)
ArtworkShare.create(viewer_id: 2, artwork_id: 2)
ArtworkShare.create(viewer_id: 3, artwork_id: 4)
ArtworkShare.create(viewer_id: 3, artwork_id: 2)
