### Raw R code from in-class examples

### Want to figure out how many rabbits after n months with
### litter size of k.

fib_rabbits <- function(n, k) {
  
  num_pairs <- c(1, 1)
  
  if(n <= 2) {
   return(c(1)) 
  }
  
  for(i in 3:n) {
    num_adult_pairs <- num_pairs[length(num_pairs)]
    num_baby_pairs <- k * num_pairs[length(num_pairs) - 1]
    num_pairs <- c(num_pairs, num_adult_pairs + num_baby_pairs)
  }
  
  return(num_pairs[length(num_pairs)])
  
}

my_list <- list("a"=c(15,14,526),
                "b"=c(417,6541,14), "c"=c(5,4))

lapply(my_list, function(x) { x[1] + x[2] })


x <- matrix(rnorm(200), 4, 50)
apply(x, 1, quantile, probs=c(0.25, 0.75))

library(beeswarm)
boxplot(iris$Sepal.Length ~ iris$Species, outline=FALSE, col="grey")
beeswarm(iris$Sepal.Length ~ iris$Species, pch=16, add=TRUE)

library(ggplot2)
data(iris)

ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point()

library(ggplot2)
data(iris)
my_plot <- ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point()

my_plot <- my_plot + theme_bw() + geom_point(aes(color=Species, shape=Species)) + 
  xlab("Sepal Length") +  ylab("Sepal Width")

par(mfrow=c(1,2))

hist(Puromycin$conc, xlab="Concentration", main="", col="grey", breaks=5)
hist(Puromycin$rate, xlab="Reaction rate", main="", col="grey", breaks=5)

par(mfrow=c(1,1))

plot(Puromycin$conc, Puromycin$rate, xlab="Concentration",
     ylab="Reaction rate", pch=16)

Puromycin$state_char <- as.character(Puromycin$state)
Puromycin$state2 <- factor(Puromycin$state_char,
                           levels=c("untreated", "treated"))

boxplot(Puromycin$rate ~ Puromycin$state, ylab="Reaction rate", col="grey")
boxplot(Puromycin$rate ~ Puromycin$state2, ylab="Reaction rate", col="grey")

beeswarm(Puromycin$rate ~ Puromycin$state, pch=16, add=TRUE)

test_df <- data.frame(a=c("dog", "dog", "cat", "cat", "dog"), b=c(10, 20, 4, 3, 9))
test_df
beeswarm(b ~ a, data=test_df)

bwplot(~yield | block, data=npk)

dotplot(~yield | block + N + P, data=npk)

test_in <- readRDS("test_input.rds")

test_in

mean_test_in <- lapply(test_in, get_mean_vals)

get_mean_vals <- function(x) {
  ### Return mean abundance for control and treated 
  ### rows separately.
  
  ### Go through each row and figure out if it's
  ### control or treated and add to appropriate vector
  ctrl_rows <- which(x$state == "control")
  ctrl_mean <- mean(x[ctrl_rows, "abundance"])
  treated_mean <- mean(x[-ctrl_rows, "abundance"])
  
  ### Return means of both vectors.
  return(c(ctrl_mean, treated_mean))
}

mean_test_in_df <- data.frame(mean_test_in)
mean_test_in_df <- data.frame(t(mean_test_in_df))

colnames(mean_test_in_df) <- c("ctrl", "treated")

mean_test_in_df$samples <- rownames(mean_test_in_df)

mean_test_in_df_melt <- melt(mean_test_in_df, id="samples")


ggplot(mean_test_in_df_melt, aes(samples, value)) +
  geom_bar(stat = "identity", aes(fill = variable), position = "dodge") +
  theme_bw()

ggplot(mean_test_in_df_melt, aes(samples, variable)) +
  geom_tile(aes(fill = value)) +
  scale_fill_gradient(low = "blue", high = "red")

