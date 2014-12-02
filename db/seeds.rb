# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#tabelnaam.create({kolom:'data',kolom:222,kolom:'etc'},{kolom:'data',kolom:222,kolom:'etc'} )
Customer.create([	{first_name:'Luuk', last_name:'Reuzel', phone:'0612345678', email:'Luuk@vriesco.com', company_id:1, address:'Rengerslaan 1', zip:'8917 DA', city:'Leeuwarden' },
					{first_name:'Mandy', last_name:'Fransz', phone:'0612345677', email:'Mandy@vriesco.com', company_id:2, address:'Rengerslaan 2', zip:'8917 DB', city:'Leeuwarden' },
					{first_name:'Phong', last_name:'Tran', phone:'0612345676', email:'Phong@vriesco.com', company_id:3, address:'Rengerslaan 3', zip:'8917 DC', city:'Leeuwarden' },
					{first_name:'Anne', last_name:'Stoer', phone:'0612345675', email:'Anne@vriesco.com', company_id:4, address:'Rengerslaan 4', zip:'8917 DE', city:'Leeuwarden' },
					{first_name:'Jelmer Pieter', last_name:'Timmer', phone:'0612345674', email:'Jelmer@vriesco.com', company_id:5, address:'Rengerslaan 5', zip:'8917 DF', city:'Leeuwarden' },
					{first_name:'Joey', last_name:'Stoelwinder', phone:'0612345673', email:'Joey@vriesco.com', company_id:6, address:'Rengerslaan 6', zip:'8917 DG', city:'Leeuwarden' },
					{first_name:'Dirk Sierd', last_name:'De Vries', phone:'0612345672', email:'Dirk@vriesco.com', company_id:7, address:'Rengerslaan 7', zip:'8917 DH', city:'Leeuwarden' },
					{first_name:'Sjef', last_name:'Smeets', phone:'0612345671', email:'Sjef@vriesco.com', company_id:8, address:'Rengerslaan 8', zip:'8917 DI', city:'Leeuwarden' },
					{first_name:'Raymond', last_name:'Van Dongelen', phone:'0612345670', email:'Raymond@vriesco.com', company_id:9, address:'Rengerslaan 9', zip:'8917 DJ', city:'Leeuwarden' },
					{first_name:'Jan-Wessel', last_name:'Hovingh', phone:'0612345668', email:'Jan@vriesco.com', company_id:10, address:'Rengerslaan 10', zip:'8917 DD', city:'Leeuwarden' }
				])
#Reservation.create([	{started_at:'', ended_at:'', amount:40, description:'een bedrijfsuitje voor teambuilding met een wandeling door het bos en activiteiten', status:0, customer_id:1},
#						{started_at:'', ended_at:'', amount:36, description:'bedrijfs vergadering', status:0, customer_id:2},
#						{started_at:'', ended_at:'', amount:28, description:'presentaties ', status:0, customer_id:3},
#						{started_at:'', ended_at:'', amount:35, description:'een bedrijfsuitje voor teambuilding met een wandeling door het bos en activiteiten', status:1, customer_id:1},
#						{started_at:'', ended_at:'', amount:20, description:'Overleg van de zaak', status:1, customer_id:4, note:'catering nodig'},
#						{started_at:'', ended_at:'', amount:26, description:'teambuilding', status:1, customer_id:10, note:'binnen en buiten catering'},
#						{started_at:'', ended_at:'', amount:35, description:'zakelijk etentje', status:2, customer_id:5, note:'barbecue'},
#						{started_at:'', ended_at:'', amount:23, description:'vergadering', status:1, customer_id:10, note:'catering nodig, tafels en stoelen, beamer'},
#						{started_at:'', ended_at:'', amount:27, description:'kinder feestje', status:1, customer_id:5, note:'eten en drinken en speeltuin moeten beschikbaar zijn'},
#						{started_at:'', ended_at:'', amount:38, description:'circus voorstelling',status:1, customer_id:6, note:'kussens op de grond voor publiek, binnen'},
#						{started_at:'', ended_at:'', amount:35, description:'vergadering',status:2, customer_id:8, note:'tafels en stoelen en catering'},
#						{started_at:'', ended_at:'', amount:26, description:'bijeenkomst opdrachtgevers', status:1, customer_id:10, note:'beamer, tafels en stoelen'},
#						{started_at:'', ended_at:'', amount:35, description:'presentatie voor opdrachtgever', status:2, customer_id:7, note:'catering, tafels en stoelen en beamer'},
#						{started_at:'', ended_at:'', amount:21, description:'tentoonstelling', status:1, customer_id:6, note:''},
#						{started_at:'', ended_at:'', amount:18, description:'bedrijfsfeest', status:2, customer_id:8, note:'zit en sta plaatsen binnen en buiten, barbecue'},
#						{started_at:'', ended_at:'', amount:37, description:'rouwbijeenkomst', status:2, customer_id:5, note:'catering'},
#						{started_at:'', ended_at:'', amount:27, description:'klant en opdrachtgever bijeenkomst', status:1, customer_id:10, note:'zit plaatsen en beamer'},
#						{started_at:'', ended_at:'', amount:32, description:'vergadering', status:1, customer_id:9, note:'catering nodig'},
#						{started_at:'', ended_at:'', amount:28, description:'bedrijfs borrel', status:2, customer_id:8, note:'catering, tafels en stoelen, beamer, binnen en buiten bereikbaar, jeu de boules baan'},
#						{started_at:'', ended_at:'', amount:24, description:'vrienden feest', status:1, customer_id:10, note:'catering, versiering, barbecue'},
#						{started_at:'', ended_at:'', amount:19, description:'vergadering', status:2, customer_id:9, note:'catering'},
#						{started_at:'', ended_at:'', amount:35, description:'bijeenkomst opdrachtgever', status:1, customer_id:8, note:'beamer'},
#						{started_at:'', ended_at:'', amount:22, description:'presentatie voor klant', status:2, customer_id:9, note:'beamer en catering'},
#						{started_at:'', ended_at:'', amount:39, description:'toneelstuk voor kinderen', status:2, customer_id:6, note:'speeltuin en bos worden gebruikt'},
#						{started_at:'', ended_at:'', amount:31, description:'besloten feest', status:2, customer_id:5, note:'binnen en buiten gebruiken, barbecue, beamer, catering, bos'}


										])
Company.create(	[	{name:'Vriesco int.'}, 
					{name:'Be Concrete.'},
					{name:'De Harmonie'},
					{name:'De Bress'},
					{name:'De Blauwe Golf'},
					{name:'Het Kalverdijkje'},
					{name:'De Vosseburcht'},
					{name:'De NHL'},
					{name:'Stenden'}
								])