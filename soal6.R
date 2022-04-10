#no.6a
x1 = 0
x2 = 0
n = 100
m = 50
sd = 8

par(mfrow = c(2,1))
data = rnorm(n=n, mean=m, sd=sd)
z_array = c()

for (d in data)
  {
    z = (d - m)/sd
    z_array = append(z_array, z)
    
    if (d < m)
    {
      x1 = x1 + 1
    }
    else
    {
      x2 = x2 + 1
    }
  }


result = plot(z_array, type='l')

paste("Rata-rata adalah", m)
paste("x1 adalah", x1)
paste("x2 adalah", x2)

#no.6b
h = hist(rnorm(100, 50, 8), breaks = 50, main="5025201274_Alif Adrian Anzary_F_DNhistogram")

#no.6c
varian = sd*sd
paste("Varian adalah", varian)