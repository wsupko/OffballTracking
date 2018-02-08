### Install (if not available already) required libraries ###

if (!'data.table' %in% installed.packages()) {install.packages('data.table')}
if (!'ggplot2' %in% installed.packages()) {install.packages('ggplot2')}
if (!'scales' %in% installed.packages()) {install.packages('scales')}

### Load required libraries ###

library(data.table)
library(ggplot2)
library(scales)
library(boot)

#### Database connection #### 

#### Custom variables #### 



#### Custom function ####

# cross-join 

CJ.table <- function(X,Y){
    setkey(X[,c(k=1,.SD)],k)[Y[,c(k=1,.SD)],allow.cartesian=TRUE][,k:=NULL]}


#### 1. Data Input ####

#### 1.1 Working data ####

Imp.Tracking <- fread('./data/in/Imp.Tracking.txt')
Imp.Event <- fread('./data/in/Imp.Event.txt')

    

#### 1.2 Manual data ####

#### 2. Data wrangling ####

Proc.Tracking <- merge(Imp.Tracking, Imp.Event[, .(EventNo, Player, x_m, y_m, EventType, EventResult)], 
                       by = c('EventNo', 'Player'), all.x = T)

#### 3. Modelling ####


#### 4. Viz ####

ggplot(tmp) +
    geom_point(aes(x = x_m, y =- y_m, col = Type), size = 2)+
    facet_wrap(~EventNo)+
    theme_bw() +
    theme(axis.title.y = element_blank(), legend.position = 'bottom')



#### 4. Data Export ####

# ggsave('./img/ConfIntervalsXG.png', plot = plot.CI)
