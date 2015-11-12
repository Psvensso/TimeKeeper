import PouchDB from "pouchdb";

//Private
var db = new PouchDB('ItemsStore');


export class ItemsStoreClass{
    constructor(){
        window.store = db;
    }

    get items(){
        return store.allDocs({
            include_docs: true,
            attachments: true
        }).then(function (result) {
            console.log(result);
            return result;
        });
    }


    get db(){
        return db;
    }


}

export const ItemsStore = new ItemsStoreClass();
