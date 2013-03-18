require 'empleado'
require 'generador'

#generara cheque con nombre y apellido de empleado
#pagar en el ultimo dia del mes, respecto a lo que la fecha a trabajado
#si el empleado comenzo el 15 del mes solo se le paga los dias hasta fin de mes
#colocarle un ID al empleado
describe"Generar cheque para empleado con salario fijo" do

  it "Deberia generar cheque para empleado" do
    empleado = Empleado.new
    empleado.con_salario_fijo(300)
    generador = Generador.new
    cheque = generador.ejecutar(empleado)
    cheque.monto == 300
  end
  it "Deberia generar cheque para otro empleado" do
    empleado = Empleado.new
    empleado2=Empleado.new
    empleado.con_salario_fijo(300)
    empleado2.con_salario_fijo(500)
    generador = Generador.new
    cheque = generador.ejecutar(empleado)
    cheque2 = generador.ejecutar(empleado2)
    cheque.monto == 300
    cheque2.monto == 500
  end

  it "el cheque generado deberia corresponder al empleado" do
    empleado = Empleado.new
    empleado.con_salario_fijo(300)
    generador = Generador.new
    cheque = generador.ejecutar(empleado)
    cheque == empleado
  end
  it "generar cheque en una fecha determinada" do
    empleado = Empleado.new
    empleado.con_salario_fijo(300)
    generador = Generador.new
    time = Time.new
    fecha = time.day.to_s + "/" +time.month.to_s+"/"+time.year.to_s
    cheque = generador.ejecutarEnFecha(empleado,fecha)
    cheque.monto == 300
  end
end