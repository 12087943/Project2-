#Jesus Osorio 
#Carga de informacion RDS
NEI <- readRDS("C:/Users/Jesuso/Documents/UPEMOR_Abril_Mayo_2015_Topicos_Selectos/R_Prog/Project2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Jesuso/Documents/UPEMOR_Abril_Mayo_2015_Topicos_Selectos/R_Prog/Project2/Source_Classification_Code.rds")

# Toma de muestras para prueba 
NEIsample <- NEI[sample(nrow(NEI), size = 1000, replace = F), ]

# Agregar 
Emissions <- aggregate(NEI[, 'Emissions'], by = list(NEI$year), FUN = sum)
Emissions$PM <- round(Emissions[, 2] / 1000, 2)

png(filename = "plot1.png")
barplot(Emissions$PM, names.arg = Emissions$Group.1, main = expression('Total Emission of PM'[2.5]), xlab = 'Year', ylab = expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()
