# Maturita z IVT 2025/26

## Co tu je?
- seznam maturitních okruhů IVT 2025/26 ([vypsaný zde](#maturitní-okruhy))
- složky s materiály k okruhům

----------------------------

## Maturitní okruhy
*Součástí každé teoretické otázky jsou dva praktické úkoly. Jeden těžký s
domácí přípravou, jeden lehký při zkoušce závislý na vylosovaném tématu.
Vzorová zadání lehkých úloh budou postupně přibývat [zde](#lehké-úlohy).*

**Následující seznam bude postupně doplňován o detaily k teoretickým úlohám a o
zadání lehkých úloh podle objemu probrané látky.**

**Něco jsem zapomněl/přidal navíc/špatně napsal? Opravte mě.**

### Hardware
1. Data, informace, bit, byte. Číselné soustavy – převody a početní operace
    - Co je datum. Co je informace. Příklady.
    - Vlastnosti, které dělají z data informaci.
    - Cyklus zpracování dat: vstup --> zpracování --> výstup. Příklady.
    - Datové jednotky počítače: bit, byte, slovo.
    - Číselné soustavy: hlavně dvojková, osmičková, šestnáctková. Příklady použití.
    - Základní aritmetické operace v číselných soustavách.
    - Převod desítková <--> dvojková/osmičková/šestnáctková.
2. Hardware – základní deska, CPU, vnitřní paměti
    - CPU 
        - FDE (Fetch, Decode, Execute) cyklus
        - Co je registr. **CIR** (Current Instructions Register), **PC** (Program Counter)
        - Pamětové instrukce:
          - ALLOCATE
          - STORE
          - LOAD
        - Řídící instrukce:
          - JUMP
          - JUMP-IF
        - Počítací instrukce:
          - ADD
          - COMPARE
        - Co je logická brána. Poznat (a umět vysvětlit fyzikální princip) brán **OR**, **AND**, **NOT** a **NAND**.
        - Znát princip funkce základních logických obvodů (paměť a sčítač) -- odkaz [zde](https://circuitverse.org/users/259770/projects/basic-circuits-1a38e0ec-9ab0-475b-8abc-fa5c2e89c707).
    - Vnitřní paměť
        - Volatilní vs. nevolatilní paměť
        - Rozdíl mezi **SRAM** a **DRAM**, znát některé typy nevlatilních pamětí (**NVRAM**, **ROM**).
        - Použití volatilních a nevolatilních pamětí
    - Základní deska
        - Co je a k čemu je.
        - Popis důležitých částí
3. Externí paměť (HDD, SSD, CD, DVD, kazety, diskety), záznam dat
    - Historie
	- první nevolatilní média: "punchcards" a "punchtape" -- ručně/strojově ražené díry v papíru
	- první implementace magnetického zápisu dat - ze začátku sekvenční, později pokusy o náhodný přístup (válec)
    - Typy energeticky nezávislé paměti dnes:
	- **HDD** (pevný disk) - moderní využití magnetizace k uchování dat
		- Součásti:
			- Plotny - pevné disky s vrstvou lehce magnetizovatelného materiálu
			- Hlavy - zařízení pro precizní detekci změny magnetického pole a jeho tvorby (čtení a zápis na disk)
			- Rameno - aktuátor - motor = mechanická zařízení
			- Obvodová deska - decoding a "hodiny"
		- Organizace dat (geometrie disku):
			- Stopy = soustředné kružnice
			- Sektor = nejmenší adresovatelná jednotka disku
		- Vlastnosti:
			- vysoká kapacita za nízkou cenu
			- dostatečná rychlost i pro náročnější aplikace (jako např. systém)
			- náchylnost k mechanickému poškození
	- **Optická úložiště** (CD/DVD/Blu-ray) - podobný setup jako u disket, jen místo magnetismu využíváme fyzické prohlubně
		- Popis:
			- disk má prohlubně a vyvýšeniny, které jinak lámou světlo
			- jejich obsah čteme odrazem laseru
			- CD, DVD a Blu-ray se liší barvou laseru a hustotou zápisu
		- Data:
			- rozlišujeme mezi **ROM** (read only), **WORM** (write once, read many) a přepsatelnými disky
		- Vlastnosti:
			- perfektní médium pro distribuci a archivaci dat (levná výroba a vysoká trvanlivost)
			- pomalý provoz + omezená možnost zápisu 
	- **Flash paměť** - nevolatilní paměť bez mechanických čáští (pouze obvody)
		- Flash paměť je velký soubor "buněk" = FGMOS (tranzistor s plovoucím hradlem - s nastavitelným hraničním napětím - lehce změřitelná hodnota, která přežije i bez přívodu proudu)
		- Vlastnosti:
			- vysoká rychlost
			- mechanická výdrž
			- omezený počet přepisů
			- vysoká cena
    - Volba typu úložiště záleží na aplikaci

4. I/O zařízení
5. Tiskárny (Pro spravne zobrazeni prezentace pouzijte Okular nebo Adobe Acrobat)
6. Technologie displejů

### Historie
7. Historie počítačů
8. Von Neumannova architektura

### Práce s daty
9. Operační systémy
10. Souborové systémy
11. Komprese

### Počítačové sítě, internet
12. Topologie počítačových sítí, typy počítačových sítí
13. Schéma TCP/IP, protokoly a IP adresy
14. Internet – vývoj internetu, architektura, služby

### Programování
15. Počítačový program, programovací jazyk
16. Algoritmizace úlohy, vlastnosti algoritmu, flowchart
17. Základní programové a datové struktury, třídící algoritmy
18. Vývoj aplikací (IDE, debugging, kompilace)
19. Umělá inteligence

### Web
20. HTML, CSS, JavaScript
21. Frameworky –- JavaScript (React)
22. Backend –- Python (Flask)

### Zbytek
23. Licence, etika, zákony, hygiena
24. Grafika, modely barev, barevná schémata
25. Textové editory
26. Tabulkové kalkulátory

----------------------------

## Lehké úlohy

### Hardware

1. Sečtěte/odečtěte dvě čísla v dvojkové/osmičkové/šestnáctkové soustavě.
   Postup vysvětlete.
2. Převeďte číslo z dvojkové/osmičkové/šestnáctkové soustavy do soustavy
   desítkové. Postup vysvětlete.
3. Převeďte číslo z desítkové soustavy do soustavy
   dvojkové/osmičkové/šestnáctkové. Postup vysvětlete.
4. Zapojte základní komponenty PC (CPU a RAM) do základní desky a spusťte jej.
5. Ze zadané logické formule sestrojte logický obvod.
6. Napište logickou formuli odpovídající zadanému logickému obvodu.
7. Určete výstupy logického obvodu pro zadaný vstup.
8. Nakreslete diagram HDD (disk, čtecí hlava, sektory...) a vysvětlete na něm princip funkce zařízení. 
9. Nakreslete diagram optické myši a vysvětlete na něm princip funkce zařízení.
10. Nakreslete diagram klávesnice (membránové/mechanické) a vysvětlete na něm princip funkce zařízení.
11. Nakreslete diagram tiskárny (laserové/inkoustové) a vysvětlete na něm princip funkce zařízení.
12. Nakreslete diagram LCD panelu a vysvětlete na něm princip funkce zařízení.
13. Nakreslete diagram DLP projektoru a vysvětlete na něm princip funkce zařízení.

### Historie počítačů

14. Napište kód (pseudokód, Python, ...) implementující zadaný diagram datové cesty a řídící FSM.
15. Nakreslete diagram datové cesty a řídící FSM odpovídající zadanému kusu kódu v Pythonu.

### Operační systém

16. Uložte danou posloupnost dat (representující obrázek či audio) i s hlavičkou podle zadání.
17. Defragmentujte daný blok paměti podle zadání.
18. Zkomprimujte daný soubor (obrázek či audio) run-length kompresí či (Huffmanovým) stromem priorit.

### Počítačové sítě, internet

19. Navrhněte topologii počítačové sítě podle zadaných kritérií.

### Programování

20. Nakreslete flowchart daného programu v Pythonu.
21. Přepiště zadaný flowchart do libovolného programovacího jazyka.
22. Implementujte uvedenou metodu spojového seznamu či hashovací funkci.
23. Debuggujte zadaný program.

### Web

24. Vyrobte webovou stránky podle obrázkové předlohy.
25. Doprogramujte nějakou základní funkcionalitu do Reactové aplikace.
26. Nějaká Flask věc. **TODO**

### Zbytek

27. Vyrobte zadaný obrázek ve Photoshopu (použité vrstvy budete mít ve složce).
28. Vyřešte zadanou úlohu v Excelu (nějaká základní statistika z obsahu buněk).
