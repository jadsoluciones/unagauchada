json.extract! compra, :id, :monto, :puntos_comprados, :created_at, :updated_at
json.url compra_url(compra, format: :json)