#!/usr/bin/env R

options(digits = 20)
set.seed(1)

# Calculate pi with Nilicantha's formula
# http://rprogramming.net/calculate-pi-r/
pi_calc <- 3
x <- 2
n <- 1000000

for(i in 1:n) {
	y <- x + 1
	z <- x + 2
	combine_with_pi_calc <- 4 / (x * y * z)
	test <- i %% 2 == 0 
	if (isTRUE(test)) {
		pi_calc <- pi_calc - combine_with_pi_calc
	} else {
		pi_calc <- pi_calc + combine_with_pi_calc
	}
	x <- z
}

if (round(pi_calc,13) == round(pi,13)) {
	print(paste("Successfully calculated pi with ", round(pi_calc,13), ".", sep=''))
	quit("yes", 0)
} else {
	print("Error! Pi was not calculated correctly.")
	print(paste(pi_calc, " is not equal to ", pi, "!", sep=''))
	quit("yes", 2)
}

