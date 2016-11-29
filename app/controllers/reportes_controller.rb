class ReportesController < ApplicationController
  def ingresos
	cargar_ingresos validar_fechas
  	
  end

  def gauchadas
  end


  private
  
  def cargar_ingresos fechas
  	if fechas
	  	@values = []
	  	@labels = []
	  	aux_monto = 0
	  	aux_fecha = false
	  	@compras = Compra.where("created_at >= ? AND created_at <= ?",fechas[:desde],fechas[:hasta]).order(:created_at)
	  	@compras.each do |compra|
	  		if !aux_fecha #es la primera vez
	  			aux_fecha = compra.created_at.to_date
	  			aux_monto = compra.monto
	  			if aux_fecha != fechas[:desde].to_date 
	  				@labels << fechas[:desde].to_date.to_formatted_s(:short)
	  				@values << 0
	  			end
	  		elsif aux_fecha!=compra.created_at.to_date # cambio de fecha
	  			@values << aux_monto
	  			@labels << aux_fecha.to_formatted_s(:short)         # => "10 Nov" 

	  			aux_monto = compra.monto
	  			aux_fecha = compra.created_at.to_date
	  		else #misma fecha que el anterior
	  			aux_monto += compra.monto
	  		end
	  	end
		@values << aux_monto
		@labels << aux_fecha.to_formatted_s(:short)
		if aux_fecha != fechas[:hasta].to_date
			@labels << fechas[:desde].to_date.to_formatted_s(:short)
			@values << 0 
		end
	end
  end

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

end
