# Maturita z IVT 2024/25

## Co tu je?
- seznam maturitních okruhů IVT 2024/25 ([vypsaný zde](#maturitní-okruhy))
- složky s materiály k okruhům

----------------------------

## Maturitní okruhy
*Součástí každé teoretické otázky jsou dva praktické úkoly. Jeden těžký s
domácí přípravou, jeden lehký při zkoušce závislý na vylosovaném tématu.
Vzorová zadání lehkých úloh budou postupně přibývat [zde](#lehké-úlohy).*

**Následující seznam bude postupně doplňován o detaily k teoretickým úlohám a o
zadání lehkých úloh podle objemu probrané látky.**

### Hardware
1. Data, informace, bit, byte. Číselné soustavy – převody a početní operace
    - Co je datum. Co je informace. Příklady.
    - Vlastnosti, které dělají z data informaci.
    - Cyklus zpracování dat: vstup --> zpracování --> výstup. Příklady.
    - Datové jednotky počítače: bit, byte, slovo.
    - Číselné soustavy: hlavně dvojková, osmičková, šestnáctková. Příklady použití.
    - Základní aritmetické operace v číselných soustavách.
    - Převod desítková <--> dvojková/osmičková/šestnáctková.
    - *Něco jsem zapomněl/přidal navíc/špatně napsal? Opravte to.*
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
    - Magnetické paměti:
        - Kazety 
        - Diskety
        - HDD
    - Optické paměti:
        - CD
        - DVD
        - Blu-ray
    - Flash paměti:
        - Co je flash paměť.
        - SSD
        - USB Flash
            - Sushiusb
        - SD karty

    U každého typu paměti znát princip funkce a průběh záznamu dat.
4. I/O zařízení
    - Co jsou a k čemu jsou.
    - Pár základních způsobů připojení (USB, PS-2, Jack atd.).
    - Myši
        - technologie myší: mechanická, optická, laserová (podrobný popis a rozdíly),
        - různé tvary myší (výhody / nevýhody).
    - Klávesnice
        - technologie klávesnic: membránová, mechanická (podrobný popis a rozdíly)
        - různé tvary klávesnic (výhody / nevýhody)
    - Drivery a řadiče
        - Co jsou a k čemu jsou drivery.
        - Jak drivery fungují (jen zevrubně).
        - Co jsou a k čemu jsou řadiče.
        - Interakce mezi drivery a řadiči (aneb proč nemusí mít každá myš vlastní driver).
5. Tiskárny (Pro spravne zobrazeni prezentace pouzijte Okular nebo Adobe Acrobat)
    - tisknou
    - inkoustové
    - laser
    - proč CMYK?????????????????????????????????????????????????????????
    - 3D tisk
    - FDM
    - SLA
6. Technologie displejů
    - Historie (CRT)
    - LCD + technologie (VA, TN, IPS)
    - OLED
    - E-Ink
    - Projektory -- LCD, DLP
    - Důležité specifikace displejů

   Rozumět principu funkce každé displejové i projektorové technologie.
### Historie
7. Historie počítačů
    - Abstraktní definice počítače, teoretické modely počítačů.
    - Popis funkce Turingova stroje.
    - Typy počítačů: analogové, digitální
      - Co jsou a jaké mají výhody / nevýhody analogové počítače.
      - Příklady využití analogových počítačů.
      - Co jsou a jaké mají výhody / nevýhody digitánlí počítače.
      - Příklady využití digitálních počítačů.
    - Pár milníků historie počítačů (data jsou wtv, stačí přibližně):
      - děrné štítky (jak zevrubně fungují),
      - Turingův stroj,
      - transistor,
      - první programovací jazyk (COBOL),
      - mikroprocesor,
      - UNIX,
      - World Wide Web
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
    - Jádro operačního systému (prostředník mezi aplikacemi a hardware).
      - procesy,
      - interrupt signal (softwarový, hardwarový),
      - drivery.
    - Rozdělení výpočetní síly a paměti (time-sharing vs. real-time).
10. Souborové systémy
    - Co to je a k čemu to je.
    - Pár základních typů souborových systémů (EXT4, NTFS, APFS) a jejich využití.
    - Vrstvy souborového systému:
      - logická (tu vidí uživatel a aplikace -- soubory, složky, ...),
      - virtuální (simulace změn pro odhalení potenciálních problémů),
      - fyzická (interakce s externím úložištěm).
    - Organizace dat na disku:
      - oddíly,
      - data a metadata,
      - soubory a složky.
    - Fragmentace a defragmentace (podrobný popis problému).
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
    - Kritéria pro porovnávání sítí:
        - Cena zavedení (primárně počet kabelů a pravidelná údržba),
        - Spolehlivost (jak ovlivňují chybná spojení chod celé sítě)
        - Složitost rozšíření (přidání nových zařízení do sítě)
        - Zabezpečení (v některých sítích se snáz rozdělují zprávy na více
        kusů, což zvyšuje bezpečnost)
    - Jednotlivé sítě a jejich výhody:
        - MESH
        - BUS
        - STAR
        - RING
        - TREE
    - Znát typické oblasti využití každé topologie a schopnost navrhnout
    topologii sítě na základě daných požadavků.
13. Schéma TCP/IP, protokoly a IP adresy
    - Co je a k čemu je protokol? Jednoduché příklady.
    - Důležité části jakéhokoliv protokolu.
    - Příklady protokolů v počítačových sítích.
    - Model OSI, specificicky model TCP/IP
      - aplikační vrstva (protokoly HTTP a HTTPS, SSH, NTP, FTP, SMTP, ...).
      - transportní vrstva (protokoly TCP a UDP -- porty),
      - síťová vrstva (protokol IP -- IP adresa),
      - fyzická vrstva (protokol Ethernet -- MAC adresa).
14. Internet – vývoj internetu, architektura, služby
    - Co je a k čemu je internet?
    - Webové stránky (jak fungují, HTTP protokol, princip requestu).
    - E-mail (jak funguje, SMTP pro odesílání, POP nebo IMAP pro přijímání).
    - Přenos audia a videa po internetu (protokoly jako VoIP nebo IM).
    - Domain Name System
      - Co to je a k čemu to je.
      - Jak se tvoří jméno domény a jak se podle něj najde IP adresa serveru.

### Programování
15. Počítačový program, programovací jazyk
    - Co je počítačový program.
    - Co je a k čemu je programovací jazyk.
    - Syntax a sémantika, rozdíly s lidskými jazyky.
    - Rozdělení programovacích jazyků podle
      - úrovně (high-level, low-level, machine code) + funkční rozdíly mezi úrovněmi + příklady konkrétních jazyků,
      - způsobu překladu (kompilované vs. interpretované) + výhody a nevýhody každého způsobu,
      - zápisu příkazů (procedurální vs. funkcionální) + princip obou zápisů + příklady.
16. Algoritmizace úlohy, vlastnosti algoritmu, flowchart
    - Co je a k čemu je algoritmus.
    - Základní vlastnosti algoritmu.
    - Časová a prostorová složitost.
    - Flowchart + příklady.
    - Programátorské techniky (ke každé vysvětlení + příklady):
      - rekurse,
      - rozděl a panuj (DaC -- divide and conquer),
      - hladovost,
      - backtracking,
      - dynamické programování.
17. Základní programové a datové struktury, třídící algoritmy
    - K čemu jsou datové struktury.
    - Základní operace na datových strukturách.
    - Typy datových struktur (ke každé vysvětlení + příklad využití):
      - pole,
      - seznam,
      - záznam,
      - hash table,
      - binární (vyhledávací) strom,
      - zásobník a fronta.
18. Vývoj aplikací (IDE, debugging, kompilace)
    - Co je a k čemu je IDE, jeho části.
    - Textový editor -- co je a k čemu je.
      - plain text vs. rich text,
      - příklady základních a pokročilých funkcí.
    - Debugger -- co a k čemu.
      - základní funkce,
      - princip fungování (debug symbols, breakpointy, krokování, čtení a zápis za běhu programu),
    - Kompilátor -- co a k čemu.
      - single pass vs. multi pass + výhody a nevýhody,
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
        - zacívývoje lení na prvek stránky podle tagu, id nebo třídy
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
        - hooky
22. Backend –- Python (Flask)

### Zbytek
23. ~~Licence, etika, zákony, hygiena~~ **NEBUDE**
24. Grafika, modely barev, barevná schémata
    - Rastrová grafika: representace obrázku jako posloupnosti pixelů
        - Barevná schémata: representace jednotlivých pixelů obrázku
            - RGB a CMYK (popis, rozdíly, použití)
            - HSL ("lidská" representace barev)
            - YUV (oddělení barevné a světelné složky, komprese)
    - Vektorová grafika: representace obrázku jako množiny křivek v rovině
    - Schopnost ovládat grafický editor (ukazovali jsme si Photoshop, ale můžete použít, co chcete, GIMP bude nainstalovaný taky)
        - princip vrstev a masek
        - základní nástroje: výběr, štětec, guma, gradient, color picker atd.
25. ~~Textové editory~~ **NEBUDE**
26. Tabulkové kalkulátory
    - Co to je a k čemu to je.
    - Schopnost ovládat Excel (specificky 1993 :smirk:)
        - absolutní a relativní odkaz na buňku
        - umět hledat, použít a nořit funkce
        - podmínky
27. Trollení ( :yum: )

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
