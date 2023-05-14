import { AllMessages, i18n } from "@lingui/core";
import defo from "@icelab/defo";

type Trans = {
  locale: string;
  id: string;
};

export function load(messages: AllMessages) {
  i18n.load(messages);

  const views = {
    pidg: function (el: HTMLElement, trans: Trans) {
      i18n.activate(trans.locale);
      const message = i18n._({ id: trans.id });
      const textNode = document.createTextNode(message);
      el.appendChild(textNode);
      return {
        update: function (newTrans: Trans, _oldTrans: Trans) {
          i18n.activate(newTrans.locale);
          const message = i18n._({ id: trans.id });
          el.childNodes[0].textContent = message;
        },
      };
    },
  };

  defo({ views });
}
