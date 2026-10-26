1.Wyświetl listę zamówień (id, data, status) razem z imieniem i nazwiskiem klienta.
SELECT z.id, z.data_zamowienia, z.status, k.imie, k.nazwisko FROM zamowienia z JOIN klienci k ON z.klient_id = k.id;
2.Dla każdej kategorii wyświetl średnią cenę produktów w tej kategorii (GROUP BY, AVG).
SELECT k.nazwa, AVG(p.cena) FROM produkty p JOIN kategorie k ON p.kategoria_id = k.id GROUP BY k.id, p.kategoria_id;
3.Wyświetl 5 klientów, którzy wydali najwięcej łącznie (suma ilosc * cena_jednostkowa po wszystkich ich zamówieniach).
SELECT k.id, k.imie, k.nazwisko, SUM(p.ilosc * p.cena_jednostkowa) FROM klienci k JOIN zamowienia z ON k.id = z.klient_id JOIN pozycje_zamowien p ON z.id = p.zamowienie_id GROUP BY k.id, k.imie, k.nazwisko ORDER BY SUM(p.ilosc * p.cena_jednostkowa) DESC
LIMIT 5;
4.Wyświetl kategorie, w których jest więcej niż 5 produktów (HAVING).
SELECT k.nazwa, COUNT(p.id) FROM kategorie k JOIN produkty p ON k.id = p.kategoria_id GROUP BY k.id, k.nazwa HAVING COUNT(p.id) > 5;
5.Wyświetl produkty, które nigdy nie zostały zamówione (podpowiedź: LEFT JOIN + WHERE ... IS NULL, albo NOT IN).
SELECT p.nazwa FROM produkty p LEFT JOIN pozycje_zamowien z ON p.id = z.produkt_id WHERE z.produkt_id IS NULL;
6.Wyświetl liczbę zamówień per status (GROUP BY status).
SELECT status, COUNT(*) FROM zamowienia GROUP BY status;
7.Znajdź pracownika, który obsłużył najwięcej zamówień.
SELECT p.*, COUNT(z.id) AS ilosc FROM pracownicy p JOIN zamowienia z ON p.id = z.pracownik_id GROUP BY p.id ORDER BY ilosc DESC LIMIT 1;
8.Wyświetl liczbę zamówień złożonych przez każdego klienta, łącznie z klientami, którzy nie mają żadnego zamówienia (LEFT JOIN + COUNT, pomyśl czy liczyć z.id czy kl.id).
SELECT k.*, COUNT(z.id) AS ilosc FROM klienci k LEFT JOIN zamowienia z ON k.id = z.klient_id GROUP BY k.id;
9.Wyświetl 5 kategorii z najwyższą łączną wartością sprzedaży (suma ilosc * cena_jednostkowa po produktach z danej kategorii, przez pozycje_zamowien → produkty → kategorie).
SELECT k.*, SUM(z.ilosc * z.cena_jednostkowa) AS wartosc FROM pozycje_zamowien z
JOIN produkty p ON p.id = z.produkt_id
JOIN kategorie k ON k.id = p.kategoria_id
GROUP BY k.id
ORDER BY wartosc DESC LIMIT 5;
10.Wyświetl produkty droższe niż średnia cena w obrębie własnej kategorii (nie globalna średnia — dla każdej kategorii osobno).
SELECT p.nazwa, k.nazwa AS kategoria, p.cena
FROM produkty p
JOIN kategorie k ON k.id = p.kategoria_id
WHERE p.cena > (SELECT AVG(p2.cena)
FROM produkty p2
WHERE p2.kategoria_id = p.kategoria_id)
ORDER BY k.nazwa, p.cena DESC;
11.Wyświetl klientów, którzy nigdy nie złożyli zamówienia.
SELECT k.* FROM klienci k LEFT JOIN zamowienia z ON k.id = z.klient_id WHERE z.id IS NULL;
12.Wyświetl łączną liczbę sprzedanych sztuk per kategoria (przez trzy złączone tabele: pozycje_zamowien, produkty, kategorie).
SELECT k.nazwa, SUM(pz.ilosc) AS sprzedane_sztuki
FROM pozycje_zamowien pz
JOIN produkty p ON p.id = pz.produkt_id
JOIN kategorie k ON k.id = p.kategoria_id
GROUP BY k.id, k.nazwa
ORDER BY sprzedane_sztuki DESC;
13.Wyświetl pracowników, którzy obsłużyli mniej zamówień niż wynosi średnia liczba zamówień na pracownika — uwzględnij też tych, którzy nie obsłużyli żadnego (LEFT JOIN + HAVING + podzapytanie z AVG).
SELECT pr.id, pr.imie, pr.nazwisko, COUNT(z.id) AS obsluzone
FROM pracownicy pr
LEFT JOIN zamowienia z ON z.pracownik_id = pr.id
GROUP BY pr.id, pr.imie, pr.nazwisko
HAVING COUNT(z.id) < (SELECT AVG(ile)
FROM (SELECT COUNT(z2.id) AS ileFROM pracownicy p2LEFT JOIN zamowienia z2 ON z2.pracownik_id = p2.idGROUP BY p2.id) AS t)
ORDER BY obsluzone;
14.Wyświetl 3 produkty najczęściej kupowane, licząc liczbę wystąpień w pozycje_zamowien (nie sumę wartości sprzedaży).
SELECT p.id, p.nazwa, COUNT(*) AS ile_razy
FROM pozycje_zamowien pz
JOIN produkty p ON p.id = pz.produkt_id
GROUP BY p.id, p.nazwa
ORDER BY ile_razy DESC
LIMIT 3;