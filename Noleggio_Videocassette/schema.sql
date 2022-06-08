/* Tables */
CREATE TABLE FILM (
    regista INTEGER NOT NULL,
    titolo INTEGER NOT NULL,
    costo_noleggio INTEGER NOT NULL,
    CENTRO_DI_PRODUZIONE_codice_centro INTEGER NOT NULL,
    costo INTEGER NOT NULL,
    PRIMARY KEY (regista, titolo),
    FOREIGN KEY (CENTRO_DI_PRODUZIONE_codice_centro) REFERENCES CENTRO_DI_PRODUZIONE(codice_centro)
);
CREATE TABLE CENTRO_DI_PRODUZIONE (
    codice_centro INTEGER NOT NULL,
    telefono INTEGER NOT NULL,
    nome INTEGER NOT NULL,
    PRIMARY KEY (codice_centro)
);
CREATE TABLE CENTRO_SERVIZIO (
    codice_centro INTEGER NOT NULL,
    indirizzo INTEGER NOT NULL,
    telefono INTEGER NOT NULL,
    PRIMARY KEY (codice_centro)
);
CREATE TABLE SETTORE (
    CENTRO_SERVIZIO_codice_centro INTEGER NOT NULL,
    codice_settore INTEGER NOT NULL,
    PRIMARY KEY (CENTRO_SERVIZIO_codice_centro, codice_settore),
    FOREIGN KEY (CENTRO_SERVIZIO_codice_centro) REFERENCES CENTRO_SERVIZIO(codice_centro)
);
CREATE TABLE IMPIEGATO (
    codice_fiscale INTEGER NOT NULL,
    telefono INTEGER NOT NULL,
    nome INTEGER NOT NULL,
    PRIMARY KEY (codice_fiscale)
);
CREATE TABLE PERIODO (
    IMPIEGATO_codice_fiscale INTEGER NOT NULL,
    data_inizio INTEGER NOT NULL,
    data_fine INTEGER NOT NULL,
    ruolo INTEGER NOT NULL,
    CENTRO_SERVIZIO_codice_centro INTEGER NOT NULL,
    PRIMARY KEY (IMPIEGATO_codice_fiscale, data_inizio),
    FOREIGN KEY (IMPIEGATO_codice_fiscale) REFERENCES IMPIEGATO(codice_fiscale),
    FOREIGN KEY (CENTRO_SERVIZIO_codice_centro) REFERENCES CENTRO_SERVIZIO(codice_centro)
);
CREATE TABLE HAS_TITOLO_STUDIO (
    IMPIEGATO_codice_fiscale INTEGER NOT NULL,
    TITOLO_STUDIO_titolo_studio INTEGER NOT NULL,
    PRIMARY KEY (IMPIEGATO_codice_fiscale, TITOLO_STUDIO_titolo_studio),
    FOREIGN KEY (IMPIEGATO_codice_fiscale) REFERENCES IMPIEGATO(codice_fiscale)
);
CREATE TABLE HAS_ELENCO_ATTORI (
    ELENCO_ATTORI_elenco_attori INTEGER NOT NULL,
    FILM_regista INTEGER NOT NULL,
    FILM_titolo INTEGER NOT NULL,
    PRIMARY KEY (ELENCO_ATTORI_elenco_attori, FILM_regista, FILM_titolo),
    FOREIGN KEY (FILM_regista) REFERENCES FILM(regista),
    FOREIGN KEY (FILM_titolo) REFERENCES FILM(titolo)
);
CREATE TABLE CONTIENE (
    FILM_regista INTEGER NOT NULL,
    FILM_titolo INTEGER NOT NULL,
    SETTORE_CENTRO_SERVIZIO_codice_centro INTEGER NOT NULL,
    SETTORE_codice_settore INTEGER NOT NULL,
    posizione INTEGER NOT NULL,
    quantita INTEGER NOT NULL,
    PRIMARY KEY (FILM_regista, FILM_titolo, SETTORE_CENTRO_SERVIZIO_codice_centro, SETTORE_codice_settore),
    FOREIGN KEY (FILM_regista) REFERENCES FILM(regista),
    FOREIGN KEY (FILM_titolo) REFERENCES FILM(titolo),
    FOREIGN KEY (SETTORE_CENTRO_SERVIZIO_codice_centro) REFERENCES SETTORE(CENTRO_SERVIZIO_codice_centro),
    FOREIGN KEY (SETTORE_codice_settore) REFERENCES SETTORE(codice_settore)
);
CREATE TABLE REMAKE (
    FILM_regista_remake_di INTEGER NOT NULL,
    FILM_titolo_remake_di INTEGER NOT NULL,
    FILM_regista_ha_remake INTEGER NOT NULL,
    FILM_titolo_ha_remake INTEGER NOT NULL,
    PRIMARY KEY (FILM_regista_remake_di, FILM_titolo_remake_di),
    FOREIGN KEY (FILM_regista_remake_di) REFERENCES FILM(regista),
    FOREIGN KEY (FILM_titolo_remake_di) REFERENCES FILM(titolo),
    FOREIGN KEY (FILM_regista_ha_remake) REFERENCES FILM(regista),
    FOREIGN KEY (FILM_titolo_ha_remake) REFERENCES FILM(titolo)
);