p Complex(0.3) #=> (0.3+0i)
p Complex('0.3-0.5i') #=> (0.3-0.5i)
p Complex('2/3+3/4i') #=> ((2/3)+(3/4)*i)
p Complex('1@2') #=> (-0.4161468365471424+0.9092974268256817i)

p 0.3.to_c #=> (0.3+0i)
p '0.3-0.5i'.to_c #=> (0.3-0.5i)
p '2/3+3/4i'.to_c #=> ((2/3)+(3/4)*i)
p '1@2'.to_c #=> (-0.4161468365471424+0.9092974268256817i)

p Complex(1, 1) / 2 #=> ((1/2)+(1/2)*i)
p Complex(1, 1) / 2.0 #=> (0.5+0.5i)


# polar(abs[, arg]) → complex
# Returns a complex object which denotes the given polar form.
p Complex.polar(3, 0) #=> (3.0+0.0i)
p Complex.polar(3, Math::PI/2) #=> (1.836909530733566e-16+3.0i)
p Complex.polar(3, Math::PI) #=> (-3.0+3.673819061467132e-16i)
p Complex.polar(3, -Math::PI/2) #=> (1.836909530733566e-16-3.0i)
