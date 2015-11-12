import PouchDB from "pouchdb";

//Private
var db = new PouchDB('ItemsStore');


export class ItemsStoreClass{
    constructor(){
        window.store = db;
    }

    get db(){
        return db;
    }
}

export const ItemsStore = new ItemsStoreClass();
