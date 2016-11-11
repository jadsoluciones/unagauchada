# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts"Creo usuarios"
Usuario.create(nombre:"Raúl", apellido:"Quintero", domicilio:"63 y 18", fecNac: DateTime.new(1993,2,1), DNI:"35126321", email:"rq@unagaucha.com", password:'35126321', password_confirmation:'35126321', puntos:"0")
Usuario.create(nombre:"Juan", apellido:"Espinoza", domicilio:"61 y 18", fecNac: DateTime.new(1993,7,3), DNI:"37603841", email:"je@unagaucha.com", password:'37603841', password_confirmation:'37603841', puntos: "2")
Usuario.create(nombre:"Delfina", apellido:"Arambarri", domicilio:"45 y 10", fecNac: DateTime.new(1995,2,1), DNI:"38000000", email:"da@unagaucha.com", password:'38000000', password_confirmation:'38000000', puntos: "5")
Usuario.create(nombre:"Augusto", apellido:"Bonifacio", domicilio:"190 y 25", fecNac: DateTime.new(1994,2,1), DNI:"39000000", email:"ab@unagaucha.com", password:'39000000', password_confirmation:'39000000', puntos: "10")
Usuario.create(nombre:"Lucas", apellido:"Hourquebie", domicilio:"5 y 18", fecNac: DateTime.new(1990,2,1), DNI:"35000000", email:"lh@unagaucha.com", password:'35000000', password_confirmation:'35000000', puntos: "-1")

puts "Creo gauchadas"
Gauchada.find_or_create_by(titulo: "Busco acompañante de viaje", descripcion: "Soy camionero y busco una persona que me acompañe en mi viaje hasta Rawson porque sufro problemas de sueño.
Saldríamos el primer fin de semana de octubre y retornaríamos el fin de semana siguiente.
* Condición fundamental: debe cebar buenos mates", ciudad: "Pehuajó", usuario_id: 1)

Gauchada.find_or_create_by(titulo: "Reencontrarme con Ramirez", descripcion: "Ramirez es un burrito que tenía de mascota en un campo en Tucumán. Quisiera reencontrarme con él pero no puedo moverme por un problema físico.
Me gustaría que alguien lo traiga desde mi pueblo para poder saludarlo y luego volver a llevarlo.
*la foto es del 2004, Ramirez puede haber cambiado un poco", imagen: "vjuaqmwatadovugjnxx9.jpg", ciudad: "San Miguel de Tucumán", usuario_id: 2)

Gauchada.find_or_create_by(titulo: "Busco testigo falso", descripcion: "El año pasado tuve un accidente automovilístico en el que choqué el frente de una casa. El dueño de esa casa me quiere llevar a juicio y estoy buscando evitarlo.
Necesito de un/a abuelito/a que testifique a mi favor diciendo que choqué el frente de la casa por esquivarlo/a.", ciudad: "9 de Julio", usuario_id: 3)

Gauchada.find_or_create_by(titulo:"Karl", descripcion: "Karl es mi perrito y necesita de alguien que lo cuide durante la primera quincena de enero que me voy de vacaciones. Es muy juguetón y muy buena compañía.", imagen: "abzwfeantoafvvcznezm.jpg", ciudad: "Carlos Casares", usuario_id: 4)
Gauchada.find_or_create_by(titulo: "Restaurar obra de arte", descripcion: "La imagen de la izquierda es la original y la de la derecha mi intento por restaurarla. ¿Alguien me haría la gauchada de acomodarla para que se parezca más a la original?", imagen: "nj1e3vy89crrvvklwire.jpg", ciudad: "La Plata", usuario_id: 5)

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
