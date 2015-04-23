# Carga del RDS 
NEI <- readRDS("C:/Users/Jesuso/Documents/UPEMOR_Abril_Mayo_2015_Topicos_Selectos/R_Prog/Project2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Jesuso/Documents/UPEMOR_Abril_Mayo_2015_Topicos_Selectos/R_Prog/Project2/Source_Classification_Code.rds")

# Muestras de datos para prueba 
NEIsample <- NEI[sample(nrow(NEI), size = 5000, replace = F), ]

# Subsets de datos para agregar informacion de 2 años 
MD <- subset(NEI, fips == '24510')

png(filename = 'plot2.png')
barplot(tapply(X = MD$Emissions, INDEX = MD$year, FUN = sum), main = 'Total Emission in Baltimore City, MD', xlab = 'Year', ylab = expression('PM'[2.5]))
dev.off()