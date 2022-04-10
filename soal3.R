mean_bayi_lahir = 4.5
#no.3a
banyak_bayi_lahir = 6
dpois(banyak_bayi_lahir, mean_bayi_lahir)

#no.3b
peluang = dpois(banyak_bayi_lahir,mean_bayi_lahir)
data = data.frame(y=c(peluang), x=c(1:365))
barplot(data$y, names.arg=data$x, ylab="peluang", xlab="hari ke-", ylim=0:1)

# no.3c
# dan bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan
# Perbandingan poin a dan poin b kurang lebih sama karena nilai proporsi yang didapatkan di poin A 
# berada dalam range proporsi yang ada di poin B yaitu 0.10-0.15. Oleh karena itu, pengaruh perhitungan 
# dengan estimasi selama 365 hari memberikan hasil yang mendekati dengan peluang bayi akan dilahirkan keesokan harinya

#no.3d
lambda = mean_bayi_lahir
rataan = varian = lambda
rataan
varian