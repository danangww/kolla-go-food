# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Food.delete_all
Food.create!([
  {
    name: 'Tenderloin Steak',
    description:
      %{<p>
        <em>Daging Terbaik dari Setiap Sapi</em>
        Terderloin hanya terdapat di bagian tengah sapi.
        Kami menyajikan Terderloin dari 3 negara asal: United States, New Zealand, dan India.
        Sudah coba Tenderloin steak racikan kami?
        </p>
      },
    image_url: 'tenderloin.jpg',
    price: 95000.00
  },
  {
    name: 'Satay',
    description:
      %{<p>
        <em>Daging Tusuk Spesial Indonesia</em>
        Satay adalah daging tusuk yang dibakar dan dibalut dengan bumbu kacang istimewa dari negeri Madura.
        Sudah mencicipinya?
        </p>
      },
    image_url: 'satay.jpg',
    price: 55000.00
  },
  {
    name: 'Pecel',
    description:
      %{<p>
        <em>Makanan Sehat untuk Vegetarian</em>
        Pecel adalah makanan khas beberapa kota di Indonesia, seperti Blitar, Nganjuk, dan Kediri.
        Pecel yang kami sajikan adalah kombinasi dari pecel-pecel yang ada di Indonesia.
        Dijamin rasanya gado-gado dan ciamik soro!
        </p>
      },
    image_url: 'pecel.jpg',
    price: 25000.00
  }
])

Buyer.delete_all
Buyer.create!([
  {
    name: 'Danang WW',
    email: 'danangww@yahoo.com',
    phone: '085731468614',
    address: 'Jl. Trowulan No. 29, Blitar'
  },
  {
    name: 'Wahyu DW',
    email: 'wahyudw@yahoo.com',
    phone: '085731468615',
    address: 'Jl. Tugu Pahlawan No. 30, Surabaya'
  },
  {
    name: 'Wicaksono DW',
    email: 'wicaksonodw@yahoo.com',
    phone: '085731468616',
    address: 'Jl. Tugu Monas No. 29, Blitar'
  }
])