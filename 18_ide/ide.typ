#import "@preview/touying:0.6.1": *
#import themes.dewdrop: *

// Czech Language
#set text(
  lang: "cs"
)

// Global Config
#show: dewdrop-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  navigation: "mini-slides",
  mini-slides: (
    section: false,
    subsection: false,
    x: 2em,
    height: 3em
  ),
  config-common(
    datetime-format: "[day padding:none]. [month padding:none]. [year]",
    handout: false
  ),
  config-info(
    title: "Integrated Development Environment",
    subtitle: "textový editor, debugger a kompilátor",
    author: "Adamés Kleopatón z Trolu",
    date: datetime.today(),
    institution: "GEVO"
  )
)

// Formatting Stuff
#set par(
  justify: true
)
#set list(
  indent: 12pt,
)

// Colors
#let crimson = rgb("#B80F0A")
#let airblue = rgb("#00308F")
#let raingreen = rgb("#00755E")

#let clr(body) = {
  text(crimson)[#body]
}
#let clb(body) = {
  text(airblue)[#body]
}
#let clb(body) = {
  text(raingreen)[#body]
}

#title-slide()

= Co je IDE

== Co je IDE

Pod zkratkou *IDE* (Integrated Development Environment) obvykle rozumíme
aplikaci, která obsahuje *textový editor*, *debugger* a *kompilátor* s podporou
aspoň jednoho programovacího jazyka.

#pause

Smyslem *IDE* je existence aplikace, kterou programátor během své práce na daném
projektu nemusí vůbec opustit. Proto *IDE* často obsahují navíc též funkce jako
- správu Git repositářů a integraci s Git cloud platformami (GitHub, AWS, Azure
  Repos, ...),
#pause
- search engine a vbudovaný prohlížeč,
#pause
- real-time collaboration tools (Live Share, Code Sandbox, ...),
#pause
- okno s AI chatbotem,
#pause
- ...

= Textový editor

== Co to je textový editor

Program na úpravu *prostého textu*. Obvykle bývá aspoň jeden textový editor
součástí operačního systému.

#pause

Prostý text vs. formátováný text:
- *Prostý text* sestává z pouhé representace znaků. Každý znak je representován
  buď posloupností dané délky (nejčastěji 1, 2 nebo 4 B) nebo délky
  proměnlivé, podle daného kódování (ASCII, UTF-8, ISO/IEC, ...).
#pause
- Oproti tomu *formátovaný text* obsahuje navíc metadata, formátová data (font a
  velikost písma, tučnost a styl celkově), data o odstavcích (odsazení,
  zarovnání, rozmístění slov a písmen a výšku řádku) a data o stránce (velikost
  a okraje).

== Funkce textového editoru

=== Základní

- *najít a nahradit* (kontrolované nahrazení částí textu podle zadaného stringu
  či regulárního výrazu),
#pause
- *vyjmout, kopírovat a vložit*,
#pause
- čtení prostého textu s UTF-8 kódováním,
#pause
- *základní formátování textu* (obtékání, automatické odsazení),
#pause
- *undo a redo* (historie změn),
#pause
- efektivní posun v dokumentu (skok na řádek, na konec stránky, na konec
  dokumentu atd.).

#pagebreak()
=== Pokročilé

- *profily* (nastavení pro konkrétní soubory či typy souborů),
#pause
- úprava více souborů najednou,
#pause
- úprava po sloupcích,
#pause
- *folding* (skrytí části souboru podle rozsahu řádků či syntaktického prvku),
#pause
- *transformace dat* (sloučení obsahu jiného textového souboru do upravovaného),
#pause
- *zvýraznění syntaxe* (zvýraznění -- barvou, tučností atd. -- částí textu podle
  kontextu závislém na typu upravovaného souboru),
#pause
- *rozšíření* (textové editory pro programátory jsou modulární -- umějí
  integrovat nové funkce podle potřeby a jsou programovatelné),
#pause
- *příkazový řádek* (speciální okno pro spouštění pokročilých funkcí editoru).

= Debugger

== Co to je a co umí debugger

Program, který *spouští a analyzuje* jiné programy.

#pause

=== Funkce debuggeru

- *zastavení běhu* programu na zvoleném příkazu,
#pause
- *krokování* programu příkaz po příkazu,
#pause
- *zobrazení či úprava* obsahu paměti, CPU registrů a zásobníku volání (zásobník
  se zavolanými funkcemi a jejich parametry)

== Jak funguje debugger

=== Debug symbols

Soubory obsahující *samostatně spustitelné kusy strojového kódu* spolu s odkazem
na původní soubor a číslem řádku, jež representují.

#pagebreak()

=== Breakpointy

Něco jako "záložky v knize".

#pause

Proces nastavení breakpointu:
+ Zvolíme číslo řádku v příslušném debuggeru.
#pause
+ Debugger si zapamatuje pozici breakpointu jako číslo řádku a umístění souboru
  s příslušným kódem.
#pause
+ Debugger vloží do paměti za poslední instrukci kódu tzv. *breakpoint trap*,
  speciální CPU instrukci, která zastaví běh programu.
#pause
+ Tato speciální instrukce ukončí proces běžícího programu přes interrupt
  signal.
#pause
+ V moment interruptu předá operační systém kontrolu debuggeru, který je
  navržen, aby na tento signál reagoval zastavením programu (zkrátka nespustí
  další soubor v pořadí).

#pagebreak()

=== Step Into/Out/Over

Jak funguje krokování:
+ Debugger má uložený tzv. *instruction pointer*, ukazatel na další instrukci
  programu, která se má vykonat.
#pause
+ Když program krokujeme, debugger postupně vykonává instrukce pod svým IP.
#pause
+ Po vykonání každé instrukce debugger přečte (přes OS) hodnoty všech
  proměnných definovaných v programu, jejichž adresy má uloženy v tabulce debug
  symbolů. Tímto umožní i zápis do proměnných.

#pagebreak()

=== Vyhodnocení výrazů za běhu

Jak to funguje:
+ Debugger zkompiluje zadaný výraz.
#pause
+ Dosadí za proměnné a funkce adresy uložené v tabulce debug symbolů.
#pause
+ Program spustí a vytiskne výsledek (závislý na typu výrazu -- obvykle před
  výraz zkrátka vloží `return`).

#pause

Tahle funkce též umožňuje existenci *podmínečných breakpointů*.

= Kompilátor

== Co to je a co umí kompilátor

Program na *překlad kódu* z jednoho programovacího jazyka do jiného. Většinou
překládá programy v high-level jazycích do low-level jazyků, v nichž napsané
instrukce už umí OS přímo vykonat.

#pause

Primárně rozlišujeme *single-pass* a *multi-pass* kompilátory.

#pause

Kompilace programu obyčejně probíhá ve třech stádiích: *front end*, *middle end*
a *back end*.

== Single-pass vs. multi-pass

Single-pass kompilátory
- jsou rychlejší,
- vyžadují méně paměti,
- jsou snadno debugovatelné a jejich efektivita snadno měřitelná,
#pause
ale zato
- nepodporují globální proměnné a lokální proměnné musejí být předem
  definovány;
- vyžadují striktní pořadí funkcí a importů,
- nepodporují dynamické typování,
- obecně vyrábějí méně optimalisovaný kód.

== Stádia kompilace

=== Front end

Kompilátor zkontroluje *syntaxi* a *typy proměnných* (ve staticky typovaných
jazycích). Přepíše program do tzv. *mezijazyka* (intermediate representation).

#pause

Postupuje ve (aspoň) třech krocích:
+ Lexikální analýza ('lexing'): *kategorisace symbolů* na proměnné, klíčová
  slova, funkce, hodnoty, pomocné symboly atd.
#pause
+ Syntaktická analýza ('parsing'): tvorba *derivačního stromu* (parse tree), se
  kterým kompilátor pracuje v dalších stádiích.
#pause
+ Semantická analýza: kontrola typů, deklarace proměnné před použitím, existence
  návratové hodnoty v každé větvi funkce atd.

#pagebreak()

#figure(
  image("front-end.gif", height: 85%)
)

#pagebreak()

=== Middle end

Též *optimalisace*. Kompilátor přetvoří derivační strom do časově i prostorově
více efektivní podoby.

#pause

Postupuje ve (aspoň) dvou krocích:
+ *Analýza*: kompilátor vyrobí *control-flow graph* (vlastně flowchart) průběhu
  každé funkce a též *call graph* celého programu. Ty se použijí k
  #pause
  - sestrojení *use-define* řetězců (vlastně řetězce deklarace proměnné a jejích
    použití),
  #pause
  - analýze *závislostí* (kus kódu $Y$ závisí na kusu kódu $X$, když se $X$ musí
    spustit před $Y$),
  #pause
  - analýze *ukazatelů* (vytvoření tabulky adres, na které proměnné v programu
    ukazují),
  #pause
  - ...

#pagebreak()

=== Middle end


2. *Optimalisace*: na základě předchozí analýzy převede kompilátor derivační
  strom do funkčně ekvivalentní a více efektivní podoby. Mezi optimalisační
  techniky patří
  - *inline expansion*: nahrazení volání funkce jejím obsahem,
  #pause
  - *dead-code elimination*: odstranění nedosažitelného kódu (pomocí CFG),
  #pause
  - *constant folding*: výpočet konstant nezávislých na předchozím kódu,
  #pause
  - *transformace cyklů*: metody zrychlení cyklů (např. _distribuce_ a
    _sjednocení_, _permutace_, ...),
  #pause
  - *odstranění zbytečných proměnných*: proměnné ukazující ve stejný čas na
    stejnou adresu jsou sjednoceny v jednu,
  #pause
  - *automatická paralelisace*: kusy kódu, které mohou být provedeny souběžně se
    rozdělí mezi procesorová jádra (příkladem jsou podmínky, jejichž všechny
    větve se někdy vykonají, ale nezávisejí na sobě).

#pagebreak()

=== Back end

Kompilátor přeloží optimalisovaný derivační strom do *CPU instrukcí* a vytvoří
*strojový kód*.

#pause

Probíhá ve (přinejmenším) dvou fázích:
+ Optimalisace *podle stroje*: optimalisace kódu závislá na specifických
  parametrech CPU, na němž má být program spouštěn. Příkladem je tzv. *peephole
  optimisation*, kdy kompilátor nahrazuje sady obecných CPU instrukcí za
  efektivnější sady cílového CPU;
#pause
+ *Generování kódu*: optimalisovaný kód je přeložen do strojového jazyka
  cílového systému (třeba `C` pro Linux a `NASM` pro Windows). Tento proces
  zahrnuje například
  #pause
  - rozhodnutí, které proměnné uložit v paměti a které v registrech,
  #pause
  - rozdělení výpočetní síly paralelně běžícím kusům kódu,
  #pause
  - generování debug symbolů a tabulek.
