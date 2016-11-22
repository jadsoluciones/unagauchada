json.extract! postulacion, :id, :descripcion, :fecha, :estado, :created_at, :updated_at
json.url postulacion_url(postulacion, format: :json)
