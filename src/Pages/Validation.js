export function validateFormImpl(doc) {
  return function (cssClass) {
    return function (queryObj) {
      return function () {
        console.log(cssClass, queryObj);
        return $(doc).ready(function () {
          $(cssClass).form(queryObj);
        });
      };
    };
  };
}
