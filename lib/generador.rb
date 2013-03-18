class Generador
  attr_accessor :empleado
  def initialize
  end
  def ejecutar(empleado)
    @empleado = empleado
  end
  def ejecutarEnFecha(empleado,fecha)
    time = Time.new
    fecha1 = time.day.to_s + "/" +time.month.to_s+"/"+time.year.to_s
    if (fecha1 == fecha)
       @empleado = empleado
    end
  end

end