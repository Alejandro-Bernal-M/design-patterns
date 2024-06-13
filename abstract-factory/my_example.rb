# The abstract factory pattern in software engineering is a design pattern that provides
#  a way to create families of related objects without imposing their concrete classes, 
#  by encapsulating a group of individual factories that have a common theme without 
#  specifying their concrete classes. According to this pattern, a client software 
#  component creates a concrete implementation of the abstract factory and then uses 
#  the generic interface of the factory to create the concrete objects that are part of 
#  the family. The client does not know which concrete objects it receives from each of 
#  these internal factories, as it uses only the generic interfaces of their products.
#  This pattern separates the details of implementation of a set of objects from their 
#  general usage and relies on object composition, as object creation is implemented in 
#  methods exposed in the factory interface.

# Use of this pattern enables interchangeable concrete implementations 
# without changing the code that uses them, even at runtime. However,
#  employment of this pattern, as with similar design patterns, may result 
# in unnecessary complexity and extra work in the initial writing of code. 
# Additionally, higher levels of separation and abstraction can result in 
# systems that are more difficult to debug and maintain.

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
