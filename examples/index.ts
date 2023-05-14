//@ts-ignore
import { Elm } from "./Main.elm";
import defo from "@icelab/defo";

const views = {
  pidg: function (el: any, trans: string) {
    console.log("Pidg initiated");
    return {
      update: function (newName: string, oldName: string) {
        console.log("Updated pidg");
      },
    };
  },
};

const app = Elm.Main.init({
  node: document.querySelector("main"),
  flags: null,
});

defo({ views });
