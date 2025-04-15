import { useState } from "react";
import axios from "axios";

export default function AddCompetition() {
  const [formData, setFormData] = useState({
    place: "",
    category: "",
    points: "",
    finals: "",
    date: "",
  });
  const [judges, setJudges] = useState([["", 0]]);
  const [checked, setChecked] = useState(false);

  const categories = ["Kategorie", "E", "D", "C", "B", "A"];

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };
  const handleJudgeChange = (index, input) => {
    const newJudges = [...judges];
    newJudges[index] = [input, 0];
    setJudges(newJudges);
  };

  const handleAddJudge = () => {
    setJudges([...judges, ["", 0]]); // Add a new empty input
  };

  const handleRemoveJudge = () => {
    setJudges([...judges].splice(0, judges.length - 1));
  };

  const handleCheckJudges = async () => {
    try {
      const allJudges = await axios.get("api/alljudges");
      const names = allJudges.data.names;
      console.log(names);
      let notIn = [];
      console.log(notIn);
      for (let i = 0; i < judges.length; i++) {
        if (names.includes(judges[i][0])) {
          continue;
        }
        notIn.push(judges[i]);
      }

      console.log(notIn);
      if (notIn.length == 0) {
        setChecked(!checked);
      } else {
        let newJudges = [...judges];
        for (let i = 0; i < notIn.length; i++) {
          let index = judges.indexOf(notIn[i]);
          newJudges[index] = [notIn[i][0], 1];
        }
        setJudges(newJudges);
        alert("jeden ze soudcu jeste neni v databazi musis ho pridat");
      }
    } catch (err) {
      alert("eror kokote");
      console.log(err);
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!checked) {
      alert("musis checknout soudce kokote");
      return false;
    }
    try {
      const response = await axios.post("api/addcompetition", formData);
      alert(response.data.id);
      const id = response.data.id;
      // backed here should return the id of the comp that was added
      setFormData({
        place: "",
        category: "",
        points: "",
        finals: "",
        date: "",
      });
      let names = [];
      for (let i = 0; i < judges.length; i++) {
        names.push(judges[i][0]);
      }
      const vysledky = await axios.post("api/linkjudges", {
        names: names,
        id: id,
      });

      alert(vysledky.message);
    } catch (error) {
      console.error("Spadlo ti addcomp:", error);
      //TODO create special eror for duplicate name entry.
    }
  };

  const addJudge = async (name, index) => {
    try {
      const response = await axios.post("api/addjudge", { name: name });
      alert("pridal jsem tam toho typka", response.data.name);
      let newJudges = [...judges];
      newJudges[index] = [name, 0];
      setJudges(newJudges);
    } catch (err) {
      console.log(err);
    }
  };

  return (
    <form
      onSubmit={handleSubmit}
      style={{
        display: "flex",
        flexDirection: "column",
        gap: "10px",
        maxWidth: "300px",
      }}
    >
      <div className="form">
        <div className="CompetitionGeneral">
          Kde jsi byl?
          <input
            type="text"
            name="place"
            value={formData.place}
            onChange={handleChange}
            placeholder="Místo"
            required
          />
          <br />
          Co jste jeli za kategorii?
          <select
            name="category"
            value={formData.category}
            onChange={handleChange}
            required
          >
            {categories.map((cat, index) => (
              <option value={cat} key={index}>
                {cat}
              </option>
            ))}
          </select>
          <br />
          Kolik jste získaly bodů?
          <input
            type="number"
            name="points"
            min="0"
            max="100"
            step="1"
            value={formData.points}
            onChange={handleChange}
            required
          />
          <br />
          Kdy jste jeli?
          <input
            type="date"
            name="date"
            value={formData.date}
            onChange={handleChange}
            required
          />
          <br />
          Máte F?
          <input
            type="checkbox"
            name="finals"
            value="1"
            onChange={handleChange}
          />
          <button type="submit"> Submit </button>
        </div>
        <div className="CompetitionJudges">
          <div className="JudgesInputs">
            {judges.map(([judgeName, exists], index) => (
              <div
                key={index}
                className="JudgeInput"
                id={exists == 1 ? "notin" : undefined}
              >
                Soudce {index + 1}
                <input
                  type="text"
                  value={judgeName}
                  onChange={(e) => handleJudgeChange(index, e.target.value)}
                />
                {exists == 1 && (
                  <button
                    type="button"
                    onClick={() => addJudge(judgeName, index)}
                  >
                    Add?
                  </button>
                )}
              </div>
            ))}
          </div>
          <button type="button" onClick={handleAddJudge}>
            Add judge
          </button>
          <button type="button" onClick={handleRemoveJudge}>
            Remove judge
          </button>
          <button type="button" onClick={handleCheckJudges}>
            CheckJudges
          </button>
        </div>
      </div>
    </form>
  );
}
