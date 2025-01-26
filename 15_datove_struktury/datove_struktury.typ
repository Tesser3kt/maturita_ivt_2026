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
    subtitle: "pole, seznam, záznam, hash, binární strom, zásobník, fronta",
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
  image("figs/array.png", width: 80%)
)
#pagebreak()

=== Náročnost operací

- uložení, přepis i přečtení hodnoty podle indexu: *instantní*
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
  image("figs/list.png", width: 60%)
)
#pagebreak()

=== Náročnost operací

- uložení, přepis i přečtení hodnoty podle pozice: *úměrné délce seznamu*
  #list[
    Musím procházet seznam od *začátku*, dokud se nedostanu na danou pozici.
  ]
#pause
- přidání na jeden z konců / odebrání z jednoho z konců: *instantní*
  #list[
    Stačí připojit další uzel a upravit ten předchozí / následující.
  ]
#pause
- přidání / odebrání podle pozice: *úměrné délce seznamu*
  #list[
    Samotný proces přidání / odebrání je instantní, ale musím se na danou pozici
    nejprve dostat.
  ]
#pause
- nalezení konkrétní hodnoty: *úměrné délce seznamu*
  #list[
    Musím seznam procházet od začátku, dokud hodnotu nenajdu.
  ]

== Záznam (Record, Struct)

Datová struktura obsahující množství *pojmenovaných* údajů často různých
datových typů.
#pause
Jména údajů jsou vlastně *proměnné uchovávající adresu v paměti*, kde začíná
příslušná část záznamu.
#pause
#figure(
  image("figs/record.png", width: 50%)
)
#pagebreak()

=== Náročnost operací
- uložení / přepis / přečtení hodnoty podle jména: *instantní*
  #list[
    Proměnná s daným jménem prostě ukazuje na adresu v RAM.
  ]
#pause
- přidání / odebrání na koncích: *nedává smysl*
  #list[
    Záznam nemá konce lol.
  ]
#pause
- přidání / odebrání podle jména: *nelze*
  #list[
    Některé struktury jako třeba `dict` v Pythonu přidání umožňují, ale v
    principu *nelze* proměnné záznamu mazat, upravovat ani přidávat.
  ]
#pause
- nalezení konkrétní hodnoty: *úměrné počtu proměnných v záznamu*
  #list[
    Záznam musím procházet proměnnou po proměnné a hledat hodnotu.
  ]

== Hash Table

Struktura stvořená pro okamžité nalezení dané hodnoty podle klíče.\
#pause
Pomocí předem dané *"hashovací" funkce* převádí hodnoty *klíče* na *adresy* v
paměti, kam potom ukládá *hodnoty*.\
#pause
Hashovací funkce je *málokdy prostá*; vzniklé kolize se řeší různě, například
řetězením hashovacích funkcí.
#pause
#figure(
  image("figs/hash.png", width: 100%)
)
#pagebreak()

=== Náročnost operací

- uložení / přečtení / přepis hodnoty podle klíče: *instantní*
  #list[
    Spočívá v aplikaci hashovací funkce, která obvykle trvá úměrně délce klíče.
  ]
#pause
- přidání hodnoty s klíčem: *obvykle instantní*
  #list[
    Často stačí aplikace hashovací funkce. Kolize ale mohou způsobit zpomalení.
  ]
#pause
- odebrání hodnoty podle klíče: *nedává smysl*
  #list[
    Odebrání klíče nelze učinit, protože se jedná pouze o vstup do uložené
    hashovací funkce. Klíče samotné nikde uloženy nejsou.
  ]
#pagebreak()

=== Náročnost operací
- nalezení klíče: *instantní*
  #list[
    Stačí ověřit, zda je něco uloženou pod hashem klíče.
  ]
#pause
- nalezení hodnoty: *nemožné*
  #list[
    Základní hash table nikde neuchovává pozice v paměti všech svých hodnot.
    Struktury jako třeba `dict` v Pythonu tenhle problém řeší ukládáním hodnot
    (i klíčů) do vhodných datových struktur.
  ]

== Binární strom (Binary Search Tree)

Binární strom je struktura složená z *uzlů* s nulou až dvěma *následníky*.\
#pause
Uzly jsou obvykle umístěny tak, aby první následník měl menší hodnotu než daný
uzel a druhý následník měl hodnotu větší.\
#pause
To umožňuje v binárním stromě hledat uzly s danou hodnotou v čase *úměrném
výšce* (a nikoli délce) stromu.\
#pause
#figure(
  image("figs/binary-tree.png", width: 60%)
)
#pagebreak()

=== Náročnost operací

- uložení hodnoty: *úměrné výšce stromu*
  #list[
    Uložení hodnoty *na přesnou pozici* nelze. Uzel s hodnotou se umístí podle
    její velikosti.
  ]
#pause
- přepsání hodnoty na dané pozici: *úměrné výšce stromu*
  #list[
    Uzel s přepsanou hodnotou se musí často ve stromě přesouvat.
  ]
#pause
- přečtení hodnoty na dané pozici: *úměrné výšce stromu*
  #list[
    Je třeba procházet strom od kořene dolu.
  ]
#pause
- odebrání hodnoty podle pozice: *úměrné výšce stromu*
  #list[
    Samotné odebrání je okamžité, ale je třeba se od uzlu nejprve dostat.
  ]
#pause
- nalezení dané hodnoty: *úměrné výšce stromu*
  #list[
    Podle velikost hodnoty jdu z každého uzlu buď do prvního, nebo do druhého
    následníka.
  ]
