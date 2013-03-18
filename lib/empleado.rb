
class Empleado
  attr_accessor :monto
  #colocar un ID para empleado

    def initialize

    end
  def con_salario_fijo(salario)
    @monto = salario
  end
  def monto
    @monto
  end
end