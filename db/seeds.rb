# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find(3)

Post.create(user: user,
            title:'Cyberattack Hits Ukraine Then Spreads Internationally',
            link: 'https://www.nytimes.com/2017/06/27/technology/ransomware-hackers.html?partner=rss&emc=rss',
            description: 'Several companies have been affected by the Petya cyberattack
                          including, from left,Rosneft, the Russian energy giant; Merck,
                          a pharmaceutical company; and Maersk, a shipping company.',
            pub_date: 'Wed, 28 Jun 2017 04:01:03 GMT',
            photo: 'https://static01.nyt.com/images/2017/06/28/business/28hack1/28hack1-moth.jpg')

Post.create(user: user,
            title: 'After Grenfell Tower Fire, U.K. Asks: Has Deregulation Gone Too Far?',
            link: 'https://www.nytimes.com/2017/06/28/world/europe/uk-grenfell-tower-fire-deregulation.html?partner=rss&emc=rss',
            description: 'The deadly blaze at a high-rise apartment block has helped crystallize
                          resentment over the country’s embrace of neoliberalism,
                          privatization and austerity.',
            pub_date: 'Wed, 28 Jun 2017 08:18:39 GMT',
            photo: 'https://static01.nyt.com/images/2017/06/28/world/28austerity1/28austerity1-moth.jpg')

Post.create(user: user,
            title: 'Police Officers in Helicopter Attack Venezuela’s Supreme Court',
            link: 'https://www.nytimes.com/2017/06/27/world/americas/venezuela-supreme-court-helicopter.html?partner=rss&emc=rss',
            description: 'The attack, with grenades, was a rare act of disloyalty against
                          a government under pressure from protests and an economic collapse.',
            pub_date: 'Wed, 28 Jun 2017 04:02:36 GMT',
            photo: 'https://static01.nyt.com/images/2017/06/28/world/28venezuela-01/28venezuela-01-moth.jpg')