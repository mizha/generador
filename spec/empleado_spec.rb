require 'empleado'

describe "pruebas para empleado" do
  subject(:empleado) {Empleado.new(1245,"Marco","Arispe","")}
  
  it "Debe poder crear usuario con valores basico" do
  end

  it "crear a un usuario con nombre, apellido y id" do
    empleado.id.should == 1245
    empleado.nombre.should == "Marco"
    empleado.apellido.should == "Arispe"
  end

  it "aniadir fecha de ingreso a empleado" do
    empleado.fechaIngreso = "12/05/2012"
    empleado.fechaIngreso.should == "12/05/2012"
  end


end