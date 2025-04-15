import AddJudge from "./addcomps/add_judge.jsx";
import AddCompetition from "./addcomps/add_competition.jsx";
import AddVysledky from "./addcomps/add_vysledky.jsx";

import ViewJudge from "./viewcomps/view_judge.jsx";
import ViewCompPoints from "./viewcomps/view_comp_points.jsx";

import FeatureButton from "./feature_button.jsx";

import { useState } from "react";
import "./App.css";

function App() {
  const [viewFeature, setViewFeature] = useState("");
  const [addFeature, setAddFeature] = useState("");

  const viewFeatures = ["ViewJudge", "ViewCompPoints", "Option 3", "Option 4"];
  const addFeatures = ["AddJudge", "AddCompetition", "AddVysledky"];
  return (
    <>
      <div className="wholeting">
        <div className="choosers">
          <div className="choosing">
            <h1>What you want to see</h1>
            <div className="buttons">
              {viewFeatures.map((lab, index) => (
                <FeatureButton
                  label={lab}
                  key={index}
                  onChoose={setViewFeature}
                  choosen={viewFeature}
                />
              ))}
            </div>
          </div>

          <div className="chosing">
            <h1> What you want to add? </h1>

            <div className="buttons">
              {addFeatures.map((lab, index) => (
                <FeatureButton
                  label={lab}
                  key={index}
                  onChoose={setAddFeature}
                  choosen={addFeature}
                />
              ))}
            </div>
          </div>
        </div>
        <div className="features">
          <div className="viewing">
            {viewFeature == "ViewJudge" && <ViewJudge />}
            {viewFeature == "ViewCompPoints" && <ViewCompPoints />}
          </div>
          <div className="adding">
            {addFeature == "AddJudge" && <AddJudge />}
            {addFeature == "AddCompetition" && <AddCompetition />}
            {addFeature == "AddVysledky" && <AddVysledky />}
          </div>
        </div>
      </div>
    </>
  );
}

export default App;
