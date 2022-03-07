
# generate a txt file 
# with pairs of integers from 0 to 20, disposed in two columns

# minimum
min_add=0

# maximum
max_add=20

# repetitions of each number 
add_reps=max_add+1

# generate vectors of numebers 
int1=rep(min_add:max_add, each=add_reps)
int2=c(rep(c(min_add:max_add), add_reps))
fullset_train=cbind.data.frame(int1, int2)

# output table
write.table(fullset_train, "fullset_train.txt", col.names = F, row.names= F, sep=" ")

