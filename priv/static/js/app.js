import React from "react";
const {div, h4, p, a, i} = React.DOM;
import {render} from "react-dom";
import List from "./Components/List";
import Create from "./Components/Create";



render(React.DOM.div(null,
    React.createElement(List, null),
    React.createElement(Create, null)
), document.getElementById("mainApp"));
