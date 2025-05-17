import { useState, useEffect } from "react";
import axios from "axios";

export default function AddVysledky({ id }) {
  const [data, setData] = useState([]);
  const [finals, setFinals] = useState();
  const [category, setCategory] = useState("E");
  const [judgeNum, setJudgeNum] = useState(0);

  useEffect(() => {
    const getcomp = async () => {
      try {
        const comp_data = await axios.get(`api/getcomp?id=${id}`);
        console.log(comp_data.data);
        setCategory(comp_data.data.category);
        setJudgeNum(Number(comp_data.data.numJudges));
      } catch (err) {
        console.log(err.message);
      }
    };
    getcomp();
  }, [id]);

  let dances = [];

  switch (category) {
    case "E":
      dances = ["Samba", "Chacha", "Jive"];
      break;
    case "D":
      dances = ["Samba", "Chacha", "Rumba", "Jive"];
      break;
    case "C":
    case "B":
    case "A":
      dances = ["Samba", "Chacha", "Rumba", "Paso Doble", "Jive"];
      break;
  }

  const handleOnChange = (e) => {
    let newData = [...data];
    const index = Number(e.target.dataset.index);

    newData[index] = { ...newData[index], [e.target.name]: e.target.value };
    setData(newData);
  };
  const handleFinalsChange = (e) => {
    let newFinals = { ...finals };
    newFinals[e.target.name] = e.target.value;
    setFinals(newFinals);
  };

  const handleKeys = (e) => {
    if (
      ["x", "-", "Backspace", "Tab", "ArrowRight", "ArrowLeft", "v"].indexOf(
        e.key,
      ) == -1
    ) {
      e.preventDefault();
    }
  };

  const handleFinalKeys = (e) => {
    if (
      [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "Backspace",
        "Tab",
        "ArrowRight",
        "ArrowLeft",
        "v",
      ].indexOf(e.key) == -1
    ) {
      e.preventDefault();
    }
  };

  const addFinalko = () => {
    if (!finals) {
      setFinals({});
    } else {
      alert("uz jedno finalko mas");
    }
  };
  const addKolo = () => {
    let newData = [...data];
    newData.push({});
    setData(newData);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post("api/addvysledky", {
        data: data,
        finals: finals,
        id: id,
        category: category,
      });
      setData([]);
      setFinals();

      console.log(response.message);
    } catch (err) {
      alert("je to v pice");
      console.log(err);
    }
  };

  const assignStyle = (dance, kolo) => {
    try {
      const length = data[kolo][dance].length;
      if (length < judgeNum) {
        const rednes = 255 - (length / judgeNum) * 255;
        return `rgb(${rednes},0,0)`;
      }
      if (length == judgeNum) {
        return "rgb(0,125,0)";
      }
      if (length > judgeNum) {
        return "rgb(0,0,0)";
      }
    } catch (err) {
      console.log(err);
      return "";
    }
  };

  return (
    <>
      <h1> Sem zadej vysledky </h1>
      <form className="vysledkyForm" onSubmit={handleSubmit}>
        {data.map((info, kolokey) => (
          <div className="kolo" key={kolokey}>
            <h3> Toto je kolo {kolokey} </h3>
            <div className="inputs" key={kolokey}>
              {dances.map((dance, key) => (
                <div
                  className="vysledky"
                  key={key}
                  style={{
                    backgroundColor: assignStyle(dance, kolokey),
                  }}
                >
                  <div class="nadpis">
                    <span>{dance}</span>
                    <span>
                      {data[kolokey][dance] ? data[kolokey][dance].length : 0}/{" "}
                      {judgeNum}
                    </span>
                  </div>
                  <input
                    type="text"
                    value={info.dance}
                    name={dance}
                    data-index={kolokey}
                    onKeyDown={handleKeys}
                    autoComplete="off"
                    onChange={handleOnChange}
                  />
                </div>
              ))}
              <div className="vysledky">
                <p> koule pero </p>
                <input
                  type="number"
                  value={info.pary}
                  onChange={handleOnChange}
                  data-index={kolokey}
                />
              </div>
            </div>
          </div>
        ))}

        {finals && (
          <div className="kolo">
            <h3> toto je finalko </h3>
            <div className="inputs">
              {dances.map((dance, key) => (
                <div className="vysledky" key={key}>
                  <p>{dance}</p>
                  <input
                    type="text"
                    value={finals.dance}
                    name={dance}
                    autoComplete="off"
                    onChange={handleFinalsChange}
                    onKeyDown={handleFinalKeys}
                  />
                </div>
              ))}
              <div className="vysledky">
                <p> koule pero </p>
                <input
                  type="number"
                  value={finals.pary}
                  onChange={handleFinalsChange}
                />
              </div>
            </div>
          </div>
        )}
        <div className="buttons">
          <button type="button" onClick={addKolo}>
            AddKolo
          </button>
          <button type="button" onClick={addFinalko}>
            Addfinalko
          </button>
          <button>Submit</button>
        </div>
      </form>
    </>
  );
}
