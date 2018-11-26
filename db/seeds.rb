# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rol.create([{descripcion: 's_admin'}, {descripcion: 'usuario'}, {descripcion: 'jefeDependencia'}, {descripcion: 'esclavoDependencia'}])
Dependencium.create([{descripcion: 'Director'}, {descripcion: 'usuarioNormal'}, {descripcion: 'Financiera'}, {descripcion: 'Juridica'}, {descripcion: 'Administrativa'}])
Tipodocumento.create(descripcion: 'CC')
Usuario.create(
    [
        {
            nombre: "Jose",
            apellido: "Altamar",
            celular: "3002892012",
            rol: Rol.find(1),
            dependencium: Dependencium.find(1),
            email: "JoralmoPro@gmail.com",
            tipodocumento: Tipodocumento.find(1),
            password: "123456"
        },
        {
            nombre: "usuario",
            apellido: "normal",
            celular: "3002892012",
            rol: Rol.find(2),
            dependencium: Dependencium.find(2),
            email: "usuario@normal.com",
            tipodocumento: Tipodocumento.find(1),
            password: "123456"
        },
        {
            nombre: "jefe",
            apellido: "financiera",
            celular: "3002892012",
            rol: Rol.find(3),
            dependencium: Dependencium.find(3),
            email: "jefe@financiera.com",
            tipodocumento: Tipodocumento.find(1),
            password: "123456"
        },
        {
            nombre: "esclavo",
            apellido: "financiera",
            celular: "3002892012",
            rol: Rol.find(4),
            dependencium: Dependencium.find(3),
            email: "esclavo@financiera.com",
            tipodocumento: Tipodocumento.find(1),
            password: "123456"
        },
        {
            nombre: "jefe",
            apellido: "juridica",
            celular: "3002892012",
            rol: Rol.find(3),
            dependencium: Dependencium.find(4),
            email: "jefe@juridica.com",
            tipodocumento: Tipodocumento.find(1),
            password: "123456"
        },
        {
            nombre: "esclavo",
            apellido: "juridica",
            celular: "3002892012",
            rol: Rol.find(4),
            dependencium: Dependencium.find(4),
            email: "esclavo@juridica.com",
            tipodocumento: Tipodocumento.find(1),
            password: "123456"
        },
        {
            nombre: "jefe",
            apellido: "administrativa",
            celular: "3002892012",
            rol: Rol.find(3),
            dependencium: Dependencium.find(5),
            email: "jefe@administrativa.com",
            tipodocumento: Tipodocumento.find(1),
            password: "123456"
        },
        {
            nombre: "esclavo",
            apellido: "administrativa",
            celular: "3002892012",
            rol: Rol.find(4),
            dependencium: Dependencium.find(5),
            email: "esclavo@administrativa.com",
            tipodocumento: Tipodocumento.find(1),
            password: "123456"
        }
    ]
)

p "#{Usuario.count} usuarios creados"
p "#{Rol.count} roles creados"
p "#{Dependencium.count} dependencias creados"
p "#{Tipodocumento.count} tipos de documentos creados"