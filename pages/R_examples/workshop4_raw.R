set.seed(20)
x <- rnorm(100, 0, 2)
e <- rnorm(100)
y <- 0.5 + 2 * x + e
plot(x, y)

head(mtcars)

mtcars_lm1 <- lm(mpg ~ wt, data=mtcars)
mtcars_lm1
summary(mtcars_lm1)

plot(mtcars$wt, mtcars$mpg)
abline(mtcars_lm1)

pairs(mtcars, gap=0.9)

set.seed(414)
mtcars_train_rows <- sample(1:32, 24)
mtcars_train <- mtcars[mtcars_train_rows,]
mtcars_test <- mtcars[-mtcars_train_rows,]

mtcars_lm2 <- lm(mpg ~ ., data=mtcars_train)
summary(mtcars_lm2)
plot(mtcars_lm2)

mtcars_lm2_orig <- mtcars_lm2

mtcars_lm2 <- update(mtcars_lm2, .~. - vs, data = mtcars_train)
summary(mtcars_lm2)
mtcars_lm2 <- update(mtcars_lm2, .~. - hp, data = mtcars_train)
summary(mtcars_lm2)
mtcars_lm2 <- update(mtcars_lm2, .~. - disp, data = mtcars_train)
summary(mtcars_lm2)
mtcars_lm2 <- update(mtcars_lm2, .~. - qsec, data = mtcars_train)
summary(mtcars_lm2)
mtcars_lm2 <- update(mtcars_lm2, .~. - drat, data = mtcars_train)
summary(mtcars_lm2)
mtcars_lm2 <- update(mtcars_lm2, .~. - gear, data = mtcars_train)
summary(mtcars_lm2)
mtcars_lm2 <- update(mtcars_lm2, .~. - am, data = mtcars_train)
summary(mtcars_lm2)
mtcars_lm2 <- update(mtcars_lm2, .~. - carb, data = mtcars_train)

test_predict_orig <- predict(mtcars_lm2_orig, mtcars_test)
test_predict_backward <- predict(mtcars_lm2, mtcars_test)

par(mfrow=c(2,1))
plot(test_predict_orig, mtcars_test$mpg)
plot(test_predict_backward, mtcars_test$mpg)

sqrt(mean(test_predict_orig - mtcars_test$mpg)**2)
sqrt(mean(test_predict_backward-mtcars_test$mpg)**2)

mean(chickwts$weight)
sd(chickwts$weight)

par(mfrow=c(1,1))
boxplot(weight ~ feed, data=chickwts)

summary(chickwts)
table(chickwts$feed)

linseed_rows <- which(chickwts$feed == "linseed")
meatmeal_rows <- which(chickwts$feed == "meatmeal")
rows2remove <- c(linseed_rows, meatmeal_rows)

chickwts_subset <- chickwts[-rows2remove,]

boxplot(weight ~ feed, data=chickwts_subset)

chickwts_subset$feed <- factor(chickwts_subset$feed)

?kruskal.test

kruskal.test(weight ~ feed, data=chickwts_subset)

head(trees)

length(which(trees$Height >= 70))

par(mfrow=c(1,3))
plot(trees$Girth, trees$Height)
plot(trees$Girth, trees$Volume)
plot(trees$Volume, trees$Height)

# We're interested in trees > 75 feet
# We want to test whether these tall trees have
# greater volume than other trees.

tall_trees <- which(trees$Height > 75)

tmp <- data.frame("a"=c(40, 130, 13), "b"=c(14, 1, 3))

trees_tall_only <- trees[tall_trees,]
trees_short_only <- trees[-tall_trees,]

tall_mean_vol <- mean(trees_tall_only$Volume)
short_mean_vol <- mean(trees_short_only$Volume)

obs_diff <- tall_mean_vol - short_mean_vol

# Want to figure out how much bigger this observed 
# diff. in means is compared to what 2 random subsets would be.

subset1_size <- length(tall_trees)

set.seed(1491)

ran_mean_diffs <- c()

# Loop from 1 to 10000
for(i in 1:10000) {
  
  subset1_rows <- sample(1:31, size=subset1_size)
  
  trees_subset1_only <- trees[subset1_rows,]
  trees_subset2_only <- trees[-subset1_rows,]
  
  subset1_mean_vol <- mean(trees_subset1_only$Volume)
  subset2_mean_vol <- mean(trees_subset2_only$Volume)
  
  ran_mean_diff <- subset1_mean_vol - subset2_mean_vol
  
  ran_mean_diffs <- c(ran_mean_diffs, ran_mean_diff)
  
}

hist(ran_mean_diffs, col="grey", main="")
abline(v=obs_diff, lwd=2, lty=2, col="red")


in_tab <- read.table("ass4_training_set.txt",
                     header=T,
                     sep="\t",
                     stringsAsFactors = TRUE)

in_test <- read.table("ass4_test_set.txt",
                     header=T,
                     sep="\t",
                     stringsAsFactors = TRUE)

cond_mod <- glm(formula = condition ~ .,
                family = binomial(link = "logit"), data = in_tab)

cond_mod_pruned <- update(cond_mod, .~. - diet,
                          data = in_tab)

test_predictions <- predict(cond_mod, in_test,
                            type="response")

test_class_predictions <- test_predictions
test_class_predictions[which(test_class_predictions > 0.5)] <- "yes"
test_class_predictions[which(test_class_predictions <= 0.5)] <- "no"

length(which(in_test$condition == test_class_predictions))
