# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  name: "User",
  email: "tran.duc.quoc@framgia.com",
  password: "123456",
  password_confirmation: "123456"
)

Admin.create!(
  email: "forder.info@gmail.com",
  password: "123456",
  password_confirmation: "123456"

)

User.create!(
  name: "Faker1",
  email: "do.thi.diem.thao@framgia.com",
  password: "123456",
  password_confirmation: "123456"
)

User.create!(
  name: "Faker2",
  email: "nguyen.van.tran.anh@framgia.com",
  password: "123456",
  password_confirmation: "123456"
)

User.create!(
  name: "Faker3",
  email: "pham.van.chien@framgia.com",
  password: "123456",
  password_confirmation: "123456"
)


Shop.create!(
  name: "Cơm Tấm",
  description: "Cơm Tấm",
  status: 1,
  cover_image: "image",
  avatar: File.open(Rails.root + "public/images/quancomtam.jpg"),
  averate_rating: 5.0,
  owner_id: 1
)
#shop request

Shop.create!(
  name: "Sinh Tố",
  description: "Sinh Tố",
  status: 0,
  cover_image: "image",
  avatar: File.open(Rails.root + "public/images/quansinhto.jpg"),
  owner_id: 2
)

Shop.create!(
  name: "Chè Thái",
  description: "Chè Thái",
  status: 0,
  cover_image: "image",
  avatar: File.open(Rails.root + "public/images/quanchethai.jpg"),
  owner_id: 3
)



Shop.create!(
  name: "Dừa Bến Tre",
  description: "Dừa Bến Tre",
  status: 0,
  cover_image: "image",
  avatar: File.open(Rails.root + "public/images/quandua.jpg"),
  owner_id: 4
)

Shop.create!(
  name: "Mì Quảng",
  description: "Mì Quảng",
  status: 0,
  cover_image: "image",
  avatar: File.open(Rails.root + "public/images/quanmiquang.jpg"),
  owner_id: 4
)

Shop.create!(
  name: "Nếp Cẩm",
  description: "Nếp Cẩm",
  status: 0,
  cover_image: "image",
  avatar: File.open(Rails.root + "public/images/quansinhto.jpg"),
  owner_id: 1
)
#shop_manangers

ShopManager.create!(
  user_id: 2,
  shop_id: 1,
  role: 1,
)

ShopManager.create!(
  user_id: 3,
  shop_id: 3,
  role: 1,
)

ShopManager.create!(
  user_id: 4,
  shop_id: 4,
  role: 1,
)

Coupon.create!(
  name: "Sale 99%",
  description: "Lucky Day",
  coupon_type: 0,
  discount_type: 0,
  value: 99,
  code: "XCODE1",
  start_at: "2016-09-12 08:00:00",
  end_at: "2016-09-14 08:00:00",
  shop_id: 1,
  user_id: 1
)

Category.create!(
  name: "Cơm"
)

Category.create!(
  name: "Chè"
)

Category.create!(
  name: "Sinh Tố"
)

Category.create!(
  name: "Mì Quảng"
)

Category.create!(
  name: "Dừa"
)

Category.create!(
  name: "Nếp Cẩm"
)

Product.create!(
  category_id: 1,
  status: 0,
  shop_id: 1,
  user_id: 1,
  name: "Cơm Sườn",
  price: 22000,
  description: "Cơm Sườn",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/comsuon.jpg")
)

Product.create!(
  category_id: 1,
  status: 0,
  shop_id: 1,
  user_id: 1,
  name: "Cơm Xíu Mại",
  price: 22000,
  description: "Cơm Xíu Mại",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/comxiumai.jpg")
)

Product.create!(
  category_id: 1,
  status: 0,
  shop_id: 1,
  user_id: 1,
  name: "Cơm Gà Kho",
  price: 22000,
  description: "Cơm Gà Kho",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/comgakho.jpg")
)

Product.create!(
  category_id: 1,
  status: 0,
  shop_id: 1,
  user_id: 1,
  name: "Cơm Thịt Kho Trứng",
  price: 22000,
  description: "Cơm Thịt Kho Trứng",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/comthitkhotrung.jpg")
)

Product.create!(
  category_id: 1,
  status: 0,
  shop_id: 1,
  user_id: 1,
  name: "Cơm Thịt Kho Tôm",
  price: 22000,
  description: "Cơm Thịt Kho Tôm",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/comthitkhotom.jpg")
)

Product.create!(
  category_id: 1,
  status: 0,
  shop_id: 1,
  user_id: 1,
  name: "Cơm Cá Sốt Cà",
  price: 22000,
  description: "Cơm Cá Sốt Cà",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/comcasotca.jpg")
)

Product.create!(
  category_id: 1,
  status: 0,
  shop_id: 1,
  user_id: 1,
  name: "Cơm Sườn Non",
  price: 24000,
  description: "Cơm Sườn Non",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/comsuonnon.jpg")
)

Product.create!(
  category_id: 1,
  status: 0,
  shop_id: 1,
  user_id: 1,
  name: "Cơm Gà Đùi",
  price: 24000,
  description: "Cơm Gà Đùi",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/comgadui.jpg")
)

Product.create!(
  category_id: 1,
  status: 0,
  shop_id: 1,
  user_id: 1,
  name: "Cơm Đậu Nhồi Thịt",
  price: 20000,
  description: "Cơm Đậu Nhồi Thịt",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/comdaunhoithit.jpg")
)

Product.create!(
  category_id: 1,
  status: 0,
  shop_id: 1,
  user_id: 1,
  name: "Cơm Mực Nhồi Thịt",
  price: 24000,
  description: "Cơm Mực Nhồi Thịt",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/commucnhoithit.jpg")
)

Product.create!(
  category_id: 1,
  status: 0,
  shop_id: 1,
  user_id: 1,
  name: "Cơm Chim Cút Roty",
  price: 24000,
  description: "Cơm Chim Cút Roty",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/comchimcutroty.jpg")
)

Product.create!(
  category_id: 1,
  status: 0,
  shop_id: 1,
  user_id: 1,
  name: "Cơm Thịt Heo Chiên",
  price: 22000,
  description: "Cơm Thịt Heo Chiên",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/comthitheochien.jpg")
)

Product.create!(
  category_id: 1,
  status: 0,
  shop_id: 1,
  user_id: 1,
  name: "Canh Khổ Qua",
  price: 5000,
  description: "Canh Khổ Qua",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/canhkhoqua.jpg")
)

Product.create!(
  category_id: 2,
  status: 0,
  shop_id: 3,
  user_id: 3,
  name: "Chè Thái Có Sầu Riêng",
  price: 20000,
  description: "Chè Thái Có Sầu Riêng",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/chethaicosaurieng.jpg")
)

Product.create!(
  category_id: 2,
  status: 0,
  shop_id: 3,
  user_id: 3,
  name: "Chè Thái Không Sầu Riêng",
  price: 16000,
  description: "Chè Thái Không Sầu Riêng",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/chethaikhongsaurieng.jpg")
)

Product.create!(
  category_id: 2,
  status: 0,
  shop_id: 3,
  user_id: 3,
  name: "Đậu Hũ Sầu Riêng",
  price: 18000,
  description: "Đậu Hũ Sầu Riêng",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/dauhusaurieng.jpg")
)

Product.create!(
  category_id: 2,
  status: 0,
  shop_id: 3,
  user_id: 3,
  name: "Đậu Hũ Sữa Dừa",
  price: 14000,
  description: "Đậu Hũ Sữa Dừa",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/dauhusuadua.jpg")
)

Product.create!(
  category_id: 2,
  status: 0,
  shop_id: 3,
  user_id: 3,
  name: "Đậu Hũ Socola",
  price: 14000,
  description: "Đậu Hũ Socola",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/dauhusocola.jpg")
)

Product.create!(
  category_id: 2,
  status: 0,
  shop_id: 3,
  user_id: 3,
  name: "Đậu Hũ Dâu",
  price: 14000,
  description: "Đậu Hũ Dâu",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/dauhudau.jpg")
)

Product.create!(
  category_id: 2,
  status: 0,
  shop_id: 3,
  user_id: 3,
  name: "Đậu Hũ Đậu Nành",
  price: 14000,
  description: "Đậu Hũ Đậu Nành",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/dauhudaunanh.jpg")
)

Product.create!(
  category_id: 2,
  status: 0,
  shop_id: 3,
  user_id: 3,
  name: "Flan",
  price: 10000,
  description: "Flan",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/flan.jpg")
)

Product.create!(
  category_id: 2,
  status: 0,
  shop_id: 3,
  user_id: 3,
  name: "Flan Sầu Riêng",
  price: 14000,
  description: "Flan Sầu Riêng",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/flansaurieng.jpg")
)

Product.create!(
  category_id: 2,
  status: 0,
  shop_id: 3,
  user_id: 3,
  name: "Flan Kem Tươi",
  price: 12000,
  description: "Flan Kem Tươi",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/flankemtuoi.jpg")
)

Product.create!(
  category_id: 2,
  status: 0,
  shop_id: 3,
  user_id: 3,
  name: "Flan Dâu",
  price: 10000,
  description: "Flan Dâu",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/flandau.jpg")
)

Product.create!(
  category_id: 2,
  status: 0,
  shop_id: 3,
  user_id: 3,
  name: "Flan Dừa",
  price: 10000,
  description: "Flan Dừa",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/flandua.jpg")
)

Product.create!(
  category_id: 2,
  status: 0,
  shop_id: 3,
  user_id: 3,
  name: "Yaourt Nếp Cẩm",
  price: 18000,
  description: "Yaourt Nếp Cẩm",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/yaourtnepcam.jpg")
)

Product.create!(
  category_id: 2,
  status: 0,
  shop_id: 3,
  user_id: 3,
  name: "Chè Đậu Xanh Đánh",
  price: 16000,
  description: "Chè Đậu Xanh Đánh",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/chedauxanhdanh.jpg")
)

Product.create!(
  category_id: 2,
  status: 0,
  shop_id: 3,
  user_id: 3,
  name: "Chè Khúc Bạch",
  price: 16000,
  description: "Chè Khúc Bạch",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/chekhucbach.jpg")
)

Product.create!(
  category_id: 3,
  status: 0,
  shop_id: 2,
  user_id: 2,
  name: "Sinh Tố",
  price: 15000,
  description: "Sinh Tố",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/sinhto.jpg")
)

Product.create!(
  category_id: 3,
  status: 0,
  shop_id: 2,
  user_id: 2,
  name: "Chè Xoa Xoa",
  price: 12000,
  description: "Chè Xoa Xoa",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/chexoaxoa.jpg")
)

Product.create!(
  category_id: 3,
  status: 0,
  shop_id: 2,
  user_id: 2,
  name: "Chè Đậu Xanh",
  price: 10000,
  description: "Chè Đậu Xanh",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/chedauxanh.jpg")
)

Product.create!(
  category_id: 3,
  status: 0,
  shop_id: 2,
  user_id: 2,
  name: "Sâm Bổ Lượng",
  price: 15000,
  description: "Sâm Bổ Lượng",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/samboluong.jpg")
)

Product.create!(
  category_id: 3,
  status: 0,
  shop_id: 2,
  user_id: 2,
  name: "Chè Mít",
  price: 15000,
  description: "Chè Mít",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/chemit.jpg")
)

Product.create!(
  category_id: 3,
  status: 0,
  shop_id: 2,
  user_id: 2,
  name: "Dâu Xay Sữa Chua",
  price: 20000,
  description: "Dâu Xay Sữa Chua",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/dauxaysuachua.jpg")
)

Product.create!(
  category_id: 3,
  status: 0,
  shop_id: 2,
  user_id: 2,
  name: "Nước Chanh",
  price: 10000,
  description: "Nước Chanh",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/nuocchanh.jpg")
)

Product.create!(
  category_id: 3,
  status: 0,
  shop_id: 2,
  user_id: 2,
  name: "Cóc Ép",
  price: 12000,
  description: "Cóc Ép",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/cocep.jpg")
)

Product.create!(
  category_id: 3,
  status: 0,
  shop_id: 2,
  user_id: 2,
  name: "Cà Rốt Ép",
  price: 12000,
  description: "Cà Rốt Ép",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/carotep.jpg")
)

Product.create!(
  category_id: 3,
  status: 0,
  shop_id: 2,
  user_id: 2,
  name: "Thơm Ép",
  price: 12000,
  description: "Thơm Ép",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/thomep.jpg")
)

Product.create!(
  category_id: 3,
  status: 0,
  shop_id: 2,
  user_id: 2,
  name: "Chè Đậu Thập Cẩm",
  price: 12000,
  description: "Chè Đậu Thập Cẩm",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/chedauthapcam.jpg")
)

Product.create!(
  category_id: 3,
  status: 0,
  shop_id: 2,
  user_id: 2,
  name: "Chè Đậu Đỏ",
  price: 12000,
  description: "Chè Đậu Đỏ",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/chedaudo.jpg")
)

Product.create!(
  category_id: 3,
  status: 0,
  shop_id: 2,
  user_id: 2,
  name: "Chanh Dây",
  price: 10000,
  description: "Chanh Dây",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/chanhday.jpg")
)

Product.create!(
  category_id: 3,
  status: 0,
  shop_id: 2,
  user_id: 2,
  name: "Sinh Tố Bơ",
  price: 30000,
  description: "Sinh Tố Bơ",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/sinhtobo.jpg")
)

Product.create!(
  category_id: 3,
  status: 0,
  shop_id: 2,
  user_id: 2,
  name: "Nước Cam",
  price: 20000,
  description: "Nước Cam",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/nuoccam.jpg")
)

Product.create!(
  category_id: 3,
  status: 0,
  shop_id: 2,
  user_id: 2,
  name: "Sinh Tố Mãng Cầu",
  price: 20000,
  description: "Sinh Tố Mãng Cầu",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/sinhtomangcau.jpg")
)

Product.create!(
  category_id: 5,
  status: 0,
  shop_id: 4,
  user_id: 4,
  name: "Dừa Bến Tre",
  price: 22000,
  description: "Dừa Bến Tre",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/dua.jpg")
)

Product.create!(
  category_id: 5,
  status: 0,
  shop_id: 4,
  user_id: 4,
  name: "Rau Câu Trái Dừa",
  price: 30000,
  description: "Rau Câu Trái Dừa",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/raucautraidua.jpg")
)

Product.create!(
  category_id: 5,
  status: 0,
  shop_id: 4,
  user_id: 4,
  name: "Rau Câu Flan Trái Dừa",
  price: 33000,
  description: "Rau Câu Flan Trái Dừa",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/raucauflandua.jpg")
)

Product.create!(
  category_id: 5,
  status: 0,
  shop_id: 4,
  user_id: 4,
  name: "Yaourt Dừa",
  price: 15000,
  description: "Yaourt Dừa",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/yaourtdua.jpg")
)

Product.create!(
  category_id: 5,
  status: 0,
  shop_id: 4,
  user_id: 4,
  name: "Yaourt Trái Dừa",
  price: 45000,
  description: "Yaourt Trái Dừa",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/yaourttraidua.jpg")
)

Product.create!(
  category_id: 5,
  status: 0,
  shop_id: 4,
  user_id: 4,
  name: "Yaourt Dừa Trái Cây",
  price: 20000,
  description: "Yaourt Dừa Trái Cây",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/yaourtduatraicay.jpg")
)

Product.create!(
  category_id: 5,
  status: 0,
  shop_id: 4,
  user_id: 4,
  name: "Yaourt Bơ + Sầu Riêng",
  price: 25000,
  description: "Yaourt Bơ + Sầu Riêng",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/yaourtbosaurieng.jpg")
)

Product.create!(
  category_id: 5,
  status: 0,
  shop_id: 4,
  user_id: 4,
  name: "Mít Sữa Dừa",
  price: 20000,
  description: "Mít Sữa Dừa",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/mitsuadua.jpg")
)

Product.create!(
  category_id: 5,
  status: 0,
  shop_id: 4,
  user_id: 4,
  name: "Mít Sữa Dừa Sầu Riêng",
  price: 25000,
  description: "Mít Sữa Dừa Sầu Riêng",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/mitsuaduasaurieng.jpg")
)

Product.create!(
  category_id: 4,
  status: 0,
  shop_id: 5,
  user_id: 4,
  name: "Mì Quảng Ếch",
  price: 30000,
  description: "Mì Quảng Ếch",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/miquangech.jpg")
)

Product.create!(
  category_id: 4,
  status: 0,
  shop_id: 5,
  user_id: 4,
  name: "Mì Quảng Lươn",
  price: 30000,
  description: "Mì Quảng Lươn",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/miquangluon.jpg")
)

Product.create!(
  category_id: 4,
  status: 0,
  shop_id: 5,
  user_id: 4,
  name: "Mì Quảng Sườn",
  price: 25000,
  description: "Mì Quảng Sườn",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/miquangsuon.jpg")
)

Product.create!(
  category_id: 4,
  status: 0,
  shop_id: 5,
  user_id: 4,
  name: "Mì Quảng Bò",
  price: 20000,
  description: "Mì Quảng Bò",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/miquangbo.jpg")
)

Product.create!(
  category_id: 4,
  status: 0,
  shop_id: 5,
  user_id: 4,
  name: "Mì Quảng Gà",
  price: 20000,
  description: "Mì Quảng Gà",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/miquangga.jpg")
)

Product.create!(
  category_id: 4,
  status: 0,
  shop_id: 5,
  user_id: 4,
  name: "Mì Quảng Cá Lóc",
  price: 20000,
  description: "Mì Quảng Cá Lóc",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/miquangcaloc.jpg")
)

Product.create!(
  category_id: 6,
  status: 0,
  shop_id: 6,
  user_id: 1,
  name: "Sữa chua-15",
  price: 15000,
  description: "Sữa chua-15",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/suachua.jpg")
)

Product.create!(
  category_id: 6,
  status: 0,
  shop_id: 6,
  user_id: 1,
  name: "Sữa chua-20",
  price: 20000,
  description: "Sữa chua-20",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/suachua.jpg")
)

Product.create!(
  category_id: 6,
  status: 0,
  shop_id: 6,
  user_id: 1,
  name: "Nước sấu-15",
  price: 15000,
  description: "Nước sấu-15",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/nuocsau.jpg")
)

Product.create!(
  category_id: 6,
  status: 0,
  shop_id: 6,
  user_id: 1,
  name: "Nếp cẩm-20",
  price: 20000,
  description: "Nếp cẩm-20",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/nepcam.jpg")
)

Product.create!(
  category_id: 6,
  status: 0,
  shop_id: 6,
  user_id: 1,
  name: "Nếp cẩm-15",
  price: 15000,
  description: "Nếp cẩm-15",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/nepcam.jpg")
)

Product.create!(
  category_id: 6,
  status: 0,
  shop_id: 6,
  user_id: 1,
  name: "Khoai lang tẩm mật ong chiên",
  price: 30000,
  description: "Khoai lang tẩm mật ong chiên",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/khoailang.jpg")
)

Product.create!(
  category_id: 6,
  status: 0,
  shop_id: 6,
  user_id: 1,
  name: "Nem chua rán nhỏ",
  price: 30000,
  description: "Nem chua rán nhỏ",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/nemchua.jpg")
)

Product.create!(
  category_id: 6,
  status: 0,
  shop_id: 6,
  user_id: 1,
  name: "Nem chua rán lớn",
  price: 50000,
  description: "Nem chua rán lớn",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/nemchua.jpg")
)

Product.create!(
  category_id: 6,
  status: 0,
  shop_id: 6,
  user_id: 1,
  name: "Nước mơ",
  price: 15000,
  description: "Nước mơ",
  start_hour: "08:00:00",
  end_hour: "20:00:00",
  image: File.open(Rails.root + "public/images/nuocmo.jpg")
)
