require 'empleado'
require 'generador'
require 'cheque'

#generara cheque con nombre y apellido de empleado
#pagar en el ultimo dia del mes, respecto a lo que la fecha a trabajado
#si el empleado comenzo el 15 del mes solo se le paga los dias hasta fin de mes
#colocarle un ID al empleado
describe"Generar cheque para empleado con salario fijo" do
  subject(:empleado) {Empleado.new(1,"Pepito", "Perez", "")}
  subject(:empleado2) {Empleado.new(2, "Pepita","Padilla", "")}
  subject(:generador) {Generador.new}
  subject(:time) {Time.new}
  
  def initialize
    empleado.con_salario_fijo(300)
    empleado2.con_salario_fijo(500)
  end

  it "Deberia generar cheque para empleado" do
    cheque = generador.generarChequeParaEmpleado(empleado)
    cheque.empleado.monto == 300
  end
  it "Deberia generar cheque para otro empleado" do
    cheque = generador.generarChequeParaEmpleado(empleado)
    cheque2 = generador.generarChequeParaEmpleado(empleado2)
    cheque.empleado.monto == 300
    cheque2.empleado.monto == 500
  end

  it "el cheque generado deberia corresponder al empleado" do
    cheque = generador.generarChequeParaEmpleado(empleado)
    cheque.empleado.id == empleado.id
  end
  it "generar debe emitir un cheque con nombre y apellido de empleado" do
    cheque = generador.generarChequeParaEmpleado(empleado)
    cheque.empleado.nombre.should == "Pepito"
    cheque.empleado.apellido.should == "Perez"
  end

  it "generar cheque calculando un dia de trabajado para empleado fijo" do
    fecha = (time.day.to_i-1).to_s + "/" +time.month.to_s+"/"+time.year.to_s
    cheque = generador.ejecutarDesdeFecha(empleado,fecha)
    cheque == 15.0
  end
  it "generar cheque calculando 2 semanas del mismo mes de trabajado para empleado fijo" do
    fecha = (time.day.to_i-15).to_s + "/" +time.month.to_s+"/"+time.year.to_s
    cheque = generador.ejecutarDesdeFecha(empleado,fecha)
    cheque == 150.0
  end


  it "generar cheque en una fecha determinada" do
    fecha = time.day.to_s + "/" +time.month.to_s+"/"+time.year.to_s
    cheque = generador.ejecutarEnFecha(empleado,fecha)
    cheque.empleado.monto == 300
  end
end