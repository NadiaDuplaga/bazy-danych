1.
SELECT nazwa, cena FROM produkty WHERE cena > 200 ORDER BY cena DESC;
2.
SELECT imie, nazwisko, miasto FROM klienci WHERE miasto = 'Wroclaw' OR miasto = 'Poznan';
3.
SELECT nazwa, cena FROM produkty ORDER BY cena LIMIT 10;
4.
SELECT * FROM zamowienia WHERE status = 'anulowane' ORDER BY data_zamowienia DESC;
5.
SELECT * FROM produkty WHERE nazwa LIKE 'P%' ;
6.
SELECT * FROM produkty WHERE ilosc_magazyn < 5 ;
7.
SELECT * FROM klienci WHERE data_rejestracji > CURRENT_DATE - INTERVAL '500 days';
8.
(SELECT * FROM produkty ORDER BY cena LIMIT 5) UNION ALL (SELECT * FROM produkty ORDER BY cena DESC LIMIT 5);