library(tidyverse)

# read file

comments <- read_rds("input_data/quest_sheet.rds") %>%
  select(45,56)

quest_sheet <- read_rds("input_data/quest_sheet.rds") %>%
  # remove legal part
  select(-53, -54, -55, -56) %>%
  rename(email_1 = "Email address", email_2 = "Email") %>%
  mutate(email = case_when(
    is.na(email_2) ~ email_1,
    is.na(email_1) ~ email_2
  )) %>%
  select(-email_1 , -email_2)

# andamento delle risposte nel tempo


# Età

# Sesso

# Titolo di studio

# Settore

quest_sheet <- quest_sheet %>%
  mutate(`Settore in cui lavori` = str_to_sentence(`Settore in cui lavori`)) %>%
  mutate(`Settore in cui lavori` = ifelse(`Settore in cui lavori` == "Studente/dottorando",
                                          "Studenti/dottorandi",
                                          `Settore in cui lavori`))

quest_sheet %>%
  count(`Settore in cui lavori`)

# Profilo professionale specifico (TODO normalizzazione). Riflettere su normalizzazione profili professionali

quest_sheet %>%
  mutate(`Profilo professionale specifico` = str_to_sentence(`Profilo professionale specifico`)) %>%
  count(`Profilo professionale specifico`) %>%
  View()

# Sei un...?

quest_sheet %>%
  count(`Sei un...?`)

# Vivi...?

# qualcosa che ti preoccupa [Da Normalizzare, probabilmente basta splittare su virgola]

quest_sheet %>%
  mutate(`A livello personale, a causa di questa emergenza sanitaria, c’è qualcosa che ti preoccupa? Seleziona le DUE cose che ti preoccupano maggiormente.` = str_to_lower(`A livello personale, a causa di questa emergenza sanitaria, c’è qualcosa che ti preoccupa? Seleziona le DUE cose che ti preoccupano maggiormente.`)) %>%
  count(`A livello personale, a causa di questa emergenza sanitaria, c’è qualcosa che ti preoccupa? Seleziona le DUE cose che ti preoccupano maggiormente.`) %>%
  View()

# nuove opportunità [Normalizzare su dizionario. Lavoro, società .....]

quest_sheet %>%
  mutate(`Vedi nuove opportunità dovute alla situazione contingente?` = str_to_lower(`Vedi nuove opportunità dovute alla situazione contingente?`)) %>%
  count(`Vedi nuove opportunità dovute alla situazione contingente?`) %>%
  View()

# Cosa ti manca della vita d’ufficio (da normalizzare con virgole)

quest_sheet %>%
  mutate( `Cosa ti manca della vita d’ufficio? Seleziona le DUE cose che ti mancano di più.` = str_to_lower(`Cosa ti manca della vita d’ufficio? Seleziona le DUE cose che ti mancano di più.`)) %>%
  count(`Cosa ti manca della vita d’ufficio? Seleziona le DUE cose che ti mancano di più.`) %>%
  View()

# Cosa ti manca della vita sociale (da normalizzare con virgole)

# Hai sviluppato delle dipendenze (da normalizzare con virgole)

# Per la tua esperienza, quali sono gli svantaggi dello smart working con famiglia/coinquilini a casa? Seleziona i DUE svantaggi più critici.

quest_sheet %>%
  count(`Per la tua esperienza, quali sono gli svantaggi dello smart working con famiglia/coinquilini a casa? Seleziona i DUE svantaggi più critici.`) %>%
  View()


# A livello lavorativo, c’è qualcosa che ti preoccupa? Seleziona le DUE cose che ti preoccupano di più....43

# FARE MERGE: ci sono due domande uguali sulle quali va fatto merge proprio come ho fatto con mail. A un certo punto del questionario Elena ha cambiato la modalità di risposta levanfo il limite sui caratteri, quindi google ha creato due colonne diverse. Queste in realtà sono una colonna unica. VA riportato tutto insieme

# Negli ultimi giorni hai lavorato:...46

# FARE MERGE

# ...... simili.......


# Attribuisci un punteggio

quest_sheet %>%
  count(`Attribuisci un punteggio tra 1 (estremamente insoddisfatto), 2, 3, 5, 7 (estremamente soddisfatto) al tuo livello di soddisfazione riguardo a: [il modo in cui suddividi il tuo tempo tra vita lavorativa e vita extra-lavorativa]`) %>%
  View()






