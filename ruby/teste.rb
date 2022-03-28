puts "strings são objetos".upcase()
puts :um_simbolo.object_id()

puts 10.class()

pessoa = Object.new()

def pessoa.vai(lugar)
    puts "indo para #{lugar}"
end

def pessoa.troca(roupa, lugar)
    puts "trocando de #{roupa} no #{lugar}"
end

pessoa.vai("Pimenta Bueno")
pessoa.troca('camiseta', 'banheiro')
puts pessoa.class

class Pessoa
    def fala
        puts "Sei Falar"
    end

    def troca(roupa, lugar="banheiro")
        "trocando de #{roupa} no #{lugar}"
    end
end

p = Pessoa.new
puts p.class

class Pessoa
    def novo_metodo
        puts "novo_metodo"
    end
end
p.novo_metodo

class Restaurante
    def qualifica(nota, msg="Obrigado")
        puts "A nota do restaurante foi #{nota}. #{msg}"
    end
end

restaurante_um   = Restaurante.new
restaurante_dois = Restaurante.new

restaurante_um.qualifica(10)
restaurante_dois.qualifica(1, "Ruim!")

class Conta
    def transfere_para(destino, quantia)
        debita quantia
        # mesmo que self.debita(quantia)

        destino.deposita quantia
    end
end

obj = "uma string"

class Pessoa
    def muda_nome(novo_nome)
        @nome = novo_nome
        self.diz_nome
    end

    def diz_nome
        puts "meu nome é #{@nome}"
    end
end

p = Pessoa.new
p.muda_nome "Vilmar"
p.class

puts obj

5.times {print "Odelay!"}

#exit unless "restaurante".include? "aura"
['torrada', 'queijo', 'vinho'].each {|comida| print comida.capitalize}

taxa_de_urso_de_pelucia = 121.08
#total                   = taxa_de_orfao + taxa_de_urso_de_pelucia + gorjeta
habitantes = 12_000_000_000
puts(habitantes)

c = "Eu estou muito mais sábio.  Agora eu sei como as coisas
são -- o que você tem que fazer e como trabalhar isso."
print (c)
puts c.bytes
puts c.b
puts c.ascii_only?

frase_da_oprah        = "O"
frase_da_avril        = "A"
debate_ashlee_simpson = "D"


print frase_da_oprah
print frase_da_avril
print debate_ashlee_simpson

EDIFICIO = "350 5th Avenue, NYC, NY"

puts 2, 2 {|x, y| x + y}

a = (1..3)
puts a

c = {
        'nome'          => 'Peter',
        'profissao'     => 'domador de leoes',
        'grande apreco' => 'flanela'
}
puts c


require 'net/http'
Net::HTTP.start('www.ruby-lang.org', 80) do |http|
    print(http.get('/en/LICENSE.txt').body)
end

numero = 5
print numero.next # imprime '6'

frase = 'desejando por chifres'
print frase.length # imprime '19'

require 'abbrev'
require 'pp'

pp Abbrev.abbrev(['ruby'])
#=>  {"ruby"=>"ruby", "rub"=>"ruby", "ru"=>"ruby", "r"=>"ruby"}

pp Abbrev.abbrev(%w{ ruby rules })

print pp
pp Abbrev.abbrev(%w{ ruby rules })
print pp

pp %w{ summer winter }.abbrev
print pp

print File.ctime("teste.rb")

print File.exist?("foo")
print File.exists?("foo")

File.absolute_path("~oracle/bin")

1.upto(1000).each { |i| print i if i % 2 == 0 }

$\ = ' -- '
"waterbuffalo" =~ /buff/
print $", $', $$, "\n"

f = File.new("teste.rb")
f.each {|line| puts "#{f.lineno}: #{line}" }
puts f.ctime

f = File.new("teste.rb")
f.each_char {|c| print c, ' ' }   #=> #<File:testfile>