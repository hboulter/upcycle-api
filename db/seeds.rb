# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Post.destroy_all

post1 = Post.create(
    user_id: 1,
    lat: 33.5979,
    lng: -117.8730,
    status: true,
    title: "Furniture",
    condition: "Fair",
    description: "Corner of Lane & High"
);

post1.image.attach(
    io: File.open("./public/images/couch.jpg"),
    filename: "couch.jpg",
    content_type: "application/jpg"
)
