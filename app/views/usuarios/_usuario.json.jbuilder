json.extract! usuario, :id, :nombre, :apellido, :celular, :rol_id, :dependencium_id, :email, :tipodocumento_id, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
