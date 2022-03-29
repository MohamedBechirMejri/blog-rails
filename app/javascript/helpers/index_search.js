const search_input = document.getElementById("search-input");

search_input.addEventListener("input", e => {
  fetch("/posts?query=" + e.target.value, {
    method: "GET",
    headers: {
      Accept: "application/javascript",
      "X-CSRF-Token": document.getElementsByName("csrf-token")[0].content,
      "X-Requested-With": "XMLHTTPRequest",
    },
  })
    .then(res => {
      return res.text();
    })
    .then(text => {
      document.getElementById("posts").innerHTML = text;
    });
});
