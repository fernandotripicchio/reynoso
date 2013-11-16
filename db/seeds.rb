# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Create admin user
    admin = User.where(["login = ?", "admin"])
    if admin.blank?
        user = User.new
        user.login = "admin"
        user.email = "admin@admin.com"
        user.password = "12345678"
        user.password_confirmation = "12345678"
        user.full_name = "Admin"
        user.save
    end
    
    kind_movements = KindMovement.all
    
    if kind_movements.size == 0 
      
        movements = KindMovement.create( [{ description: "CAJA DIARIA", in: true}, 
                                          { description: "PAGO CLIENTES CUENTA CORRIENTE", in: false},
                                          { description: "ALQUILER", in: false},
                                          { description: "MONOTRIBUTO", in: false},
                                          { description: "APORTES SEGURIDAD SOCIAL (AFIP-DECLARACION JURADA) ", in: false},
                                          { description: "APORTES OBRAS SOCIALES (AFIP-DECLARACION JURADA)", in: false},
                                          { description: "ASEG. RIESGO DE TRABAJO (AFIP-DECLARACION JURADA)", in: false},
                                          { description: "CONTRIBUCIONES SEG. SOCIAL (AFIP-DECLARACION JURADA)", in: false},
                                          { description: "CONTRIBUCIONES OBRA SOCIAL (AFIP-DECLARACION JURADA) ", in: false},
                                          { description: "SINDICADO EMPLEADOS DE COMERCIO  ", in: false},
                                          { description: "FAECYS (Federacion argentina de empleados de comercio y s) ", in: false},
                                          { description: "MARIO SUELDO", in: false},
                                          { description: "DIANA", in: false},
                                          { description: "CONTADOR", in: false},
                                          { description: "IMPUESTOS INGRESOS BRUTOS Y OTROS", in: false},
                                          { description: "DESINFECCION + MATAFUEGOS", in: false},
                                          { description: "ENCOMIENDA + REMIS/COLECTIVO", in: false},
                                          { description: "MARKETING ", in: false},
                                          { description: "GASTOS CARTEL", in: false},
                                          { description: "GASTOS MANTENIMIENTO", in: false},
                                          { description: "GASTOS ADMINISTRATIVOS", in: false},
                                          { description: "ENVASES/EQUIPOS", in: false},
                                          { description: "MEDICAMENTOS/DROGAS VENCIDOS, ETC", in: false},
                                          { description: "MAGNUM SEGURIDAD", in: false},
                                          { description: "PROGRAMADOR", in: false},
                                          { description: "BANCO (GASTOS TRANFERENCIA ETC)", in: false}
                                          
                                          ] )
    end
