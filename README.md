## Nama-NRP
| Nama                | NRP        |
|---------------------|------------|
| Alif Adrian Anzary  | 5025201274 |

## Soal 1
>Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya.
- Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi sebelum keberhasilan pertama ketika p = 0.20 dari populasi menghadiri acara vaksinasi? (distribusi Geometrik)
``` R
#no.1a
n = 3
p = 0.20
dgeom(x = n, prob = p)
```

- Mean distribusi Geometrik dengan 10000 data random, prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 (distribusi Geometrik acak () == 3)
``` R
#no.1b
mean(rgeom(n = 10000, prob = p) == 3)
```

``` R
#no.1d
data.frame(x = 0:10, prob = dgeom(x = 0:10, prob = p)) %>%
  mutate(Failures = ifelse(x == n, n, "other")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Probability of X = 3 Failures Prior to First Success",
       subtitle = "Geometric(.2)",
       x = "Failures prior to first success (x)",
       y = "Probability")  
```

``` R
#no.1e
miu = 1/p
paste("Average is ", miu)

varian = (1-p)/ p^2
paste("Variant is ", varian)
```
</br>

## Soal 2
> Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2. Tentukan :
- Peluang terdapat 4 pasien yang sembuh
``` R
#no.2a
p = 0.2
n = 20
X = 4
dbinom(x = X, size = n, prob = p)
```

- Gambarkan grafik histogram berdasarkan kasus tersebut
``` R
#no.2b
library(dplyr)
library(ggplot2)

data.frame(x = 0:10, prob = dbinom(x = 0:10, size = n, prob = p)) %>%
  mutate(pasien = ifelse(x == X, X, "lainnya")) %>%
ggplot(aes(x = factor(x), y = prob, fill = pasien)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Peluang 4 pasien sembuh",
       x = "Sembuh",
       y = "Peluang")
```

- Nilai rataan (μ) dan varian (σ²) dari distribusi Binomial
``` R
#no.2c
n*p #mean
n*p*(1 - p) #variance
```
</br>

## Soal 3
> Diketahui data dari sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis 4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)
- Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?
``` R
mean_bayi_lahir = 4.5
#no.3a
banyak_bayi_lahir = 6
dpois(banyak_bayi_lahir, mean_bayi_lahir)
```
- simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini selama setahun (n = 365)
``` R
#no.3b
peluang = dpois(banyak_bayi_lahir,mean_bayi_lahir)
data = data.frame(y=c(peluang), x=c(1:365))
barplot(data$y, names.arg=data$x, ylab="peluang", xlab="hari ke-", ylim=0:1)
```
- Dan bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan
- Perbandingan poin a dan poin b kurang lebih sama karena nilai proporsi yang didapatkan di poin A 
- Berada dalam range proporsi yang ada di poin B yaitu 0.10-0.15. Oleh karena itu, pengaruh perhitungan
- Dengan estimasi selama 365 hari memberikan hasil yang mendekati dengan peluang bayi akan dilahirkan keesokan harinya

- Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.
``` R
#3d
lambda = mean_bayi_lahir
rataan = varian = lambda
rataan
varian
```
</br>

## Soal 4
> Diketahui nilai x = 2 dan v = 10. Tentukan:
- Fungsi Probabilitas dari Distribusi Chi-Square.
``` R
x = 2
v = 10
#4a
dchisq(x, v)
```
- Histogram dari Distribusi Chi-Square dengan 100 data random.
``` R
#4b
random_data = 100
output = rchisq(random_data, v)
hist(output)
```

- Nilai Rataan (μ) dan Varian (σ²) dari DistribusiChi-Square.
``` R
#4c
rataan = v
rataan
varian = 2*v
varian
```
</br>

## Soal 5
> Diketahui bilangan acak (random variable) berdistribusi exponential (λ = 3). Tentukan:
- Fungsi Probabilitas dari distribusi Exponensial
``` R
lambda = 3
#5a
dexp(lambda)
```
-  Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random
``` R
#5b
par(mfrow = c(2,2))
set.seed(1)
hist(rexp(10))
set.seed(1)
hist(rexp(100))
set.seed(1)
hist(rexp(1000))
set.seed(1)
hist(rexp(10000))
```

- Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial untuk n = 100 dan λ = 3
``` R
#5c
rataan = lambda
rataan
varian = lambda*lambda
varian
```
</br>

## Soal 6
> Diketahui generate random nilai sebanyak 100 data, mean = 50, sd = 8. Tentukan:
- Fungsi Probabilitas dari distribusi Normal P(X1 ≤ x ≤ X2), hitung Z-Score-nya dan plot data generate randomnya dalam bentuk grafik
``` R
#6a
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
```

- Generate Histogram dari Distribusi Normal dengan breaks 50 dan format penamaan: ```NRP_Nama_Probstat_{Nama Kelas}_DNhistogram```
``` R
#6b
h = hist(rnorm(100, 50, 8), breaks = 50, main="5025201223_Muhammad Ismail_B_DNhistogram")
```

-  Nilai Varian (σ²) dari hasil generate random nilai Distribusi Normal.
``` R
#6c
varian = sd*sd
paste("varian adalah", varian)
```