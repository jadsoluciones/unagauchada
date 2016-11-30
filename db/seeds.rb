# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts"Creo usuarios"
Usuario.create(nombre:"Raúl", apellido:"Quintero", domicilio:"63 y 18", fecNac: DateTime.new(1993,2,1), DNI:"35126321", email:"rq@unagaucha.com", password:'35126321', password_confirmation:'35126321', puntos:"0")
Usuario.create(nombre:"Juan", apellido:"Espinoza", domicilio:"61 y 18", fecNac: DateTime.new(1993,7,3), DNI:"37603841", email:"je@unagaucha.com", password:'37603841', password_confirmation:'37603841', puntos: "2", image_url: "http://res.cloudinary.com/arambarrid/image/upload/v1479423235/d458caf2-b20a-439d-860c-3f37b437351b_hlpf97.jpg")
Usuario.create(nombre:"Delfina", apellido:"Arambarri", domicilio:"45 y 10", fecNac: DateTime.new(1995,2,1), DNI:"38000000", email:"da@unagaucha.com", password:'38865914', password_confirmation:'38865914', puntos: "5", image_url: "http://res.cloudinary.com/arambarrid/image/upload/v1479423610/Friends-Monica_o3nmew.jpg")
Usuario.create(nombre:"Augusto", apellido:"Bonifacio", domicilio:"190 y 25", fecNac: DateTime.new(1994,2,1), DNI:"39000000", email:"ab@unagaucha.com", password:'39000000', password_confirmation:'39000000', puntos: "10", image_url: "http://res.cloudinary.com/arambarrid/image/upload/v1479423683/Chandler-friends-32112997-500-381_jeo1oy.jpg")
Usuario.create(nombre:"Lucas", apellido:"Hourquebie", domicilio:"5 y 18", fecNac: DateTime.new(1990,2,1), DNI:"35000000", email:"lh@unagaucha.com", password:'35000000', password_confirmation:'35000000', puntos: "-1", image_url: "http://res.cloudinary.com/arambarrid/image/upload/v1479423270/hqdefault_st8dps.jpg")

puts "Creo gauchadas"
Gauchada.find_or_create_by(titulo: "Busco acompañante de viaje", descripcion: "Soy camionero y busco una persona que me acompañe en mi viaje hasta Rawson porque sufro problemas de sueño.
Saldríamos el primer fin de semana de octubre y retornaríamos el fin de semana siguiente.
* Condición fundamental: debe cebar buenos mates", ciudad: "Pehuajó", usuario_id: 1,created_at:DateTime.new(2016, 11, 10, 22, 35, 0))

Gauchada.find_or_create_by(titulo: "Reencontrarme con Ramirez", descripcion: "Ramirez es un burrito que tenía de mascota en un campo en Tucumán. Quisiera reencontrarme con él pero no puedo moverme por un problema físico.
Me gustaría que alguien lo traiga desde mi pueblo para poder saludarlo y luego volver a llevarlo.
*la foto es del 2004, Ramirez puede haber cambiado un poco", image_url: "http://res.cloudinary.com/arambarrid/image/upload/v1477794187/vjuaqmwatadovugjnxx9.jpg", ciudad: "San Miguel de Tucumán", usuario_id: 2,created_at:DateTime.new(2016, 11, 16, 22, 35, 0))

Gauchada.find_or_create_by(titulo: "Busco testigo falso", descripcion: "El año pasado tuve un accidente automovilístico en el que choqué el frente de una casa. El dueño de esa casa me quiere llevar a juicio y estoy buscando evitarlo.
Necesito de un/a abuelito/a que testifique a mi favor diciendo que choqué el frente de la casa por esquivarlo/a.", ciudad: "9 de Julio", usuario_id: 3,created_at:DateTime.new(2016, 11, 20, 22, 35, 0))

Gauchada.find_or_create_by(titulo:"Karl", descripcion: "Karl es mi perrito y necesita de alguien que lo cuide durante la primera quincena de enero que me voy de vacaciones. Es muy juguetón y muy buena compañía.", image_url: "http://res.cloudinary.com/arambarrid/image/upload/v1477798215/abzwfeantoafvvcznezm.jpg", ciudad: "Carlos Casares", usuario_id: 4,created_at:DateTime.new(2016, 11, 20, 22, 35, 0))
Gauchada.find_or_create_by(titulo: "Restaurar obra de arte", descripcion: "La imagen de la izquierda es la original y la de la derecha mi intento por restaurarla. ¿Alguien me haría la gauchada de acomodarla para que se parezca más a la original?", image_url: "http://res.cloudinary.com/arambarrid/image/upload/v1477798304/nj1e3vy89crrvvklwire.jpg", ciudad: "La Plata", usuario_id: 5,created_at:DateTime.new(2016, 11, 26, 22, 35, 0))
Gauchada.find_or_create_by(titulo: "Armen un partido", descripcion: "Necesito que armen un partido y ganen las elecciones", ciudad: "La Plata", usuario_id: 5,created_at:DateTime.new(2016, 11, 18, 22, 35, 0),estado:'Concretada')
Gauchada.find_or_create_by(titulo: "Presenteme a Laurita Fernández", descripcion: "Necesito que me presenten a Laurita Fernández", ciudad: "La Plata", usuario_id: 5,created_at:DateTime.new(2016, 11, 18, 22, 35, 0),estado:'No Concretada')

puts "Crea preguntas y respuestas"
Question.find_or_create_by(contenido: "¿A qué hora sale?", gauchada_id: 1, usuario_id: 2)
Answer.find_or_create_by(contenido: "A las 8", question_id:1)
Question.find_or_create_by(contenido: "¿Tereré te va? En La Plata no tomamos mate", gauchada_id: 1, usuario_id: 4)
Answer.find_or_create_by(contenido: "Mientras no digas 'el diagonal' no hay problema", question_id:2)
Question.find_or_create_by(contenido: "¿Muerde?", gauchada_id: 4, usuario_id: 1)
Answer.find_or_create_by(contenido: "No, es re manso", question_id:3)
Question.find_or_create_by(contenido: "Tengo un gato, ¿crees que se pueden llevar bien?", gauchada_id: 4, usuario_id: 5)
Answer.find_or_create_by(contenido: "Siempre vivió solo y con perros se lleva mal. Pero con gatos no creo que haya problema...", question_id:4)
Question.find_or_create_by(contenido: "Creo que lo vi hace poco, ¿puede ser que tenga 4 patas?", gauchada_id: 2, usuario_id: 3)
Answer.find_or_create_by(contenido: "¡Siiiiiiii! ¡¡¡Debe ser él!!!", question_id:5)

puts "Logros por defecto"

Logro.find_or_create_by(titulo:"Politico",min:-1,max:-1)
Logro.find_or_create_by(titulo:"Observador",min:0,max:0)
Logro.find_or_create_by(titulo:"Buen Tipo",min:1,max:4)
Logro.find_or_create_by(titulo:"Tipazo",min:5,max:9)
Logro.find_or_create_by(titulo:"Héroe",min:10,max:19)
Logro.find_or_create_by(titulo:"Nobleza Gaucha",min:20,max:49)
Logro.find_or_create_by(titulo:"Dios",min:50,max:50)

puts "Creo un administrador"
admin=Usuario.new(nombre:"Nancy", apellido:"Netramonti", domicilio:"15 y 47", fecNac: DateTime.new(1973,2,1), DNI:"30000000", email:"nn@unagaucha.com", password:'30000000', password_confirmation:'30000000')
admin.rol = "Admin"
admin.save

puts "Creo postulaciones"
Postulacion.find_or_create_by(descripcion:"Puedo cuidarlo la primer semana", fecha:DateTime.new(2017,1,1), estado:"En espera",gauchada_id: 4, usuario_id: 2)
Postulacion.find_or_create_by(descripcion:"Yo puedo cuidarlo sin problemas", fecha:DateTime.new(2017,1,1), estado:"En espera",gauchada_id: 4, usuario_id: 3)
Postulacion.find_or_create_by(descripcion:"Puedo la segunda quincena", fecha:DateTime.new(2017,1,15), estado:"En espera",gauchada_id: 4, usuario_id: 1)
aux = Gauchada.find(4)
aux.cant_postulantes = 3
aux.save
Postulacion.find_or_create_by(descripcion:"Yo te puedo dar una mano, no digo que quede mejor", fecha:DateTime.new(2017,1,1), estado:"En espera",gauchada_id: 5, usuario_id: 4)
Postulacion.find_or_create_by(descripcion:"Me ofrezco a ayudarte a preparar las pinturas para que la pintes", fecha:DateTime.new(2017,1,1), estado:"En espera",gauchada_id: 5, usuario_id: 1)
aux = Gauchada.find(5)
aux.cant_postulantes = 2
aux.save

puts "Creo registros de compras"


Compra.find_or_create_by(monto:48,puntos_comprados:4,created_at:DateTime.new(2016, 11, 10, 22, 35, 0))
Compra.find_or_create_by(monto:60,puntos_comprados:5,created_at:DateTime.new(2016, 11, 14, 22, 35, 0))
Compra.find_or_create_by(monto:36,puntos_comprados:3,created_at:DateTime.new(2016, 11, 18, 22, 35, 0))
Compra.find_or_create_by(monto:48,puntos_comprados:4,created_at:DateTime.new(2016, 11, 22, 22, 35, 0))
Compra.find_or_create_by(monto:12,puntos_comprados:1,created_at:DateTime.new(2016, 11, 22, 22, 35, 0))
Compra.find_or_create_by(monto:12,puntos_comprados:1,created_at:DateTime.new(2016, 11, 22, 22, 35, 0))
Compra.find_or_create_by(monto:12,puntos_comprados:1,created_at:DateTime.new(2016, 11, 22, 22, 35, 0))
Compra.find_or_create_by(monto:24,puntos_comprados:2,created_at:DateTime.new(2016, 11, 26, 22, 35, 0))
