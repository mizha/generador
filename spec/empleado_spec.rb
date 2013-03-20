require 'empleado'

describe "pruebas para empleado" do

  it "Debe poder crear usuario con valores basico" do
      empleado = Empleado.new
      empleado.id == "123456"
    empleado.nombre == ""
  end

  it "crear a un usuario con nombre, apellido y id" do
    empleado = Empleado.new("1245","Marco","Arispe")
    empleado.id.should == "1245"
    empleado.nombre.should == "Marco"
    empleado.apellido.should == "Arispe"
  end

  it "crear a un empleado con todos sus datos hasta fecha de ingreso" do

    empleado = Empleado.new("1245","Marco","Arispe","12/05/2012")
    empleado.fechaIngreso.should == "12/05/2012"
  end

end