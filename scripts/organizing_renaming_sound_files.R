library(readxl)
library(warbleR)
library(tools)


# this code is not organized (is a mess!)
fls <- list.files(path = "/media/m/Agalychnis/songs_of_birds_of_the_world/recordings/original_format/")

table(substr(fls, nchar(fls) - 3, nchar(fls)))
grep("ream$", fls, value = TRUE)

sum(grepl("wav$", fls, ignore.case = TRUE))

path <- "/media/m/Agalychnis/songs_of_birds_of_the_world/recordings/standardized_format/"

check_sound_files(path = path)

wi <- info_sound_files(path = path)

table(wi$sample.rate)

Sys.sleep(60*60*3)

fix_wavs(samp.rate = 44.1, bit.depth = 16, path = "/media/m/Agalychnis/songs_of_birds_of_the_world/recordings/standardized_format/")



sum(!fr)
mlmd$org.sound.files[!fr]


file.rename(to = file.path(path, mlmd$org.sound.files[fr]), from = file.path(path, mlmd$sound.files[fr]))



fls <- list.files(path = "/media/m/Agalychnis/songs_of_birds_of_the_world/recordings/standardized_format/")

table(substr(fls, nchar(fls) - 3, nchar(fls)))
length(fls)

ofls <- list.files(path = "/media/m/Agalychnis/songs_of_birds_of_the_world/recordings/original_format/")


length(ofls)

df <- data.frame(ofls, ext = file_ext(ofls), onm)


df[df$ext == "", ]
table(file_ext(ofls))

onm <-  file_path_sans_ext(ofls)
onm <- gsub(".octet-stream|.x-msvideo", "", onm)

tab <- table(onm)
m <- ofls[onm %in% names(tab)[tab > 1]]
tod <- grep("wav$", m, ignore.case = T, value = T)
unlink(file.path("/media/m/Agalychnis/songs_of_birds_of_the_world/recordings/original_format/", tod))

length(onm)


eanyDuplicated(onm)


df <- data.frame(fls, ext = file_ext(fls))


df[df$ext == "", ]
a <- setdiff(onm, file_path_sans_ext(fls))
ms <- df$ofls[df$onm %in% a]
ms <- ms[-length(ms)]

setwd("/media/m/Agalychnis/songs_of_birds_of_the_world/recordings/original_format/")
for(i in ms[!gsub("m4a$|octet-stream$|x-msvideo$", "wav", ms) %in% list.files("./new")])
{
    cll <- paste0("ffmpeg -i ", i, " ", file.path("./new", gsub("m4a$|octet-stream$|x-msvideo$", "wav", i)))
    system(cll)
}    


ms[!gsub("m4a$|octet-stream$|x-msvideo$", "wav", ms) %in% list.files("./new")]


wai <- info_sound_files("./new/converted_sound_files/")


wai$sample.rate


fix_wavs(samp.rate = 44.1, bit.depth = 16, path = "./new")


#### add species names to file names

mlmd <- read_excel("macaulay_library_recording_metadata.xlsx")


path <- "/media/m/Agalychnis/songs_of_birds_of_the_world/recordings/standardized_format/"

check_sound_files(path = path)

wi <- info_sound_files(path = path)

table(wi$sample.rate)

# # species
length(unique(mlmd$Scientific.Name))

wi$ml.id <- gsub(".wav", "", wi$sound.files, ignore.case = TRUE)

setdiff(mlmd$ML.Catalog.Number, wi$ml.id)

(miss <- setdiff(wi$ml.id, mlmd$ML.Catalog.Number))

mlmd$org.sound.files <- sapply(mlmd$ML.Catalog.Number, function(x) wi$sound.files[wi$ml.id == x][1])


mlmd$Orginal.Scientific.Name <-  mlmd$Scientific.Name


mlmd$sound.files <- paste0(gsub(" ", "_", mlmd$Scientific.Name), "-ML", mlmd$ML.Catalog.Number, ".wav")

anyDuplicated(mlmd$sound.files)

mlmd$Scientific.Name <- sapply(mlmd$Orginal.Scientific.Name, function(x) paste(strsplit(x, " ")[[1]][1:2], collapse = " "))

names(clm)

View(mlmd[grep("[^[:alnum:] ]", mlmd$Scientific.Name, value =F),])

mlmd$Scientific.Name <- gsub("\\[undescribed", "sp", mlmd$Scientific.Name)

# read families from clements
clm <-read.csv("Clements-Checklist-v2021-August-2021.csv")
clm.sp <- clm[clm$category == "species", ]

nrow(clm.sp)

setdiff(mlmd$Scientific.Name, clm.sp$scientific.name)


mlmd$range <- sapply(mlmd$Scientific.Name, function(x) {
    y <- clm.sp$range[clm.sp$scientific.name == x]
    
    if (length(y)== 0) y <- NA
    return(y)
})



mlmd$family.common.name <- sapply(mlmd$Scientific.Name, function(x) {
    y <- clm.sp$family[clm.sp$scientific.name == x]

if (length(y)== 0) y <- NA
return(y)
})


mlmd$family <- sapply(mlmd$family.common.name, function(x) strsplit(x, "\\(")[[1]][1])
   
mlmd$family <- gsub(" ", "", mlmd$family)                                                                            
table(mlmd$family)

fmn <- aggregate(Scientific.Name ~ family, mlmd[!duplicated(mlmd$Scientific.Name),], length)

head(fmn)

names(fmn) <- c("family", "#_of_species")
write.csv(fmn, "number_of_species_per_family.csv", row.names = FALSE)


for(i in na.omit(unique(mlmd$family))){
  print(i)  
    dir.create(file.path("/media/m/Agalychnis/songs_of_birds_of_the_world/recordings/by_family", i))
    
    frm <- file.path("/media/m/Agalychnis/songs_of_birds_of_the_world/recordings/standardized_format/", na.omit(mlmd$org.sound.files[mlmd$family == i]))
    tu <- file.path("/media/m/Agalychnis/songs_of_birds_of_the_world/recordings/by_family", i, na.omit(mlmd$sound.files[mlmd$family == i]))
    
    fr <- file.copy(frm, to = tu)
}    


f <- list.files("/media/m/Agalychnis/songs_of_birds_of_the_world/recordings/by_family", recursive = T, pattern = "wav$")

setdiff(mlmd$sound.files, basename(f))


mlmd$file_url <- paste0("https://macaulaylibrary.org/asset/", mlmd$ML.Catalog.Number)

mlmd$species_ebird_url <- paste0("https://ebird.org/species/", mlmd$eBird.Species.Code)

write.csv(mlmd, "sound_files_and_extended_metadata.csv", row.names = FALSE)

final_db <- mlmd[, c("family", "Scientific.Name", "species_ebird_url", "ML.Catalog.Number", "sound.files", "Common.Name", "Orginal.Scientific.Name", "Observation.Details", "Behaviors", "Age.Sex", "file_url")]

names(final_db) <- c("family", "species","species_ebird_url", "catalog_ID", "sound_file", "common.name", "original_species_name", "observations", "behaviors", "age_and_sex", "file_url")

write.csv(final_db, "sound_files_metadata.csv", row.names = FALSE)
