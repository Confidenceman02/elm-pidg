//@ts-ignore
import { Elm } from "./Main.elm";
import { load } from "../dist-pidg/translations";
import { AllMessages } from "@lingui/core";
const en = require("./locales/en/messages");
const fr = require("./locales/fr/messages");

const messages: AllMessages = {
  en: en.messages,
  fr: fr.messages,
};

load("en", messages);

const app = Elm.Main.init({
  node: document.querySelector("main"),
  flags: null,
});
