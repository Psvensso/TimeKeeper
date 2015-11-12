import React from "react";
import {ItemsStore} from "../Stores/ItemsStore";
const {div,input, form, button} = React.DOM;

export default class Create extends React.Component {
    constructor() {
        super();
        this.store = ItemsStore;
    }

    onSubmit(e) {
        e.preventDefault();
        var val = this.refs.input.value;
        if(val !== "") ItemsStore.db.post({value: val});
        this.refs.form.reset();
    }

    render() {
        return form({
            ref: "form",
                onSubmit: this.onSubmit.bind(this)
            },
            div({className: "form-group row"}, input({ref: "input", type: "text"})),
            div({className: "form-group row"}, button({type: "submit", className: "btn btn-secondary"}, "Add"))
        );
    }
}
