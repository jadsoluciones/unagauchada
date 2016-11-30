class ReportesController < ApplicationController
  def ingresos
  	@compras = cargar Compra, lambda { |grupo| return grupo.sum(&:monto)}
  	
  end

  def gauchadas
  	@gauchadas = cargar Gauchada, lambda { |grupo|  return grupo.size }

  	@estado = {};
  	@estado[:en_curso] = @gauchadas.select {|g| g.estado.upcase == "EN CURSO" }.size
  	@estado[:concretada] = @gauchadas.select {|g| g.estado.upcase == "CONCRETADA" }.size
  	@estado[:no_concretada] = @gauchadas.select {|g| g.estado.upcase == "NO CONCRETADA" }.size

  	@postulantes = []
  	@postulantes << @gauchadas.select {|g| g.cant_postulantes == 0 }.size
  	@postulantes << @gauchadas.select {|g| g.cant_postulantes == 1 }.size
  	@postulantes << @gauchadas.select {|g| g.cant_postulantes == 2 }.size
  	@postulantes << @gauchadas.select {|g| g.cant_postulantes == 3 }.size
  	@postulantes << @gauchadas.select {|g| g.cant_postulantes == 4 }.size
  	@postulantes << @gauchadas.select {|g| g.cant_postulantes == 5 }.size
  	@postulantes << @gauchadas.select {|g| g.cant_postulantes > 5 }.size
  end


  private

  def validar_fechas
  	@errors = []
  	if params[:desde] && params[:hasta]
	  	desde = parse_fecha params[:desde]
	  	hasta = parse_fecha params[:hasta]
	  	if desde && hasta
	  		hasta = hasta.at_end_of_day
	  		if desde > hasta
	  			@errors << 'Desde no puede ser mayor a Hasta'
	  		end 
	  	else
		  	if !desde
		  		@errors << 'Ingrese una fecha valida para Desde'
		  	end
		  	if !hasta
		  		@errors << 'Ingrese una fecha valida para Hasta'
		  	end
	  	end
	else
		return false
	end
	if @errors.empty?
		{ :desde => desde, :hasta => hasta }
	else
		false
	end
  end

  def cargar modelo, valorizador
  	fechas = validar_fechas
  	todas = []
  	if fechas
		@labels = []
	  	@values = []
	  	todas = modelo.where("created_at >= ? AND created_at <= ?",fechas[:desde],fechas[:hasta]).order(:created_at)
		gauchadas = todas.group_by { |g|
		  g.created_at.to_date
		}
		gauchadas.each do |grupo| 
			grupo.each do |item| 
				if item.kind_of?(Array) 
					@values << valorizador.call(item)
				else 
					@labels << item.to_formatted_s(:short)
				end 
			end 
		end

		if !@labels.include?(fechas[:desde].to_date.to_formatted_s(:short))
			@labels.unshift fechas[:desde].to_date.to_formatted_s(:short)
			@values.unshift 0
		end
		if !@labels.include?(fechas[:hasta].to_date.to_formatted_s(:short))
			@labels << fechas[:hasta].to_date.to_formatted_s(:short)
			@values << 0
		end
	end
	todas
  end

end
