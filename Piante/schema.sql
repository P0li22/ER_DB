/* Tables */
CREATE TABLE PIANTE (
    codice_pianta INTEGER NOT NULL,
    nome_comune INTEGER NOT NULL,
    nome_latino INTEGER NOT NULL,
    giardino INTEGER NOT NULL,
    esotica INTEGER NOT NULL,
    appartamento INTEGER NOT NULL,
    Type INTEGER NOT NULL,
    FORNITORE_codice_fornitore INTEGER NOT NULL,
    PRIMARY KEY (codice_pianta),
    FOREIGN KEY (FORNITORE_codice_fornitore) REFERENCES FORNITORE(codice_fornitore)
);
CREATE TABLE FORNITORE (
    codice_fornitore INTEGER NOT NULL,
    nome INTEGER NOT NULL,
    codice_fiscale INTEGER NOT NULL,
    indirizzo INTEGER NOT NULL,
    PRIMARY KEY (codice_fornitore)
);
CREATE TABLE TEMPO (
    data INTEGER NOT NULL,
    PRIMARY KEY (data)
);
CREATE TABLE CLIENTE (
    codice_cliente INTEGER NOT NULL,
    nome INTEGER NOT NULL,
    indirizzo INTEGER NOT NULL,
    partita_iva INTEGER,
    codice_fiscale INTEGER,
    Type INTEGER NOT NULL,
    PRIMARY KEY (codice_cliente)
);
CREATE TABLE PREZZO (
    PIANTE_codice_pianta INTEGER NOT NULL,
    data_inizio INTEGER NOT NULL,
    prezzo INTEGER NOT NULL,
    data_fine INTEGER NOT NULL,
    PRIMARY KEY (PIANTE_codice_pianta, data_inizio),
    FOREIGN KEY (PIANTE_codice_pianta) REFERENCES PIANTE(codice_pianta)
);
CREATE TABLE HAS_COLORAZIONI (
    PIANTE_codice_pianta INTEGER NOT NULL,
    COLORAZIONI_colorazioni INTEGER NOT NULL,
    PRIMARY KEY (PIANTE_codice_pianta, COLORAZIONI_colorazioni),
    FOREIGN KEY (PIANTE_codice_pianta) REFERENCES PIANTE(codice_pianta)
);
CREATE TABLE ACQUISTA (
    PIANTE_codice_pianta INTEGER NOT NULL,
    TEMPO_data INTEGER NOT NULL,
    CLIENTE_codice_cliente INTEGER NOT NULL,
    quantita INTEGER NOT NULL,
    PRIMARY KEY (PIANTE_codice_pianta, TEMPO_data, CLIENTE_codice_cliente),
    FOREIGN KEY (PIANTE_codice_pianta) REFERENCES PIANTE(codice_pianta),
    FOREIGN KEY (TEMPO_data) REFERENCES TEMPO(data),
    FOREIGN KEY (CLIENTE_codice_cliente) REFERENCES CLIENTE(codice_cliente)
);