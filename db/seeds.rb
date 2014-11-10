# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#tabelnaam.create({kolom:'data',kolom:222,kolom:'etc'},{kolom:'data',kolom:222,kolom:'etc'} )
Customer.create([{first_name:'Luuk', last_name:'Reuzel', phone:'0612345678', email:'Luuk@vriesco.com', company_id:1},
								{first_name:'Anne', last_name:'Stoer', phone:'0687654321', email:'Anne@BeConcrete.nl', company_id:2},
								{first_name:'Jelmer', last_name:'Pietermaai', phone:'0612348765', email:'pietermaai@deharmonie.nl', company_id:3}
								])
Reservation.create(	[	{created_at:'29-10-2014',date:'25-12-2014',start:'14:00',end:'15:00',description:'een bedrijfsuitje voor teambuilding met een wandeling door het bos en activiteiten',status:0,customer_id:1},
										{created_at:'30-11-2014',date:'25-12-2014',start:'16:00',end:'18:00',description:'bedrijfs vergadering',status:0,customer_id:2},
										{created_at:'20-10-2014',date:'03-11-2014',start:'12:00',end:'18:00',description:'presentaties ',status:0,customer_id:3},
										{created_at:'31-10-2014',date:'08-11-2014',start:'13:00',end:'15:00',description:'een bedrijfsuitje voor teambuilding met een wandeling door het bos en activiteiten',status:1,customer_id:1},
										])
Company.create(	[{name:'Vriesco int.'}, 
								{name:'Be Concrete.'},
								{name:'De Harmonie'} 
								])