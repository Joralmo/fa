json.extract! notification, :id, :mensaje, :idUsuario, :leida, :pqr, :created_at, :updated_at
json.url notification_url(notification, format: :json)
