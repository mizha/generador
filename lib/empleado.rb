
class Empleado
  attr_accessor :monto,:id,:nombre,:apellido, :fechaIngreso
  #colocar un ID para empleado

    def initialize(id,nombre,apellido,fechaIngreso)
      @id = id
      @nombre= nombre;
      @apellido = apellido;
      @fechaIngreso = fechaIngreso
    end
  def con_salario_fijo(salario)
    @monto = salario
  end
  def monto
    @monto
  end
end