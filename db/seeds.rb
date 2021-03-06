# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(email: "user@user.com", password: "123456")

x1 = Category.create(name: "Cafe")
x2 = Category.create(name: "Restaurant")
x3 = Category.create(name: "Pastane")
x4 = Category.create(name: "Balıkçı")
x5 = Category.create(name: "Bar")

%w{software internet desktop hardware iot healt}.each { |tag| Tag.create name: tag }

p1 = Place.create(category: x1, name: "Denizaltı Cafe", address: "İzmir/Urla", phone_number: "02327522492", contact_mail: "denizalti@gmail.com", established_at: "2013", description: "Sıcacık, tatlı ve deniz kenarında huzur dolu bi mekan", user: u1, tag_ids: (1..6).to_a.sample(rand(1..6)) )
p2 = Place.create(category: x2, name: "Keyif Restaurant", address: "Muğla", phone_number: "02327520818", contact_mail: "keyif@gmail.com", established_at: "2014", description: "Katmer çok lezzetli, kıymalı da çökelekli de.", user: u1, tag_ids: (1..6).to_a.sample(rand(1..6)) )
p3 = Place.create(category: x3, name: "İrmik Hanım Pastanesi", address: "Aydın", phone_number: "02386845548", contact_mail: "irmikhanim@gmail.com", established_at: "2012", description: "Zencefil limon dondurması ve irmik hanım bir efsane", user: u1, tag_ids: (1..6).to_a.sample(rand(1..6)) )
p4 = Place.create(category: x4, name: "Buse Balık", address: "Muğla", phone_number: "02522142148", contact_mail: "busebalik@gmail.com", established_at: "2015", description: "Kalamar,mezeler ve tabii manzara MUHTEŞEM", user: u1, tag_ids: (1..6).to_a.sample(rand(1..6)) )
p5 = Place.create(category: x5, name: "Berlin's", address: "Denizli", phone_number: "05327321278", contact_mail: "berlins@gmail.com", established_at: "2011", description: "Sıcak ve samimi ortam ve kokteyller", user: u1, tag_ids: (1..6).to_a.sample(rand(1..6)) )

Comment.create(body: "Deniz ürünleri üst seviye, her şey çok tazeve hijyenik", place_id: p1.id, user: u1)
Comment.create(body: "Şömine başında sıcak çıkolata yudumlamak bir harika.", place_id: p1.id, user: u1)
Comment.create(body: "Izgara tavuk çok başarılı",  place_id: p2.id, user: u1)
Comment.create(body: "Herşey çok iyi fakat kurabiyeleri kesinlikle deneyin...", place_id: p3.id, user: u1)
Comment.create(body: "Burada bu manzara ile tüm deniz ürünleri yenebilir", place_id: p4.id, user: u1)
Comment.create(body: "Salsa Geceleri muhteşem.", place_id: p5.id, user: u1)
