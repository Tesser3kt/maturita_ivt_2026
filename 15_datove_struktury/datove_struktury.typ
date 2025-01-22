#import "@preview/touying:0.5.5": *
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
    handout: true
  ),
  config-info(
    title: "Datové struktury",
    subtitle: "pole, seznam, záznam, hash, strom, zásobník, fronta",
    author: "Adamus Colepaticius Trolo",
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

#title-slide()

= Datová struktura obecně

== Co to je datová struktura

Datová struktura je zkrátka řád uložení velkého množství souvisejících dat ve
vnitřní paměti.

#pause

Při jejím návrhu pracujeme téměř výhradně s von Neumannovým modelem počítače a
uvažujeme, že vnitřní paměť je #alert[*random access*], tedy na danou adresu je
možný okamžitý přístup.

#pause

Podle řešeného problému volíme datovou strukturu tak, aby #alert[*nejčastější
operace*] trvaly, co nejkratčeji.

== Operace na datové struktuře

Budeme datové struktury hodnotit z hlediska rychlosti provedení následujících
operací:
- uložení (tedy i přepsání) hodnoty na danou pozici
#pause
- přečtení hodnoty na dané pozici
#pause
- přidání hodnoty na jeden z konců
#pause
- odebrání hodnoty z jednoho z konců
#pause
- přidání hodnoty na libovolnou pozici
#pause
- odebrání hodnoty z libovolné pozice
#pause
- nalezení prvku s danou hodnotou

= Konkrétní struktury

== Pole (Array)

Pole je jednoduchá datová struktura #alert[*s danou délkou*], jež ukládá hodnoty
do vnitřní paměti bezprostředně za sebou. Přístup k hodnotám probíhá přes
#alert[*indexy*] -- vlastně počet míst v paměti od začátku pole.

#pause

#figure(
  image("figs/array.svg", width: 80%)
)
#pagebreak()

=== Náročnost operací

- uložení i přepis hodnoty podle indexu: *instantní*
  - Zkrátka zapíšu hodnotu do RAM na *`začátek pole + index`*.
#pause
- odebrání hodnoty ze zadního konce: *instantní* 
  - Zmenším velikost pole o 1.
#pause
- odebrání hodnoty na jiné pozici: *úměrné délce pole*
  #list[
    Po odebrání je potřeba přesunout všechny hodnoty s vyšším indexem o jeden
    index doleva.
  ]
#pause
- přidání prvku kamkoliv: *úměrné délce pole*
  #list[
    Může se stát, že pole kolem sebe nemá v paměti místo, takže je potřeba je
    *překopírovat jinam*.
  ]
#pause
- nalezení konkrétní hodnoty: *úměrné délce pole*
  - Prostě musím celé pole projít hodnotu po hodnotě.

== Seznam (List)

Datová struktura složená z *uzlů*. Každý uzel obsahuje dvě data:
#pause
- *hodnotu*,
#pause
- *adresu v paměti* s následujícím uzlem.
#pause
Uzly nemusejí být v paměti seřazeny za sebou.
#pause
#figure(
  image("figs/list.svg", width: 60%)
)
#pagebreak()

=== Náročnost operací

- uložení i přepis hodnoty podle indexu: *úměrné délce seznamu*
  #list[
    Musím procházet seznam od *začátku*, dokud se nedostanu na danou pozici.
  ]
#pause
- přidání na jeden z konců / odebrání z jednoho z konců: *instantní*
  #list[
    Stačí připojit další uzel a upravit ten předchozí / následující.
  ]
#pause
- přidání / odebrání podle indexu: *úměrné délce seznamu*
  #list[
    Samotný proces přidání / odebrání je instantní, ale musím se na daný index
    nejprve dostat.
  ]
#pause
- nalezení konkrétní hodnoty: *úměrné délce seznamu*
  #list[
    Musím seznam procházet od začátku, dokud hodnotu nenajdu.
  ]

