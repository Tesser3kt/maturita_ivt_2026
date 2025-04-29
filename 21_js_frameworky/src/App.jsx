// cokoliv s "use" na začátku je "hák". Ty se pustí vždycky při načtení dané komponenty.
import { useState } from "react";
// styly nejsou super
import "./App.css";

// takhe píšeme funkce v JS
function App() {
  // k tomuhle používáme háky. Ta webovka se nerefreshuje pořád (očividně
  // špatný nápad) a tak za nás React dává pozor (pomocí té funkce "setPromena") na změnu těch důležitých
  // proměných, na které použijeme useState. Jednoduše: při každé spuštění
  // "setPromena" funkce se celá komponenta refreshne.

  const [logedIn, setLogedIn] = useState(false);
  // Kazda komponenta musi vracet HTML tag v ktery se ma rozvinout.
  return (
    <>
      <p> Toto je moje stranka</p>
      {/* Muzu pouzit JS v HTML kdyz ho obalim do chlupatych zavorek. Zaroven se
      hodi jednoradnovy if syntax- podminka ? pokud true : pokud false. LogIn je
      moje komponenta ktere jako argument davam JS promenou takze musi byt v
      zavorkach */}
      {!logedIn ? (
        <LogIn setLogedIn={setLogedIn} />
      ) : (
        <p> jsi prihlaseny nadhera</p>
      )}
    </>
  );
}

// Definuji si svoji vlastni promenou co budu moct pouzivat jako HTML tag i s
// agrument co ceka. Jako argument chci funkci co meni logedIn a ne tu samotnou
// hodnotu, protoze me nezajima hodnota ale chci ji jen zmenit
function LogIn({ setLogedIn }) {
  // Definuji si lokalni promenou aby ukladalo to co uzivatel napsal do toho
  // formulare. Chci aby to bylo pres useState protoze takhle to muzu vypsat
  // jako hodnotu toho inputu a uzivatel vidi co napsal.
  const [data, setData] = useState({
    name: "",
    password: "",
  });

  // tuhle funkci musim definovat abych ji mohl narvat formulari
  const hangleSubmit = (e) => {
    e.preventDefault();
    // Kdyz se moje arbitrarni podminky naplni tak pouziji ten argument a nastavim logedIn na true.
    if (data.name == "Pavel" && data.password == "heslo") {
      setLogedIn(true);
    } else {
      alert("smula kamo");
      setData({
        name: "",
        password: "",
      });
    }
  };

  // tahle funkce se vola pokazde co uzivatel zmeni hodnotu nejakeho inputu.
  // argument je ten event co se stal a ten ma v sobe novou hodnotu toho inputu
  // a i jeho jmeno. Proto je dulezite mit v tom data stejne klice jako jsou
  // jmena tech inputu.
  const handleChange = (e) => {
    // ty tri tecky jsou tvz 'spread syntax' takze '...data' skopiruje vsechny
    // uz existujici data a '[name]:value' k nim prida nebo zmeni jednu
    // key:value pair.
    // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax
    setData({ ...data, [e.target.name]: e.target.value });
  };

  return (
    //Tady definujeme co se rozbali na miste <LogIn /> komponenty
    <>
      <h1> Prihlaš se pls </h1>
      {/* jako hodnotu onSubmit davame JS promenou ktera je ale zaroven funkce */}
      <form onSubmit={hangleSubmit}>
        <input
          type="text"
          // tohle chceme aby se to dalo zapsat do 'data'
          name="name"
          // tohle chceme aby bylo videt co uzivatel pise
          value={data.name}
          // stejne jako s onSubmitem jen jina funkce
          onChange={handleChange}
        />
        <input
          type="password"
          name="password"
          value={data.password}
          onChange={handleChange}
        />
        <button type="submit"> Prihlasit</button>
      </form>
    </>
  );
}
// abychom mohli pouzit tag <App/> v jinych souborech musime ho exportovat.
// pouziva se v main.jsx ktere se importuje v index.html (to je jedine co ten soubor dela)
export default App;
