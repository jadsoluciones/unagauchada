# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Creo gauchadas"
Gauchada.find_or_create_by(titulo: "Busco acompañante de viaje", descripcion: "Soy camionero y busco una persona que me acompañe en mi viaje hasta Rawson porque sufro problemas de sueño. 
Saldríamos el primer fin de semana de octubre y retornaríamos el fin de semana siguiente. 
* Condición fundamental: debe cebar buenos mates")
Gauchada.find_or_create_by(titulo: "Reencontrarme con Ramirez", descripcion: "Ramirez es un burrito que tenía de mascota en un campo en Tucumán. Quisiera reencontrarme con él pero no puedo moverme por un problema físico. 
Me gustaría que alguien lo traiga desde mi pueblo para poder saludarlo y luego volver a llevarlo.
*la foto es del 2004, Ramirez puede haber cambiado un poco", imagen: "Fotoburrito", ciudad: "San Miguel de Tucumán")
Gauchada.find_or_create_by(titulo: "Busco testigo falso", descripcion: "El año pasado tuve un accidente automovilístico en el que choqué el frente de una casa. El dueño de esa casa me quiere llevar a juicio y estoy buscando evitarlo.
Necesito de un/a abuelito/a que testifique a mi favor diciendo que choqué el frente de la casa por esquivarlo/a.")
Gauchada.find_or_create_by(titulo:"Karl", descripcion: "Karl es mi perrito y necesita de alguien que lo cuide durante la primera quincena de enero que me voy de vacaciones.
Es muy juguetón y muy buena compañía.", imagen: "fotoperro")
Gauchada.find_or_create_by(titulo: "Restaurar obra de arte", descripcion: "La imagen de la izquierda es la original y la de la derecha mi intento por restaurarla. ¿Alguien me haría la gauchada de acomodarla para que se parezca más a la original?", imagen: "obra")