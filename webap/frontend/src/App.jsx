import AddJudge from "./addcomps/add_judge.jsx";
import AddCompetition from "./addcomps/add_competition.jsx";
import ChooseCompetition from "./addcomps/choose_competition.jsx";

import ViewJudgeSuccess from "./viewcomps/view_judge_success.jsx";
import ViewCompPoints from "./viewcomps/view_comp_points.jsx";

import FeatureButton from "./feature_button.jsx";

import { useState } from "react";
import "./App.css";

function App() {
  const [viewFeature, setViewFeature] = useState("");
  const [addFeature, setAddFeature] = useState("");

  const viewFeatures = [
    "ViewJudgeSuccess",
    "ViewCompPoints",
    "Option 3",
    "Option 4",
  ];
  const addFeatures = ["AddJudge", "AddCompetition", "ChooseCompetition"];
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
            {viewFeature == "ViewJudgeSuccess" && <ViewJudgeSuccess />}
            {viewFeature == "ViewCompPoints" && <ViewCompPoints />}
          </div>
          <div className="adding">
            {addFeature == "AddJudge" && <AddJudge />}
            {addFeature == "AddCompetition" && <AddCompetition />}
            {addFeature == "ChooseCompetition" && <ChooseCompetition />}
          </div>
        </div>
      </div>
    </>
  );
}

export default App;
