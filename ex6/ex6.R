p1 <- 4
p2 <- 9
exp1 <- 3
exp2 <- 20

#1
prob = log10(1+1/p1) + log10(1+1/p2)

#2
hits <- 0
for (x in exp1:exp2) {
    first <- floor(2^x / (10 ^ floor(log10(2^x))))
    print(x)
    print(first)
    print("---")
    if(first == p1 | first == p2) {
        hits = hits + 1
    }
}
frac = hits/(exp2-exp1+1)

#3
desvio = abs(prob-frac)

#
