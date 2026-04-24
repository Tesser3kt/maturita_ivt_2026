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
    - Co jsou a k čemu jsou.
    - Myši
        - technologie myší: mechanická, optická ([video](https://www.youtube.com/watch?v=SAaESb4wTCM&t=534s)), laserová
        - [video o kolečku](https://www.youtube.com/watch?v=-HVKm5fIUA8)
    - Klávesnice
        - technologie klávesnic: membránová, mechanická ([video](https://www.youtube.com/watch?v=h-NM1xSSzHQ))
    - Drivery a řadiče
        - Co jsou a k čemu jsou drivery.
        - Jak drivery fungují (stačí hrubě).
        - Co jsou a k čemu jsou řadiče.
        - Interakce mezi drivery a řadiči (aneb proč nemusí mít každá myš vlastní driver).
5. Tiskárny
    - Co jsou a k čemu jsou.
    - Technologie tiskáren: inkoustové ([video](https://www.youtube.com/watch?v=0PKFQciUWBU)), laserové ([video](https://www.youtube.com/watch?v=WB0HnXcW8qQ)), LED, termální, ...
    - CMYK vs RGB (tj. proč tiskárny nemohou používat RGB).
    - 3D tiskárny: obecný princip a základní technologie (FDM, SLA)
6. Technologie displejů ([obecné video](https://www.youtube.com/watch?v=yxygknX1AiE))
    - Co jsou a k čemu jsou displeje.
    - Trocha historie (CRT).
    - LCD (obecný princip -- [video](https://www.youtube.com/watch?v=96QwqOZ4xjE)) + typy (VA, TN, IPS)
    - OLED (opět, obecný princip), srovnání s LCD
    - Projektory -- LCD a DLP ([video](https://www.youtube.com/watch?v=hWtdxl6viIg))
    - Specifikace displejů z pohledu zákazníka

### Historie
7. Historie počítačů
	- 19. století
	    - první pokusy o automatizaci výpočtů
	    - mechanické stroje (logické operace vykonávají ozubená kola, vačky a pára)
		- **Babbageův diferenční a analytický stroj** 1840
		    - automatický výpočetní stroj pracující v desítkové soustavě
		    - možnost smyček a přeskakování v programu
		    - vstup a výstup pomocí děrných štítků
	    - elektromechanické stroje (relé a další součástky z telegrafů)
		- **Hollerithův statistický stroj** 1890
		    - analogový přístroj pro práci s velkým množstvím dat
		    - využit při sčítání lidu v USA
	- Období 2. světové války
	    - využití logických obvodů v kryptografii (lámání nepřátelských šifer)
	    - výskyt čistě digitálních operací -> ústup od mechanických návrhů -> nástup elektronek
	    - programy většinou nebyly součástí vstupu, ale samotnou konstrukcí stroje (pro změnu funkce se musela měnit propojení mezi součástmi)
		- Britský **Colossus** 1943
		    - stroj velikosti menší haly 
		    - použit při analýze Lorenzovy šifry
		    - program nebyl součástí vstupu
		- Americký **ENIAC** 1943
		    - první plně elektronický design (téměř celý digitální)
		    - původně sloužil k výpočtu balistických tabulek, později našel využití i v programu Manhattan
	- Období studené války
	    - výpočetní technika je snažší ovládat (první programovací jazyky... ) 
	    - rozšiřuje se technologie tranzistoru (stejná funkce jako elektronka, jen jednodušší na provoz)
	    - Navigační počítač programu Apollo **AGC** 1966
		- první počítač jen z integrovaných obvodů (velká investice do technologie, která je užívána dodnes)
		- tranzistor se osvědčil jako spolehlivá a úsporná alternativa
		- díky vysokým nárokům na skladnost a nízkou spotřebu jsme objevili miniaturizační potenciál tranzistoru
	- Osobní počítač
	    - do sedmdesátých let si počítače mohly dovolit jen podniky a univerzity
	    - zvýšená dostupnost čipů umožnila nadšencům experimentovat
	    - vznikají firmy jako **Apple** a **Microsoft**, které rozšiřují myšlenku osobního počítače mezi veřejnost
	    - rozvoj přístupnosti a technické gramotnosti

8. Von Neumannova architektura
    - Co to je konečný automat (finite-state machine) a datová cesta (datapath). Jakým účelům slouží.
    - von Neumannův model
        - základní komponenty (CPU, hlavní paměť, I/O), jejich účel a funkce
        - zápis počítačového programu jako posloupnosti instrukcí v hlavní paměti
        - anatomie von Neumannova počítače
    - kódování CPU instrukcí (princip instrukčních sad)

### Práce s daty
9. Operační systémy
    - Co to je a k čemu to je.
    - Jádro (kernel) operačního systému jako prostředník mezi aplikacemi a hardwarem.
        - procesy,
        - interrupt signály (software i hardware),
        - drivery.
    - Strategie rozdělení výpočetní síly a paměti (time-sharing vs. real-time).
10. Souborové systémy
    - Co to je a k čemu to je.
    - Pár základních typů souborových systémů (EXT4, NTFS, APFS, BTRFS, ...) a jejich využití + klady/zápory.
    - Vrstvy souborového systému:
        - logická (vidí uživatel -- soubory, složky atd.),
        - virtuální (simulace změn pro odhalení potenciálních problémů),
        - fyzická (skutečná interakce s exterím úložištěm přes drivery).
    - Organizace dat na disku:
        - oddíly (partitions) a svazky (volumes),
        - data a metadata,
        - soubory a složky.
    - Fragmentace a defragmentace.
11. Komprese
    - Co to je komprese. Co komprimujeme a proč.
    - Ztrátová a bezztrátová komprese, princip a rozdíly (např. algoritmus vs. nedokonalost zraku).
    - Bezztrátová:
        - Run-length komprese a strom priorit.
        - Způsob reprezentace obrázku, zvuku a videa na počítači.
        - Aspoň jeden bezztrátový formát obrázku a zvuku. Co bezztrátové video?
    - Ztrátová:
        - Obecný princip.
        - Příklady ztrátové komprese obrázku a zvuku.
        - Ztrátová komprese videa (prostorová vs. časová), rozdíl mezi data containerem a kodekem.
        - Aspoň jeden ztrátový formát obrázku a zvuku a jeden ztrátový kodek videa.

### Počítačové sítě, internet
12. Topologie počítačových sítí, typy počítačových sítí
	- Topologie = rozložení (zařízení v síti)
	- Různé topologie mají různé vlastnosti (výhody a nevýhody) - neexistuje one-fits-all síť
	- Hlavní kritéria pro výběr:
		- Přístupnost/dostupnost - cena zavedení/rozšíření
		- Robustnost - stabilita sítě (více možných propojení), obtížnost debuggingu a údržby
		- Bezpečnost
		- Výkon
	- Typy rozložení:
		- BUS (sběrnice) - všechna zařízení sdílí jeden komunikační prostředek (jeden kabel/hub)
			+ extrémně jednoduchý setup
			+ lehké rozšíření
			- s počtem zařízení klesá propustnost 
			- broadcasting (potenciál pro nižší bezpečnost)
		- STAR - komunikace přes "chytrý" server (switch - pamatuje si adresy klientů a poskytuje připojení)
			+ jednodušše škálovatelná topologie
			+ bezpečnější (ovládnout switch je složitější, než kabel/hub)
			- má single point of failure (stejně jako BUS)
			- switch je investice
		- MESH - každé zařízení má separátní připojení s každým dalším
			+ extrémní robustnost (žádný single point of failure)
			+ vysoká bezpečnost (možnost rozkouskovat data a posílat je různými cestami)
			- složitě škálovatelné 
			- vysoké náklady
		- RING - uzavřený daisy chain zařízení (každé zařízení má dvě připojení) - jednosměrná komunikace, využívá token pro organizaci přístupu
			+ token je cool
			+ netrpí s vyšším počtem zařízení (jako BUS)
			- úplně všechno v této síti je single point of failure
			- částečný broadcasting
	- Hybridní topologie - kombinace různých výše zmíněných topologií
		- TREE - sběrnice mezi mezi switchy
		- extended STAR - hvězdičky mezi hvězdičkami
		- STAR-RING - RING mezi STAR topologiemi
13. Schéma TCP/IP, protokoly a IP adresy
    - Co je a k čemu je protokol. Základní příklady.
    - Důležité části jakéhokoliv protokolu.
    - Příklady protokolů v počítačových sítích.
    - Schéma modelů ISO/OSI, specificky model TCP/IP
        - aplikační vrstva (HTTP(S), SSH, NTP, FTP, SMTP, ...),
        - transportní vrstva (TCP a UDP, porty),
        - síťová vrstva (IP a IP adresa),
        - fyzická vrstva (Ethernet a MAC adresa).
14. Internet – vývoj internetu, architektura, služby
    - Co jsou a k čemu jsou internety?
    - Webové stránky (jak fungují, HTTP protokol, princip requestu).
    - E-mail (jak funguje, SMTP pro odesílání, POP nebo IMAP pro přijímání).
    - Přenos audia a videa po internetu (protokoly VoIP nebo IM).
    - Domain Name System
        - Co to je a k čemu to je.
        - Co tvoří jméno domény a jak se podle něj zjistí IP adresa serveru.

### Programování
15. Počítačový program, programovací jazyk
    - programovat = donutit počítač automatizovaně vykonávat práci
    - procesor umí zpracovat jen strojový kód (data i instrukce v binární formě (shoutout Von Neumann)), takto je nemožné programovat přehledně a efektivně
    - vznikají programovací jazyky, které jsou bližší lidské komunikaci, ale stále přímo přeložitelné do strojových instrukcí
    - řadíme je na jistý "level" podle podobnost strojovému kódu
        - low-level jazyk bude spíš podobný strojovému kódu (přesně přeložitelný s vyšší obtížností vývoje)
        - high-level jazyk bude spíš podobný lidskému jazyku/angličtině (usnadňuje vývoj na úkor procesu překladu)
    - programovací jazyky se od těch lidských liší hlavně skladbou a vztahem slov k významu:
        - syntaxe (struktura/gramatika) musí být přísně dodržena 
            - programovací jazyky na ni staví mnohem víc, než ty lidské
            - naštěstí je poměrně jednoduché automatizovaně hledat chyby
        - semantika (význam slov a spojení) je větší problém
            - syntakticky správný program nemusí být semanticky správný
            - je velice komplikované automatizovaně zjišťovat nejasnosti
    - při programování můžeme aplikovat různé přístupy (paradigmata):
        - imperativní programování = způsob popisu postupu, kdy kód přesně ovládá proud průběhu programu (dayumn)
            - procedurálně (kód organizujeme v procedury)
            - objektově orientované (kód organizujeme do objektů - třeba tříd)
        - deklarativní programování = způsob psaní, kde kód popisuje vlastnosti výsledku, ale nikoli detailní postup
            - funkcionální programování (postup udává řada funkcí)
            - logické programování (postup udává řada logických hádanek)
    - pár příkladů programovacích jazyků:
        - ASSEMBLY 
            - historicky první snaha o zjednoduššení programování
            - programátor píše přímo v instrukcích daného procesoru (překlad do strojového kódu je jednoduchý, ale procesory s různou instrukční sadou mají i odlišné assembly (s tím pomáhá standardizace))
            - assembly nepřináší žádnou úrověň abstrakce (pořád píšeme vlastně strojový kód, jen za využití jiných znaků než jsou 1 a 0)
        - C
            - komplexnější překladač (compiler) umožňuje využití abstraktnějších operací
            - stejný zdrojový kód může být přeložen pro víc instrukčních sad (to je práce compileru)
            - C je jazyk, který stále umožňuje vysokou kontrolu nad procesem (low-level imperativní/procedurální)
        - Python
            - vysoce abstraktní jazyk s přístupnou syntaxí (dobře srozumitelný kód, který je stále přeložitelný duh)
            - je interpretovaný (nekompiluje se - distribuuje se přímo zdrojový kód, který se překládá za průběhu)
            - python je high-level jazyk - vysoká úrověň abstrakce nám umožňuje uplatnit mnoho způsobů řešení úlohy (za cenu low-level přístupu) 

16. Algoritmizace úlohy, vlastnosti algoritmu, flowchart
    - Co je a k čemu je algoritmus.
    - Základní vlastnosti algoritmu (jednoznačnost, konečnost atd.).
    - Flowchart + příklady.
    - Techniky tvorby algoritmů:
        - rekurse,
        - rozděl a panuj,
        - hladovost,
        - backtracking,
        - dynamické programování.
17. Základní programové a datové struktury, třídící algoritmy
    - K čemu jsou datové struktury.
    - Základní operace na datových strukturách (přidání, odebrání, vyhledání atd.).
    - Typy datových struktur:
        - pole,
        - seznam,
        - zásobník a fronta,
        - hash table,
        - binární strom.
18. Vývoj aplikací (IDE, debugging, kompilace)
    - Co je a k čemu je IDE. Jeho části.
    - Textový editor
        - plain text vs. rich text,
        - příklady funkcí.
    - Debugger
        - základní funkce,
        - způsob fungování (debug symboly, breakpointy, ...),
    - Kompilátor
        - single-pass vs. multi-pass,
        - princip fungování + stádia překladu
            - front end (kontrola syntaxe a typů, mezijazyk),
            - middle end (CFG a call graph, optimalisace),
            - back end (překlad do CPU instrukcí, následná optimalisace pro dané CPU a generování strojového kódu).
19. Umělá inteligence
    - Co to je a k čemu to je.
    - Typy umělé inteligence podle užití (narrow, general, super).
    - Princip umělé nervové sítě (forward a backward propagation).
    - Míra úspěšnosti při kategorisaci: ztráta vs. přesnost
        - ztráta = průměr součtů intensit nesprávných neuronů napříč testovacími vzorky
        - přesnost = procentuální podíl správných odpovědí napříč testovacími vzorky
    - Metody učení:
        - Supervised Learning: základní metoda učení, správnost výstupu je dokonale měřitelná
          - aktualisace váhových funkcí na základě ztráty v průběhu mnoha generací
        - Unsupervised Learning: správnost výstupu je měřitelná jen relativně (vzhledem k předchozím či lidským výstupům)
          - rozdělení procesu na menší procesy s lepší měřitelností úspěchu
          - heuristika
          - generační učení přirozeným výběrem
        - Reinforcement Learning:
          - princip trestů a odměn
          - Exploration-Exploitation dilemma
    - Příklady využití umělé inteligence.

### Web
20. HTML, CSS, JavaScript
    - Co to jsou za věci a k čemu jsou.
    - Role HTML, CSS a JS při výrobě stránky (ve smyslu: HTML je layout, CSS je vzhled, JS je interakce s uživatelem).
    - Základní HTML tagy: html, head, title, body, header, footer, div, p, a, ul, li, img, form, input, label, select, button.
    - Základní CSS pravidla (a umět je použít):
        - zacílení na prvek stránky podle tagu, id nebo třídy
        - position: static | relative | absolute | fixed,
        - okraje (margin / padding),
        - šířka a výška (width / height, min-width / min-height, max-width / max-height),
        - pozadí (background-color/size/position/image),
        - vlastnosti textu (font-family/size/weight, color, text-align),
        - rám (border-color/size/style),
        - display: block | flex | grid (hodně důležité!)
            - umět rozmístit věci ve flexu (na střed, s rovnoměrnými mezerami atd.) a v gridu (do daného počtu sloupců)
    - JavaScript DOM (tj. jak vidí JS stránku)
        - zacílení na konkrétní prvek stránky podle tagu, id, třídy,
        - změna základních vlastností prvku stránky
21. Frameworky –- JavaScript (React)
    - Co to je JS framework a k čemu je.
    - Princip komponent a vykreslování stránky pomocí JavaScriptu.
        - Co to je a k čemu je komponenta.
        - JSX syntax -- co povoluje a co ne, celkově idea kusu stránky jako návratové hodnoty funkce.
        - kořenový prvek (v Reactu div id="root", kam React loaduje obsah stránky),
        - reload jednotlivých komponent na základě změny hodnoty proměnné (pořádně vysvětlit, jak tohle funguje),
        - hooky (jako třeba `useState` v Reactu nebo `ref` ve Vue).
22. Backend –- Python (Flask)
    - Backend vs. frontend
    - Princip routování podle cesty a šablon
    - Jinja2 (Flaskové) šablony a základní funkce

### Zbytek
23. Licence, etika, zákony, hygiena
    - Open source vs. closed source.
    - Problémy s licencováním softwaru.
    - Open source licence jako Adobe CC, GPL atd.
    - Typy closed source licencí.
    - Jak se zákony stavějí k licencím softwaru.
    - Pár etických vodítek.
24. Grafika, modely barev, barevná schémata
    - Rastrová grafika: representace obrázku jako mřížky pixelů
        - RGB a CMYK (popis, rozdíly, použití),
        - HSL a HSV ("lidská" representace barev, princip)
        - YUV (striktní oddělení barevné a světelné složky, komprese)
    - Vektorová grafika: representace obrázku jako množiny geometrických objektů (křivek, polygonů, ...)
25. Tabulkové kalkulátory (prostě Excel)
    - Co to je a k čemu to je.
    - Schopnost ovládat Excel
        - absolutní a relativní odkaz na buňky
        - umět hledat, použít a nořit funkce
        - podmínky

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
5. Určete výstupy logického obvodu pro zadaný vstup.
6. Nakreslete diagram HDD (disk, čtecí hlava, sektory...) a vysvětlete na něm princip funkce zařízení. 
7. Nakreslete diagram optické myši a vysvětlete na něm princip funkce zařízení.
8. Nakreslete diagram klávesnice (membránové/mechanické) a vysvětlete na něm princip funkce zařízení.
9. Nakreslete diagram tiskárny (laserové/inkoustové) a vysvětlete na něm princip funkce zařízení.
10. Nakreslete diagram LCD panelu a vysvětlete na něm princip funkce zařízení.
11. Nakreslete diagram DLP projektoru a vysvětlete na něm princip funkce zařízení.

### Historie počítačů

12. Napište kód (pseudokód, Python, ...) implementující zadaný diagram datové cesty a řídící FSM.
13. Nakreslete diagram datové cesty a řídící FSM odpovídající zadanému kusu kódu v Pythonu.

### Operační systém

14. Uložte danou posloupnost dat (representující obrázek či audio) i s hlavičkou podle zadání.
15. Defragmentujte daný blok paměti podle zadání.
16. Zkomprimujte daný soubor (obrázek či audio) run-length kompresí či (Huffmanovým) stromem priorit.

### Počítačové sítě, internet

17. Navrhněte topologii počítačové sítě podle zadaných kritérií.

### Programování

18. Nakreslete flowchart daného programu v Pythonu.
19. Přepiště zadaný flowchart do libovolného programovacího jazyka.
20. Implementujte uvedenou metodu spojového seznamu.
21. Debuggujte zadaný program.

### Web

22. Vyrobte webovou stránky podle obrázkové předlohy.
23. Doplňte jistou funkci Flask aplikace podle zadání.

### Zbytek

24. Vyřešte zadanou úlohu v Excelu (nějaká základní statistika z obsahu buněk).
