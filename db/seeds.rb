# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts"Creo usuarios"
Usuario.create(nombre:"Raúl", apellido:"Quintero", domicilio:"63 y 18", fecNac: DateTime.new(1993,2,1), DNI:"35126321", email:"rq@unagaucha.com", password:'35126321', password_confirmation:'35126321')
Usuario.create(nombre:"Juan", apellido:"Espinoza", domicilio:"61 y 18", fecNac: DateTime.new(1993,7,3), DNI:"37603841", email:"je@unagaucha.com", password:'37603841', password_confirmation:'37603841')
Usuario.create(nombre:"Delfina", apellido:"Arambarri", domicilio:"45 y 10", fecNac: DateTime.new(1995,2,1), DNI:"38000000", email:"da@unagaucha.com", password:'38000000', password_confirmation:'38000000')
Usuario.create(nombre:"Augusto", apellido:"Bonifacio", domicilio:"190 y 25", fecNac: DateTime.new(1994,2,1), DNI:"39000000", email:"ab@unagaucha.com", password:'39000000', password_confirmation:'39000000')
Usuario.create(nombre:"Lucas", apellido:"Hourquebie", domicilio:"5 y 18", fecNac: DateTime.new(1990,2,1), DNI:"35000000", email:"lh@unagaucha.com", password:'35000000', password_confirmation:'35000000')

puts "Creo gauchadas"
Gauchada.find_or_create_by(titulo: "Busco acompañante de viaje", descripcion: "Soy camionero y busco una persona que me acompañe en mi viaje hasta Rawson porque sufro problemas de sueño.
Saldríamos el primer fin de semana de octubre y retornaríamos el fin de semana siguiente.
* Condición fundamental: debe cebar buenos mates", ciudad: "La Plata", usuario_id: 1)
Gauchada.find_or_create_by(titulo: "Reencontrarme con Ramirez", descripcion: "Ramirez es un burrito que tenía de mascota en un campo en Tucumán. Quisiera reencontrarme con él pero no puedo moverme por un problema físico.
Me gustaría que alguien lo traiga desde mi pueblo para poder saludarlo y luego volver a llevarlo.
*la foto es del 2004, Ramirez puede haber cambiado un poco", imagen: "Fotoburrito", ciudad: "San Miguel de Tucumán", usuario_id: 2)

Gauchada.find_or_create_by(titulo: "Busco testigo falso", descripcion: "El año pasado tuve un accidente automovilístico en el que choqué el frente de una casa. El dueño de esa casa me quiere llevar a juicio y estoy buscando evitarlo.
Necesito de un/a abuelito/a que testifique a mi favor diciendo que choqué el frente de la casa por esquivarlo/a.", ciudad: "9 de Julio", usuario_id: 3)
Gauchada.find_or_create_by(titulo:"Karl", descripcion: "Karl es mi perrito y necesita de alguien que lo cuide durante la primera quincena de enero que me voy de vacaciones. Es muy juguetón y muy buena compañía.", imagen: "fotoperro", ciudad: "Carlos Casares", usuario_id: 4)
Gauchada.find_or_create_by(titulo: "Restaurar obra de arte", descripcion: "La imagen de la izquierda es la original y la de la derecha mi intento por restaurarla. ¿Alguien me haría la gauchada de acomodarla para que se parezca más a la original?", imagen: "obra", ciudad: "La Plata", usuario_id: 5)

Question.find_or_create_by(contenido: "¿A qué hora sale?", gauchada_id: 1, usuario_id: 2)
Answer.find_or_create_by(contenido: "A las 8", question_id:1)


puts "Logros por defecto"

Gauchada.find_or_create_by(titulo:"Politico",puntaje:-10000)
Gauchada.find_or_create_by(titulo:"Observador",puntaje:0)
Gauchada.find_or_create_by(titulo:"Buen Tipo",puntaje:1)
Gauchada.find_or_create_by(titulo:"Tipazo",puntaje:5)
Gauchada.find_or_create_by(titulo:"Héroe",puntaje:10)
Gauchada.find_or_create_by(titulo:"Nobleza Gaucha",puntaje:20)
Gauchada.find_or_create_by(titulo:"Dios",puntaje:50)