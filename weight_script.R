jfk2017 <- read.csv("jfk 2017.csv")
View(jfk2017)
jfk2017 <- read.csv("jfk2021.csv")
jfk2017 <- read.csv("jfk 2017.csv")
jfk2021 <- read.csv("jfk2021.csv")
jfk2022 <- read.csv("jfk2022.csv")
jfk2023 <- read.csv("jfk2023.csv")
jfk2021$X <- NULL
jfk2022$X <- NULL
jfk2023$X <- NULL
jfk2017$X <- NULL
jfkFull <- rbind(jfk2017, jfk2021, jfk2022, jfk2023)
jfkFullWeighted <- jfkFull
jfkFullWeighted[jfkFullWeighted==''] <- NA
jfkFullWeighted$Comments <- '0'
jfkFullWeighted$NARA.Release.Date <-'0'
jfkFullWeighted$File.Name <-'0'
jfkFullWeighted$Record.Num <-'0'
jfkFullWeighted[jfkFullWeighted=="00/00/0000" | jfkFullWeighted=="00/00/01"] <- "20"
jfkFullWeighted$File.Num <-'0'
jfkFullWeighted$Doc.Type <-'0'
jfkFullWeighted$Review.Date <-'0'
jfkFullWeighted[jfkFullWeighted=="Redacted Version Only"] <- "20"
jfkFullWeighted[jfkFullWeighted=="Redact"] <- "20"
jfkFullWeighted[jfkFullWeighted=="Missing"] <- "20"
jfkFullWeighted[jfkFullWeighted=="NA"] <- "10"
jfkFullWeighted[jfkFullWeighted=='NA'] <- "10"
jfkFullWeighted[jfkFullWeighted==NA] <- "10"
jfkFullWeighted[is.na(jfkFullWeighted)] <- "10"
jfkFullWeighted[jfkFullWeighted == "CIA"] <- "20"
jfkFullWeighted[jfkFullWeighted == "FBI"] <- "15"
jfkFullWeighted[jfkFullWeighted == "NSA"] <- "10"
jfkFullWeighted[jfkFullWeighted == "INSCOM/CSF"] <- "10"
jfkFullWeighted[jfkFullWeighted == "In Part"] <- "10"
jfkFullWeighted[jfkFullWeighted == "Withhold"] <- "20"
jfkFullWeighted[jfkFullWeighted == "Withheld"] <- "20"
jfkFullWeighted[jfkFullWeighted == "In Full"] <- "20"
jfkFullWeighted$Num.Pages <- '0'
jfkFullWeighted$Pages.Released <- '0'
jfkFullWeighted[jfkFullWeighted != "5" & jfkFullWeighted != "10" & jfkFullWeighted != "15" & jfkFullWeighted != "20"] <- "0"
jfkFullWeighted[, 1:17] <- sapply(jfkFullWeighted[, 1:17], as.numeric)
jfkFullWeighted$Weight <- rowSums(jfkFullWeighted)
barplot(table(jfkFullWeighted$Weight), xlab = "Weight", ylab = "Num Files")
jfkWeighNoWithheld <- jfkFullWeighted
jfkWeighNoWithheld$Formerly.Withheld <- NULL
jfkWeighNoWithheld$Weight <- "0"
jfkWeighNoWithheld[, 1:17] <- sapply(jfkWeighNoWithheld[, 1:17], as.numeric)
jfkWeighNoWithheld$Weight <- rowSums(jfkWeighNoWithheld)
barplot(table(jfkWeighNoWithheld$Weight), xlab = "Weight", ylab = "Num Files")
