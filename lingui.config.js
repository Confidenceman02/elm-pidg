/** @type {import('@lingui/conf').LinguiConfig} */
module.exports = {
  locales: ["en", "cs", "fr"],
  sourceLocale: "en",
  catalogs: [
    {
      path: "examples/locales/{locale}/messages",
      include: ["examples/"],
    },
  ],
  format: "po",
};
