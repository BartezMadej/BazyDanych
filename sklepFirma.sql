CREATE TABLE firma.pracownicy (id_pracownika INT PRIMARY KEY,
                        imie VARCHAR(40) NOT NULL,
                        nazwisko VARCHAR(40) NOT NULL, 
                        adres VARCHAR(50) NOT NULL,
                        telefon VARCHAR(15)
                        );
CREATE TABLE firma.godziny (id_godziny INT PRIMARY KEY,
                    data DATE,
                    liczba_godzin FLOAT(1),
                    id_pracownika INT NOT NULL REFERENCES pracownicy(id_pracownika)
                    );
CREATE TABLE firma.pensja_stanowisko (id_pensji INT NOT NULL PRIMARY KEY,
                                stanowisko VARCHAR(30) NOT NULL,
                                kwota FLOAT(2) NOT NULL
                                );
CREATE TABLE firma.premia(id_premii INT PRIMARY KEY,
                    rodzaj VARCHAR(30),
                    kwota FLOAT(2) NOT NULL
                    );
CREATE TABLE firma.wynagrodzenie (id_wynagrodzenia INT PRIMARY KEY,
                            data DATE,
                            id_pracownika INT NOT NULL REFERENCES pracownicy(id_pracownika),
                            id_godziny INT NOT NULL REFERENCES godziny(id_godziny),
                            id_pensji INT NOT NULL REFERENCES pensja_stanowisko(id_pensji),
                            id_premii INT NOT NULL REFERENCES premia(id_premii)
                            );

CREATE TABLE sklep.producenci (id_producenta INT PRIMARY KEY,
                            nazwa_producenta VARCHAR(50) NOT NULL,
                            mail VARCHAR(30)  NOT NULL,
                            telefon VARCHAR(15)  NOT NULL
                            );

CREATE TABLE sklep.produkty (id_produktu INT PRIMARY KEY,
                        nazwa_produktu VARCHAR(50) NOT NULL,
                        cena FLOAT(2)  NOT NULL,
                        id_producenta INT NOT NULL REFERENCES sklep.producenci(id_producenta)
                        );

CREATE TABLE sklep.zamowienia (id_zamowienia INT PRIMARY KEY,
                            ilosc INT NOT NULL,
                            data date NOT NULL,
                            id_produktu INT NOT NULL REFERENCES sklep.produkty(id_produktu)
                            );
