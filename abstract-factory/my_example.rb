class Bicicleta
    def marco = raise('not implemented')

    def platos = raise('not implemented')

    def suspension = raise('not implemented')
end

class Moto
    def rin = raise('not implemented')
    
    def cilindraje = raise('not implemented')

    def galones = raise('not implemented')
end

class BicicletaDeMontana < Bicicleta
    def marco = 'carbono'

    def platos = 3

    def suspension = true
end

class BicicletaDePista < Bicicleta
    def marco = 'aluminio'

    def platos = 4

    def suspension = false
end

class MotoMontana < Moto                                                                            
    def rin = 27

    def cilindraje = 150

    def galones = 15
    end

class MotoDeportiva < Moto               
    def rin = 30

    def cilindraje = 500

    def galones = 20
end

class Fabrica
    def crear_bicicleta = raise('not implemented')
    
    def crear_moto = raise('not implemented')
end

class FabricaDeMontana < Fabrica
    def crear_bicicleta = BicicletaDeMontana.new
    
    def crear_moto = MotoMontana.new
end

class FabricaDeportiva < Fabrica
    def crear_bicicleta = BicicletaDePista.new
    
    def crear_moto = MotoDeportiva.new
end

def client_code(fabrica)
    bicicleta = fabrica.crear_bicicleta

    moto = fabrica.crear_moto

    puts "La bicicleta tiene el marco de #{bicicleta.marco}, tiene #{bicicleta.platos} platos y #{bicicleta.suspension ? "tiene" : "no tiene"} suspension"
    puts "La moto tiene el rin #{moto.rin}, tiene un cilindraje de #{moto.cilindraje}, y le caben #{moto.galones} galones"
end

fabrica_de_montaña = FabricaDeMontana.new
fabrica_de_pista = FabricaDeportiva.new

client_code(fabrica_de_montaña)
puts "-" * 70
client_code(fabrica_de_pista)
