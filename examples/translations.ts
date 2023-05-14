import { AllMessages, i18n } from "@lingui/core";
import defo from "@icelab/defo";

export function load(defaultLocale: string = "en", messages: AllMessages) {
  i18n.load(messages);
  i18n.activate(defaultLocale);

  const views = {
    pidg: function (el: HTMLElement, trans: string) {
      console.log("This is all PIDG");
      const message = i18n._({ id: trans });
      const textNode = document.createTextNode(message);
      el.appendChild(textNode);
      return {
        update: function (_newName: string, _oldName: string) {
          console.log("Updated pidg");
        },
      };
    },
  };

  defo({ views });
}
