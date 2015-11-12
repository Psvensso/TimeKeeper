import React from "react";
import {ItemsStore} from "../Stores/ItemsStore";

const {ul, li} = React.DOM;

export default class List extends React.Component {
    constructor() {
        super();
        this.state = {
            items: []
        };
    }

    componentDidMount(){
        this.changes = ItemsStore.db.changes({
            since: 'now',
            live: true,
            include_docs: true
        }).on('change', (change) => {
            console.log(change);
            this.state.items.push(change.doc);
            this.setState({
                items: this.state.items
            });
        }).on('complete', function(info) {

        }).on('error', function (err) {

        });
    }

    componentWillUnmount(){
        changes.cancel();
    }

    render() {
        return ul(null, this.state.items.map(i =>{ return li({key: i._id}, i.value);}));
    }
}
