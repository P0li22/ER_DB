/* Tables */
CREATE TABLE CINEMA (
    codice_cinema INTEGER NOT NULL,
    nome INTEGER NOT NULL,
    citta INTEGER NOT NULL,
    PRIMARY KEY (codice_cinema)
);
CREATE TABLE APERTURA (
    CINEMA_codice_cinema INTEGER NOT NULL,
    ora_inizio INTEGER NOT NULL,
    giorno INTEGER NOT NULL,
    ora_fine INTEGER NOT NULL,
    PRIMARY KEY (CINEMA_codice_cinema, ora_inizio, giorno),
    FOREIGN KEY (CINEMA_codice_cinema) REFERENCES CINEMA(codice_cinema)
);
CREATE TABLE DIPENDENTE (
    codice_fiscale INTEGER NOT NULL,
    cognome INTEGER NOT NULL,
    nome INTEGER NOT NULL,
    data_assunzione INTEGER NOT NULL,
    Type INTEGER NOT NULL,
    PRIMARY KEY (codice_fiscale)
);
CREATE TABLE PERIODO (
    DIPENDENTE_codice_fiscale INTEGER NOT NULL,
    data_inizio INTEGER NOT NULL,
    data_fine INTEGER NOT NULL,
    CINEMA_codice_cinema INTEGER NOT NULL,
    PRIMARY KEY (DIPENDENTE_codice_fiscale, data_inizio),
    FOREIGN KEY (DIPENDENTE_codice_fiscale) REFERENCES DIPENDENTE(codice_fiscale),
    FOREIGN KEY (CINEMA_codice_cinema) REFERENCES CINEMA(codice_cinema)
);
CREATE TABLE SALA (
    CINEMA_codice_cinema INTEGER NOT NULL,
    codice_sala INTEGER NOT NULL,
    capacita INTEGER NOT NULL,
    accessibile_disabili INTEGER NOT NULL,
    PRIMARY KEY (CINEMA_codice_cinema, codice_sala),
    FOREIGN KEY (CINEMA_codice_cinema) REFERENCES CINEMA(codice_cinema)
);
CREATE TABLE PROIEZIONE (
    SALA_CINEMA_codice_cinema INTEGER NOT NULL,
    SALA_codice_sala INTEGER NOT NULL,
    data INTEGER NOT NULL,
    ora_inizio INTEGER NOT NULL,
    FILM_codice_film INTEGER NOT NULL,
    PRIMARY KEY (SALA_CINEMA_codice_cinema, SALA_codice_sala, data, ora_inizio),
    FOREIGN KEY (SALA_CINEMA_codice_cinema) REFERENCES SALA(CINEMA_codice_cinema),
    FOREIGN KEY (SALA_codice_sala) REFERENCES SALA(codice_sala),
    FOREIGN KEY (FILM_codice_film) REFERENCES FILM(codice_film)
);
CREATE TABLE CLIENTE (
    codice_biglietto INTEGER NOT NULL,
    posto INTEGER NOT NULL,
    nome INTEGER NOT NULL,
    PROIEZIONE_SALA_CINEMA_codice_cinema INTEGER NOT NULL,
    PROIEZIONE_SALA_codice_sala INTEGER NOT NULL,
    PROIEZIONE_data INTEGER NOT NULL,
    PROIEZIONE_ora_inizio INTEGER NOT NULL,
    DIPENDENTE_codice_fiscale INTEGER NOT NULL,
    PRIMARY KEY (codice_biglietto),
    FOREIGN KEY (PROIEZIONE_SALA_CINEMA_codice_cinema) REFERENCES PROIEZIONE(SALA_CINEMA_codice_cinema),
    FOREIGN KEY (PROIEZIONE_SALA_codice_sala) REFERENCES PROIEZIONE(SALA_codice_sala),
    FOREIGN KEY (PROIEZIONE_data) REFERENCES PROIEZIONE(data),
    FOREIGN KEY (PROIEZIONE_ora_inizio) REFERENCES PROIEZIONE(ora_inizio),
    FOREIGN KEY (DIPENDENTE_codice_fiscale) REFERENCES DIPENDENTE(codice_fiscale)
);
CREATE TABLE FILM (
    codice_film INTEGER NOT NULL,
    titolo INTEGER NOT NULL,
    durata INTEGER NOT NULL,
    anno_uscita INTEGER NOT NULL,
    PRIMARY KEY (codice_film)
);
CREATE TABLE CONOSCE_LINGUE (
    DIPENDENTE_codice_fiscale INTEGER NOT NULL,
    LINGUA_lingua INTEGER NOT NULL,
    PRIMARY KEY (DIPENDENTE_codice_fiscale, LINGUA_lingua),
    FOREIGN KEY (DIPENDENTE_codice_fiscale) REFERENCES DIPENDENTE(codice_fiscale)
);
CREATE TABLE GESTISCE (
    DIPENDENTE_codice_fiscale INTEGER NOT NULL,
    PROIEZIONE_SALA_CINEMA_codice_cinema INTEGER NOT NULL,
    PROIEZIONE_SALA_codice_sala INTEGER NOT NULL,
    PROIEZIONE_data INTEGER NOT NULL,
    PROIEZIONE_ora_inizio INTEGER NOT NULL,
    PRIMARY KEY (DIPENDENTE_codice_fiscale, PROIEZIONE_SALA_CINEMA_codice_cinema, PROIEZIONE_SALA_codice_sala, PROIEZIONE_data, PROIEZIONE_ora_inizio),
    FOREIGN KEY (DIPENDENTE_codice_fiscale) REFERENCES DIPENDENTE(codice_fiscale),
    FOREIGN KEY (PROIEZIONE_SALA_CINEMA_codice_cinema) REFERENCES PROIEZIONE(SALA_CINEMA_codice_cinema),
    FOREIGN KEY (PROIEZIONE_SALA_codice_sala) REFERENCES PROIEZIONE(SALA_codice_sala),
    FOREIGN KEY (PROIEZIONE_data) REFERENCES PROIEZIONE(data),
    FOREIGN KEY (PROIEZIONE_ora_inizio) REFERENCES PROIEZIONE(ora_inizio)
);
CREATE TABLE GENERE_FILM (
    FILM_codice_film INTEGER NOT NULL,
    GENERE_genere INTEGER NOT NULL,
    PRIMARY KEY (FILM_codice_film, GENERE_genere),
    FOREIGN KEY (FILM_codice_film) REFERENCES FILM(codice_film)
);