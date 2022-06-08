/* Tables */
CREATE TABLE PERIODO (
    data_inizio INTEGER NOT NULL,
    PRIMARY KEY (data_inizio)
);
CREATE TABLE INSEGNANTE (
    codice_fiscale INTEGER NOT NULL,
    cellulare INTEGER,
    nome INTEGER NOT NULL,
    PRIMARY KEY (codice_fiscale)
);
CREATE TABLE PISCINA (
    nome INTEGER NOT NULL,
    indirizzo INTEGER NOT NULL,
    nome_responsabile INTEGER NOT NULL,
    telefono INTEGER NOT NULL,
    inizio INTEGER,
    fine INTEGER,
    Type INTEGER NOT NULL,
    PRIMARY KEY (nome)
);
CREATE TABLE INGRESSO_SINGOLO (
    codice_fiscale INTEGER NOT NULL,
    indirizzo INTEGER NOT NULL,
    nome INTEGER NOT NULL,
    telefono INTEGER NOT NULL,
    PISCINA_nome INTEGER NOT NULL,
    data INTEGER NOT NULL,
    PRIMARY KEY (codice_fiscale),
    FOREIGN KEY (PISCINA_nome) REFERENCES PISCINA(nome)
);
CREATE TABLE ISCRITTO (
    codice_fiscale INTEGER NOT NULL,
    eta INTEGER NOT NULL,
    medico INTEGER NOT NULL,
    data_certificato INTEGER NOT NULL,
    indirizzo INTEGER NOT NULL,
    nome INTEGER NOT NULL,
    telefono INTEGER NOT NULL,
    PRIMARY KEY (codice_fiscale)
);
CREATE TABLE CORSO (
    PISCINA_nome INTEGER NOT NULL,
    attivita INTEGER NOT NULL,
    modalita INTEGER NOT NULL,
    costo INTEGER NOT NULL,
    max_partecipanti INTEGER NOT NULL,
    min_partecipanti INTEGER NOT NULL,
    PRIMARY KEY (PISCINA_nome, attivita),
    FOREIGN KEY (PISCINA_nome) REFERENCES PISCINA(nome)
);
CREATE TABLE LEZIONE (
    CORSO_PISCINA_nome INTEGER NOT NULL,
    CORSO_attivita INTEGER NOT NULL,
    giorno INTEGER NOT NULL,
    ora INTEGER NOT NULL,
    PRIMARY KEY (CORSO_PISCINA_nome, CORSO_attivita, giorno),
    FOREIGN KEY (CORSO_PISCINA_nome) REFERENCES CORSO(PISCINA_nome),
    FOREIGN KEY (CORSO_attivita) REFERENCES CORSO(attivita)
);
CREATE TABLE HAS_QUALIFICHE (
    INSEGNANTE_codice_fiscale INTEGER NOT NULL,
    QUALIFICHE_qualifiche INTEGER NOT NULL,
    PRIMARY KEY (INSEGNANTE_codice_fiscale, QUALIFICHE_qualifiche),
    FOREIGN KEY (INSEGNANTE_codice_fiscale) REFERENCES INSEGNANTE(codice_fiscale)
);
CREATE TABLE LAVORA (
    PERIODO_data_inizio INTEGER NOT NULL,
    INSEGNANTE_codice_fiscale INTEGER NOT NULL,
    PISCINA_nome INTEGER NOT NULL,
    data_fine INTEGER NOT NULL,
    PRIMARY KEY (PERIODO_data_inizio, INSEGNANTE_codice_fiscale, PISCINA_nome),
    FOREIGN KEY (PERIODO_data_inizio) REFERENCES PERIODO(data_inizio),
    FOREIGN KEY (INSEGNANTE_codice_fiscale) REFERENCES INSEGNANTE(codice_fiscale),
    FOREIGN KEY (PISCINA_nome) REFERENCES PISCINA(nome)
);
CREATE TABLE PARTECIPA (
    ISCRITTO_codice_fiscale INTEGER NOT NULL,
    CORSO_PISCINA_nome INTEGER NOT NULL,
    CORSO_attivita INTEGER NOT NULL,
    PRIMARY KEY (ISCRITTO_codice_fiscale, CORSO_PISCINA_nome, CORSO_attivita),
    FOREIGN KEY (ISCRITTO_codice_fiscale) REFERENCES ISCRITTO(codice_fiscale),
    FOREIGN KEY (CORSO_PISCINA_nome) REFERENCES CORSO(PISCINA_nome),
    FOREIGN KEY (CORSO_attivita) REFERENCES CORSO(attivita)
);