search_input = document.getElementById("search-input");
whatToSearch = document.getElementById("users");

debounce = (f, timeout = 350) => {
  let timer;
  return (...args) => {
    clearTimeout(timer);
    timer = setTimeout(() => {
      f.apply(this, args);
    }, timeout);
  };
};

request_search = debounce(e => {
  fetch("/users?query=" + e.target.value, {
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
      whatToSearch.innerHTML = text;
    });
}, 450);

search_input.addEventListener("input", e => {
  request_search(e);
});
